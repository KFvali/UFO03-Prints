namespace Keyfor.UFO03.Prints;

using Microsoft.Sales.Customer;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Item.Catalog;
using Microsoft.Finance.VAT.Setup;
using Microsoft.Pricing.PriceList;
using System.Text;

report 50008 "Frontalino barcode label"
{
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = FrontalinoBarcodeLabel;
    ApplicationArea = All;
    CaptionML = ENU = 'Frontalino barcode label', ITA = 'Frontalino etichetta barcode';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(Item; Item)
        {
            column(No_; "No.") { }
            column(BarCode; BarCode) { }
            column(Description; Description) { }
            column(Description_2; "Description 2") { }
            column(Item_Disc__Group; "Item Disc. Group") { }
            column(Vat_Price; Vat_Price) { }
            column(NascondiPrezzo; NascondiPrezzo) { }

            trigger OnAfterGetRecord()
            var
                //CustomSetup: Record "MMA04 Custom Setup";
                ItemReference: Record "Item Reference";
                Customer: Record Customer;
                BarcodeString: Text;
                BarcodeFontProvider: Interface "Barcode Font Provider";
                BarcodeSymbology: Enum "Barcode Symbology";
            begin
                // CustomSetup.Reset();
                // CustomSetup.Get();
                // CustomSetup.TestField("MMA04 Default Customer No.");

                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarcodeSymbology := Enum::"Barcode Symbology"::Code39;

                ItemReference.Reset();
                ItemReference.SetRange("Item No.", Item."No.");
                ItemReference.SetRange("Reference Type", ItemReference."Reference Type"::"Bar Code");
                ItemReference.SetRange("Reference Type No.", '');
                ItemReference.SetFilter("Reference No.", '<>%1', '');
                if ItemReference.IsEmpty then
                    Error(ErrTxt001, Item."No.");

                if ItemReference.Count > 1 then
                    Error(ErrTxt002, Item."No.");

                ItemReference.FindFirst();

                BarCode := ItemReference."Reference No.";
                // BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
                // BarCode := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);

                Customer.Reset();
                //Customer.Get(CustomSetup."MMA04 Default Customer No.");

                GetValidPrice(Customer."Customer Price Group");
                AddVATOnPrice(Customer."VAT Bus. Posting Group");
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU = 'Options', ITA = 'Opzioni';

                    field(HidePrices; NascondiPrezzo)
                    {
                        CaptionML = ENU = 'Hide price', ITA = 'Nascondi prezzo';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    rendering
    {
        layout(FrontalinoBarcodeLabel)
        {
            Type = RDLC;
            LayoutFile = 'Frontalino barcode label.rdlc';
        }
    }

    #region LOCALS

    local procedure GetValidPrice(pSourceNo: Code[20])
    var
        PriceListLine: Record "Price List Line";
    begin
        Vat_Price := 0;
        PriceListLine.Reset();
        PriceListLine.SetCurrentKey("Starting Date");
        PriceListLine.SetRange("Source No.", pSourceNo);
        PriceListLine.SetRange("Source Type", PriceListLine."Source Type"::"Customer Price Group");
        PriceListLine.SetRange("Asset Type", PriceListLine."Asset Type"::Item);
        PriceListLine.SetRange("Asset No.", Item."No.");
        PriceListLine.SetRange("Product No.", Item."No.");
        PriceListLine.SetRange("Variant Code", '');
        PriceListLine.SetRange("Amount Type", PriceListLine."Amount Type"::Price);
        PriceListLine.SetRange("Price Type", PriceListLine."Price Type"::Sale);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate());
        PriceListLine.SetFilter("Ending Date", '>=%1|%2', WorkDate(), 0D);
        if PriceListLine.IsEmpty then
            Error(ErrTxt003, Item."No.");

        PriceListLine.FindLast();
        Vat_Price := PriceListLine."Unit Price";
    end;

    local procedure AddVATOnPrice(pVatBusPostingGroup: Code[20])
    var
        VATPostingSetup: Record "VAT Posting Setup";
    begin
        VATPostingSetup.Reset();
        VATPostingSetup.Get(pVatBusPostingGroup, Item."VAT Prod. Posting Group");

        Vat_Price := Vat_Price + (Vat_Price * VATPostingSetup."VAT %" / 100);
    end;

    #endregion LOCALS

    var
        BarCode: Code[50];
        Vat_Price: Decimal;
        ErrTxt001: TextConst ENU = 'No Reference Valid for Item %1', ITA = 'Nessun Riferimento Valido per Articolo %1';
        ErrTxt002: TextConst ENU = 'More then One Valid Reference found for Item %1', ITA = 'Più di Un Riferimento Valido trovati per Articolo %1';
        ErrTxt003: TextConst ENU = 'No Price Valid for Item %1', ITA = 'Nessun Prezzo Valido per Articolo %1';
        NascondiPrezzo: Boolean;
}
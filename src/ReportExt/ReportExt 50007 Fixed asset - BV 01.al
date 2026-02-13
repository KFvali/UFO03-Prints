namespace Keyfor.UFO03.Prints;

using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;
using Microsoft.Sales.History;
using Microsoft.Sales.Archive;
using Microsoft.Sales.Receivables;
using Microsoft.Sales.Comment;
using Microsoft.Sales.Reports;
using Microsoft.Service.Document;
using Microsoft.Service.History;
using Microsoft.Purchases.History;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.Reports;
using Microsoft.Purchases.Payables;
using Microsoft.Purchases.Archive;
using Microsoft.Purchases.Vendor;
using Microsoft.Bank.BankAccount;
using Microsoft.Bank.Payment;
using Microsoft.Foundation.PaymentTerms;
using Microsoft.Foundation.Company;
using Microsoft.Foundation.Shipping;
using Microsoft.Foundation.Comment;
using Microsoft.Foundation.Auditcodes;
using Microsoft.Foundation.Address;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Transfer;
using Microsoft.Inventory.Tracking;
using Microsoft.Inventory.Location;
using Microsoft.Inventory.Item.Catalog;
using Microsoft.Finance.VAT.Clause;
using Microsoft.Finance.VAT.Setup;
using Microsoft.Finance.GeneralLedger.Reports;
using Microsoft.Finance.GeneralLedger.Ledger;
using Microsoft.CRM.Team;
using Microsoft.CRM.Contact;
using Microsoft.Utilities;
using Microsoft.Pricing.PriceList;
using Microsoft.HumanResources.Employee;
using Microsoft.FixedAssets.Reports;
using Microsoft.FixedAssets.Depreciation;
using Microsoft.FixedAssets.FixedAsset;
using Microsoft.FixedAssets.Setup;
using System.Environment;
using System.Security.AccessControl;
using System.Security.User;
using System.Utilities;
using System.Text;
using System.Datetime;
using System.Environment.Configuration;

reportextension 50007 "Fixed asset - BV 01" extends "Fixed Asset - Book Value 01"
{
    dataset
    {
        add("Fixed asset")
        {
            column(TabAmm; TabAmm) { }
            column(Component_Main_Asset; "Component of Main Asset") { }
            column(FixedAssetDesc; FixedAssetDesc) { }
            column(FaSubClassDescr; FaSubClassDescr) { }
        }

        modify("Fixed asset")
        {

            trigger OnAfterAfterGetRecord()
            var
                lFixedAsset: Record "Fixed Asset";
                lFASubclass: Record "FA Subclass";
            begin
                Clear(TabAmm);
                TabAmm := GetDeprTableCode("Fixed Asset"."No.");

                FixedAssetDesc := '';
                lFixedAsset.reset;
                If lFixedAsset.get("Fixed Asset"."Component of Main Asset") then
                    FixedAssetDesc := lFixedAsset.Description;

                FaSubClassDescr := '';
                lFASubclass.Reset();
                if lFASubclass.get("Fixed Asset"."FA Subclass Code") then
                    FaSubClassDescr := lFASubclass.Name;

            end;
        }
    }

    rendering
    {
        layout("Fixed Asset - Book Value 01")
        {
            Type = RDLC;
            LayoutFile = 'Fixed asset - BV 01.rdlc';
        }
    }

    labels
    {
        label(TabAmm_Caption; ENU = 'Tab. Amm.', ITA = 'Tab. Amm.')
        label(Totale_Caption; ENU = 'Totale per componente bene principale', ITA = 'Totale per componente bene principale')
    }

    var
        TabAmm: Code[10];
        SubclassDescr: Text;
        FixedAssetDesc: Text;
        FaSubClassDescr: Text;

    local procedure GetDeprTableCode(pFaNo: Code[20]): Code[10];
    var
        DeprTableCode: Code[10];
        FADepreciationBook: Record "FA Depreciation Book";
    begin
        Clear(DeprTableCode);

        FADepreciationBook.reset;
        FADepreciationBook.SetCurrentKey("FA No.");
        FADepreciationBook.SetFilter("FA No.", pFaNo);
        if FADepreciationBook.FindFirst then
            if FADepreciationBook."Depreciation Table Code" <> '' then
                DeprTableCode := FADepreciationBook."Depreciation Table Code"
            else
                DeprTableCode := Format(FADepreciationBook."Straight-Line %") + ' %';

        exit(DeprTableCode);
    end;
}
namespace Keyfor.UFO03.Prints;

using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;
using Microsoft.Sales.History;
using Microsoft.Sales.Archive;
using Microsoft.Purchases.History;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.Vendor;
using Microsoft.Bank.BankAccount;
using Microsoft.Foundation.PaymentTerms;
using Microsoft.Foundation.Company;
using Microsoft.Foundation.Shipping;
using Microsoft.Foundation.Comment;
using Microsoft.Foundation.Auditcodes;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Transfer;
using Microsoft.Inventory.Tracking;
using Microsoft.CRM.Team;
using Microsoft.CRM.Contact;
using System.Environment;

codeunit 50000 "Prints Management"
{
    trigger OnRun()
    begin
    end;

    #region EVENTS

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS Advanced Reporting Mngt", 'OnHeaderCustomFields', '', true, true)]
    local procedure C18122007_OnHeaderCustomFields_SalesHeader(HeaderRecRef: RecordRef; var RBHeader: Record "EOS Report Buffer Header"; var TempAdvRptCustomFields: Record "EOS AdvRpt Custom Fields")
    var
        SalesHeader: record "Sales Header";
        Customer: record Customer;
        PaymentMethod: record "Payment Method";
        CustomerBankAccount: record "Customer Bank Account";
        PaymentLines: record "Payment Lines";
        PaymentTerms: record "Payment Terms";
        SalesPersonPurchaser: record "Salesperson/Purchaser";
        ShipmentMethod: record "Shipment Method";
        CompanyInformation: record "Company Information";
        DocShippingInfo: record "EOS066 Document Shipping Info";
        BankAccount: record "Bank Account";
        Contact: record Contact;
        QuoteValidUntil_Hdr: Date;
        ExpctShipDt_Hdr: Date;
        VarReportTitle: text;
        WrittenBy_Hdr: Text;
        ApprovedBy_Hdr: Text;
        Agent_Hdr: Text;
        Zone_Hdr: Text;
        Port_Hdr: text;
        ShippingBy_Hdr: text;
        PaymentTerms_Hdr: text;
        PaymentMethod_Hdr: text;
        Cup_Hdr: text;
        Cig_Hdr: text;
        Iban_Hdr: Text;
        PaymentLineText: Text;
        ChangeLayout: Boolean;
        WrittenBy_lbl: TextConst ENU = 'Written By', ITA = 'REDATTO DA';
        ApprovedBy_lbl: TextConst ENU = 'Approved By', ITA = 'APPROVATO DA';
        Agent_lbl: TextConst ENU = 'Agent', ITA = 'AGENTE';
        Zone_lbl: TextConst ENU = 'Zone', ITA = 'ZONA';
        QuoteValidUntil_lbl: TextConst ENU = 'Quote Valid Until Date', ITA = 'VALIDITA OFFERTA';
        ExpectedShippingDate_lbl: TextConst ENU = 'Expected Shipping Date', ITA = 'DATA SPEDIZIONE PREVISTA';
        Port_lbl: TextConst ENU = 'Port', ITA = 'PORTO';
        ShippingBy_lbl: TextConst ENU = 'Shipping By', ITA = 'TRASPORTO A CURA';
        PaymentTerms_lbl: TextConst ENU = 'Payment Terms', ITA = 'CONDIZIONI PAGAMENTO';
        PaymentMethod_lbl: TextConst ENU = 'Payment Method', ITA = 'METODO PAGAMENTO';
        Cup_lbl: TextConst ENU = 'CUP', ITA = 'CUP';
        Cig_lbl: TextConst ENU = 'CIG', ITA = 'CIG';
        Iban_lbl: TextConst ENU = 'IBAN', ITA = 'IBAN';
        SalesOrderCaption: TextConst ENU = 'Sales Order', ITA = 'Ordine Vendita';
        SalesQuoteCaption: TextConst ENU = 'Sales Request', ITA = 'Offerta Vendita';
        ErrTxt001: TextConst ENU = 'No Document Found !', ITA = 'Nessun Documento trovato !';
    begin
        if RBHeader."EOS Source Table ID" <> Database::"Sales Header" then
            exit;

        TempAdvRptCustomFields.SetTextNameValue('CustomText2', RBHeader."EOS Report Setup Code");
        TempAdvRptCustomFields.Insert(true);

        case RBHeader."EOS Source Subtype" of
            Enum::"Sales Document Type"::Quote.AsInteger():
                VarReportTitle := SalesQuoteCaption;

            Enum::"Sales Document Type"::Order.AsInteger():
                VarReportTitle := SalesOrderCaption;

            else
                VarReportTitle := RBHeader."EOS Report Title";
        end;

        if not SalesHeader.Get(SalesHeader."Document Type"::Order, RBHeader."EOS No.") then
            if not SalesHeader.Get(SalesHeader."Document Type"::Quote, RBHeader."EOS No.") then
                Error(ErrTxt001);

        if Customer.Get(SalesHeader."Sell-to Customer No.") then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText1', Customer.Name);
            TempAdvRptCustomFields.Insert(true);
            // TempAdvRptCustomFields.SetTextNameValue('CustomText23', format(Customer."MMA04 Correspondent Customer"));
            // TempAdvRptCustomFields.Insert(true);
        end else
            if RBHeader."EOS Source Subtype" = RBHeader."EOS Source Subtype"::"0" then
                if Contact.Get(SalesHeader."Sell-to Contact") then begin
                    TempAdvRptCustomFields.SetTextNameValue('CustomText1', Contact.Name);
                    TempAdvRptCustomFields.Insert(true);
                end;

        TempAdvRptCustomFields.SetTextNameValue('CustomText3', WrittenBy_lbl);
        TempAdvRptCustomFields.Insert(true);
        TempAdvRptCustomFields.SetTextNameValue('CustomText4', SalesHeader."Assigned User ID");
        TempAdvRptCustomFields.Insert(true);
        TempAdvRptCustomFields.SetTextNameValue('CustomText5', ApprovedBy_lbl);
        TempAdvRptCustomFields.Insert(true);
        // TempAdvRptCustomFields.SetTextNameValue('CustomText6', SalesHeader."MMA04 Approved By");
        // TempAdvRptCustomFields.Insert(true);
        TempAdvRptCustomFields.SetTextNameValue('CustomText7', Agent_lbl);
        TempAdvRptCustomFields.Insert(true);
        if Customer."Salesperson Code" <> '' then
            if SalesPersonPurchaser.get(Customer."Salesperson Code") then begin
                TempAdvRptCustomFields.SetTextNameValue('CustomText8', SalesPersonPurchaser.Name);
                TempAdvRptCustomFields.Insert(true)
            end;

        TempAdvRptCustomFields.SetTextNameValue('CustomText9', Zone_lbl);
        TempAdvRptCustomFields.Insert(true);
        TempAdvRptCustomFields.SetTextNameValue('CustomText10', 'zona');
        TempAdvRptCustomFields.Insert(true);
        TempAdvRptCustomFields.SetTextNameValue('CustomText11', QuoteValidUntil_lbl);
        TempAdvRptCustomFields.Insert(true);
        TempAdvRptCustomFields.SetTextNameValue('CustomText12', format(SalesHeader."Quote Valid Until Date"));
        TempAdvRptCustomFields.Insert(true);
        TempAdvRptCustomFields.SetTextNameValue('CustomText13', ExpectedShippingDate_lbl);
        TempAdvRptCustomFields.Insert(true);
        TempAdvRptCustomFields.SetTextNameValue('CustomText14', format(SalesHeader."Shipment Date"));
        TempAdvRptCustomFields.Insert(true);
        TempAdvRptCustomFields.SetTextNameValue('CustomText15', Port_lbl);
        TempAdvRptCustomFields.SetTextNameValue('CustomText31', format(SalesHeader."Quote No."));
        TempAdvRptCustomFields.Insert(true);

        if SalesHeader."Shipment Method Code" <> '' then
            if ShipmentMethod.Get(SalesHeader."Shipment Method Code") then begin
                TempAdvRptCustomFields.SetTextNameValue('CustomText16', ShipmentMethod.Description);
                TempAdvRptCustomFields.Insert(true);
            end;

        if DocShippingInfo.get(SalesHeader.SystemId) then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText17', ShippingBy_lbl);
            TempAdvRptCustomFields.Insert(true);

            case DocShippingInfo."Freight Type" of
                DocShippingInfo."Freight Type"::"Agent Code":
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Vettore');

                DocShippingInfo."Freight Type"::"Carriage Consigner":
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Mittente');

                DocShippingInfo."Freight Type"::"Carriage Forward":
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Destinatario');

                else
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', '');
            end;

            TempAdvRptCustomFields.Insert(true);
        end;

        TempAdvRptCustomFields.SetTextNameValue('CustomText19', PaymentMethod_lbl);
        TempAdvRptCustomFields.Insert(true);

        if SalesHeader."Payment Method Code" <> '' then
            if PaymentMethod.Get(SalesHeader."Payment Method Code") then begin
                TempAdvRptCustomFields.SetTextNameValue('CustomText20', PaymentMethod.Description);
                TempAdvRptCustomFields.Insert(true);
            end;

        TempAdvRptCustomFields.SetTextNameValue('CustomText21', PaymentTerms_lbl);
        TempAdvRptCustomFields.Insert(true);

        if SalesHeader."Payment Terms Code" <> '' then
            if PaymentTerms.get(SalesHeader."Payment Terms Code") then begin
                TempAdvRptCustomFields.SetTextNameValue('CustomText22', SalesHeader."Payment Terms Code");
                TempAdvRptCustomFields.Insert(true);
            end;

        if PaymentMethod.Get(SalesHeader."Payment Method Code") then
            // if PaymentMethod."MMA04 Transfer" then
            //     if SalesHeader."EOS Our Bank Account" <> '' then begin
            //         if BankAccount.get(SalesHeader."EOS Our Bank Account") then begin
            //             TempAdvRptCustomFields.SetTextNameValue('CustomText27', Iban_Lbl);
            //             TempAdvRptCustomFields.Insert(true);
            //             TempAdvRptCustomFields.SetTextNameValue('CustomText28', BankAccount.IBAN);
            //             TempAdvRptCustomFields.Insert(true);
            //         end;
            //     end else
            if CompanyInformation.get() then begin
                TempAdvRptCustomFields.SetTextNameValue('CustomText27', Iban_Lbl);
                TempAdvRptCustomFields.Insert(true);
                TempAdvRptCustomFields.SetTextNameValue('CustomText28', CompanyInformation.IBAN);
                TempAdvRptCustomFields.Insert(true);
            end;

        if PaymentTerms.Get(SalesHeader."Payment Terms Code") then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText29', PaymentTerms.Description);
            TempAdvRptCustomFields.Insert(true);
        end;

        // if SalesHeader."MMA04 Customer Request No." <> '' then begin
        //     TempAdvRptCustomFields.SetTextNameValue('CustomText30', SalesHeader."MMA04 Customer Request No." + ' del ' + format(SalesHeader."MMA04 Customer Request Date"));
        //     TempAdvRptCustomFields.Insert(true);
        // end;

        RBHeader.SetCustomFieldList(TempAdvRptCustomFields);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS Advanced Reporting Mngt", 'OnHeaderCustomFields', '', true, true)]
    local procedure C18122007_OnHeaderCustomFields_SalesInvoiceHeader(HeaderRecRef: RecordRef; var RBHeader: Record "EOS Report Buffer Header"; var TempAdvRptCustomFields: Record "EOS AdvRpt Custom Fields")
    var
        DocShippingInfo: record "EOS066 Document Shipping Info";
        SalesShipmentHeader: record "Sales Shipment Header";
        SalesInvoiceHeader: record "Sales Invoice Header";
        ShippingAgent: record "Shipping Agent";
        ReasonCode: record "Reason Code";
        GoodAppearance: record "Goods Appearance";
        ReturnShipmentHeader: record "Return Shipment Header";
        DateTimeCreatedAt: DateTime;
    begin
        if (RBHeader."EOS Source Table ID" <> Database::"Sales Invoice Header") then
            exit;

        case RBHeader."EOS Source Table ID" of
            Database::"Sales Invoice Header":
                begin
                    SalesInvoiceHeader.Get(RBHeader."EOS No.");
                end;
        end;

        if ShippingAgent.Get(SalesInvoiceHeader."Shipping Agent Code") then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText25', ShippingAgent.Name);
            TempAdvRptCustomFields.Insert(true);
            TempAdvRptCustomFields.SetTextNameValue('CustomText27', format(CopyStr(ShippingAgent.Address, 1, 40)));
            TempAdvRptCustomFields.Insert(true);
        end;

        if ReasonCode.Get(SalesInvoiceHeader."Reason Code") then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText26', format(ReasonCode.Description));
            TempAdvRptCustomFields.Insert(true);
        end;

        if DocShippingInfo.Get(SalesInvoiceHeader.SystemId) then;

        if not DocShippingInfo.IsEmpty then begin
            case DocShippingInfo."Freight Type" of
                DocShippingInfo."Freight Type"::"Agent Code":
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Vettore');

                DocShippingInfo."Freight Type"::"Carriage Consigner":
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Mittente');

                DocShippingInfo."Freight Type"::"Carriage Forward":
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Destinatario');

                else
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', '');
            end;
            TempAdvRptCustomFields.Insert(true);

            TempAdvRptCustomFields.SetTextNameValue('CustomText19', format(DocShippingInfo."Net Weight"));
            TempAdvRptCustomFields.Insert(true);
            TempAdvRptCustomFields.SetTextNameValue('CustomText20', format(DocShippingInfo."Gross Weight"));
            TempAdvRptCustomFields.Insert(true);

            /// --> capire come gestire
            //if GoodAppearance.get(DocShippingInfo."EOS Goods Appearance") then begin
            if DocShippingInfo."Goods Appearance Descr." <> '' then begin
                //TempAdvRptCustomFields.SetTextNameValue('CustomText21', format(GoodAppearance.Description));
                TempAdvRptCustomFields.SetTextNameValue('CustomText21', format(DocShippingInfo."Goods Appearance Descr."));
                TempAdvRptCustomFields.Insert(true);
            end;

            TempAdvRptCustomFields.SetTextNameValue('CustomText22', format(DocShippingInfo."Freight Type"));
            TempAdvRptCustomFields.Insert(true);

            Clear(DateTimeCreatedAt);
            if not SalesInvoiceHeader.IsEmpty then
                DateTimeCreatedAt := SalesInvoiceHeader.SystemCreatedAt;

            if (DocShippingInfo."Shipping Starting Date" = 0D) and (DocShippingInfo."Shipping Starting Time" = 0T) then
                TempAdvRptCustomFields.SetTextNameValue('CustomText23', Format(DateTimeCreatedAt))
            else
                TempAdvRptCustomFields.SetTextNameValue('CustomText23', StrSubstNo('%1 %2', format(DocShippingInfo."Shipping Starting Date"), format(DocShippingInfo."Shipping Starting Time", 0, '<Hours24,2><Filler Character,0>:<Minutes,2>')));
            TempAdvRptCustomFields.Insert(true);

            TempAdvRptCustomFields.SetTextNameValue('CustomText24', format(DocShippingInfo."No. of Parcels"));
            TempAdvRptCustomFields.Insert(true);
        end;

        RBHeader.SetCustomFieldList(TempAdvRptCustomFields);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS Advanced Reporting Mngt", 'OnHeaderCustomFields', '', true, true)]
    local procedure C18122007_OnHeaderCustomFields_SalesShipmentHeader(HeaderRecRef: RecordRef; var RBHeader: Record "EOS Report Buffer Header"; var TempAdvRptCustomFields: Record "EOS AdvRpt Custom Fields")
    var
        DocShippingInfo: record "EOS066 Document Shipping Info";
        SalesShipmentHeader: record "Sales Shipment Header";
        SalesInvoiceHeader: record "Sales Invoice Header";
        ShippingAgent: record "Shipping Agent";
        ReasonCode: record "Reason Code";
        GoodAppearance: record "Goods Appearance";
        ReturnShipmentHeader: record "Return Shipment Header";
        DateTimeCreatedAt: DateTime;
        // ESCMDispatchOrder: Record "ESCM Dispatch Order";
        // ESCMDispatchOrderLine: Record "ESCM Dispatch Order Line";
        NetWeight: Decimal;
        GrossWeight: Decimal;
        NoOfParcels: Integer;
    begin
        if (RBHeader."EOS Source Table ID" <> Database::"Sales Shipment Header") then
            exit;

        Clear(NetWeight);
        Clear(GrossWeight);
        Clear(NoOfParcels);

        case RBHeader."EOS Source Table ID" of
            Database::"Sales Shipment Header":
                SalesShipmentHeader.get(RBHeader."EOS No.");
        end;

        if ShippingAgent.Get(SalesShipmentHeader."Shipping Agent Code") then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText25', ShippingAgent.Name);
            TempAdvRptCustomFields.Insert(true);
            TempAdvRptCustomFields.SetTextNameValue('CustomText27', format(CopyStr(ShippingAgent.Address, 1, 40)));
            TempAdvRptCustomFields.Insert(true);
        end;

        if ReasonCode.Get(SalesShipmentHeader."Reason Code") then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText26', format(ReasonCode.Description));
            TempAdvRptCustomFields.Insert(true);
        end;

        //TempAdvRptCustomFields.Insert(true);

        if DocShippingInfo.Get(SalesShipmentHeader.SystemId) then;

        if not DocShippingInfo.IsEmpty then begin
            case DocShippingInfo."Freight Type" of
                DocShippingInfo."Freight Type"::"Agent Code":
                    //TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Vettore');
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18Vet', 'X');

                DocShippingInfo."Freight Type"::"Carriage Consigner":
                    //TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Mittente');
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18Mit', 'X');

                DocShippingInfo."Freight Type"::"Carriage Forward":
                    //TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Destinatario');
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18Dest', 'X');

                else
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', '');
            end;

            TempAdvRptCustomFields.Insert(true);

            // Clear(ESCMDispatchOrder);
            // SalesShipmentHeader.CalcFields("ESCM Dispatch Order No.");
            // if SalesShipmentHeader."ESCM Dispatch Order No." <> '' THEN
            //     if not ESCMDispatchOrder.GET(ESCMDispatchOrder.Type::Outbound, SalesShipmentHeader."ESCM Dispatch Order No.") THEN
            //         Clear(ESCMDispatchOrder);

            // ESCMDispatchOrderLine.Reset;
            // ESCMDispatchOrderLine.SetRange("Dispatch Order Type", ESCMDispatchOrder.Type);
            // ESCMDispatchOrderLine.SetRange("Dispatch Order No.", ESCMDispatchOrder."No.");
            // ESCMDispatchOrderLine.SetRange("Document No.", SalesShipmentHeader."No.");
            // ESCMDispatchOrderLine.SetRange("Document Type", ESCMDispatchOrderLine."Document Type"::"Sales Shipment");
            // if ESCMDispatchOrderLine.FindFirst() then begin
            //     if DocShippingInfo."Net Weight" <> 0 then
            //         NetWeight := DocShippingInfo."Net Weight"
            //     else
            //         NetWeight := ESCMDispatchOrderLine."Total Net Weight";

            //     if DocShippingInfo."Gross Weight" <> 0 then
            //         GrossWeight := DocShippingInfo."Gross Weight"
            //     else
            //         GrossWeight := ESCMDispatchOrderLine."Total Gross Weight";

            //     if DocShippingInfo."No. of Parcels" <> 0 then
            //         NoOfParcels := DocShippingInfo."No. of Parcels"
            //     else
            //         NoOfParcels := ESCMDispatchOrderLine."No. of Packages";
            // end;

            //TempAdvRptCustomFields.SetTextNameValue('CustomText19', format(DocShippingInfo."Net Weight"));
            TempAdvRptCustomFields.SetTextNameValue('CustomText19', format(NetWeight));
            TempAdvRptCustomFields.Insert(true);
            //TempAdvRptCustomFields.SetTextNameValue('CustomText20', format(DocShippingInfo."Gross Weight"));
            TempAdvRptCustomFields.SetTextNameValue('CustomText20', format(GrossWeight));
            TempAdvRptCustomFields.Insert(true);

            TempAdvRptCustomFields.SetTextNameValue('CustomText30', format(NoOfParcels));
            TempAdvRptCustomFields.Insert(true);


            /// --> capire come gestire
            //if GoodAppearance.get(DocShippingInfo."EOS Goods Appearance") then begin
            if DocShippingInfo."Goods Appearance Descr." <> '' then begin
                //TempAdvRptCustomFields.SetTextNameValue('CustomText21', format(GoodAppearance.Description));
                TempAdvRptCustomFields.SetTextNameValue('CustomText21', format(DocShippingInfo."Goods Appearance Descr."));
                TempAdvRptCustomFields.Insert(true);
            end;

            TempAdvRptCustomFields.SetTextNameValue('CustomText22', format(DocShippingInfo."Freight Type"));
            TempAdvRptCustomFields.Insert(true);

            Clear(DateTimeCreatedAt);
            if not SalesShipmentHeader.IsEmpty then
                DateTimeCreatedAt := SalesShipmentHeader.SystemCreatedAt;

            if (DocShippingInfo."Shipping Starting Date" = 0D) and (DocShippingInfo."Shipping Starting Time" = 0T) then
                TempAdvRptCustomFields.SetTextNameValue('CustomText23', Format(DateTimeCreatedAt))
            else
                TempAdvRptCustomFields.SetTextNameValue('CustomText23', StrSubstNo('%1 %2', format(DocShippingInfo."Shipping Starting Date"), format(DocShippingInfo."Shipping Starting Time", 0, '<Hours24,2><Filler Character,0>:<Minutes,2>')));
            TempAdvRptCustomFields.Insert(true);

            TempAdvRptCustomFields.SetTextNameValue('CustomText24', format(DocShippingInfo."No. of Parcels"));
            TempAdvRptCustomFields.Insert(true);
        end;

        RBHeader.SetCustomFieldList(TempAdvRptCustomFields);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS Advanced Reporting Mngt", 'OnHeaderCustomFields', '', true, true)]
    local procedure C18122007_OnHeaderCustomFields_SalesCrMemo(HeaderRecRef: RecordRef; var RBHeader: Record "EOS Report Buffer Header"; var TempAdvRptCustomFields: Record "EOS AdvRpt Custom Fields")
    var
        SalesCrMemoHeader: record "Sales Cr.Memo Header";
        ShippingAgent: record "Shipping Agent";
        ReasonCode: record "Reason Code";
    begin
        if RBHeader."EOS Source Table ID" <> Database::"Sales Cr.Memo Header" then
            exit;

        SalesCrMemoHeader.Get(RBHeader."EOS No.");

        if ShippingAgent.Get(SalesCrMemoHeader."Shipping Agent Code") then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText25', ShippingAgent.Name);
            TempAdvRptCustomFields.Insert(true);
            TempAdvRptCustomFields.SetTextNameValue('CustomText27', format(CopyStr(ShippingAgent.Address, 1, 40)));
            TempAdvRptCustomFields.Insert(true);
        end;

        if ReasonCode.Get(SalesCrMemoHeader."Reason Code") then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText26', format(ReasonCode.Description));
            TempAdvRptCustomFields.Insert(true);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS Advanced Reporting Mngt", 'OnHeaderCustomFields', '', true, true)]
    local procedure C18122007_OnHeaderCustomFields_TransferShipment(HeaderRecRef: RecordRef; var RBHeader: Record "EOS Report Buffer Header"; var TempAdvRptCustomFields: Record "EOS AdvRpt Custom Fields")
    var
        DocShippingInfo: record "EOS066 Document Shipping Info";
        TransferShipmentHeader: record "Transfer Shipment Header";
        GoodAppearance: record "Goods Appearance";
    begin
        if HeaderRecRef.Number <> Database::"Transfer Shipment Header" then
            exit;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS Advanced Reporting Mngt", 'OnHeaderCustomFields', '', true, true)]
    local procedure C18122007_OnHeaderCustomFields_ReturnShipment(HeaderRecRef: RecordRef; var RBHeader: Record "EOS Report Buffer Header"; var TempAdvRptCustomFields: Record "EOS AdvRpt Custom Fields")
    var
        ReturnShipmentHeader: record "Return Shipment Header";
        DocShippingInfo: record "EOS066 Document Shipping Info";
        ShippingAgent: record "Shipping Agent";
        ReasonCode: record "Reason Code";
        GoodAppearance: record "Goods Appearance";
    begin
        if RBHeader."EOS Source Table ID" <> Database::"Return Shipment Header" then
            exit;

        ReturnShipmentHeader.Get(RBHeader."EOS No.");

        if ShippingAgent.get(ReturnshipmentHeader."Shipping Agent Code") then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText25', ShippingAgent.Name);
            TempAdvRptCustomFields.Insert(true);
            TempAdvRptCustomFields.SetTextNameValue('CustomText27', format(CopyStr(ShippingAgent.Address, 1, 40)));
            TempAdvRptCustomFields.Insert(true);
        end;

        if ReasonCode.Get(ReturnShipmentHeader."Reason Code") then begin
            TempAdvRptCustomFields.SetTextNameValue('CustomText26', format(ReasonCode.Description));
            TempAdvRptCustomFields.Insert(true);
        end;

        if DocShippingInfo.Get(ReturnShipmentHeader.SystemId) then begin
            case DocShippingInfo."Freight Type" of
                DocShippingInfo."Freight Type"::"Agent Code":
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Vettore');

                DocShippingInfo."Freight Type"::"Carriage Consigner":
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Mittente');

                DocShippingInfo."Freight Type"::"Carriage Forward":
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', 'Destinatario');

                else
                    TempAdvRptCustomFields.SetTextNameValue('CustomText18', '');
            end;

            TempAdvRptCustomFields.Insert(true);

            TempAdvRptCustomFields.SetTextNameValue('CustomText19', format(DocShippingInfo."Net Weight"));
            TempAdvRptCustomFields.Insert(true);
            TempAdvRptCustomFields.SetTextNameValue('CustomText20', format(DocShippingInfo."Gross Weight"));
            TempAdvRptCustomFields.Insert(true);

            /// --> capire come gestire
            //if GoodAppearance.get(DocShippingInfo."EOS Goods Appearance") then begin
            if DocShippingInfo."Goods Appearance Descr." <> '' then begin
                //TempAdvRptCustomFields.SetTextNameValue('CustomText21', format(GoodAppearance.Description));
                TempAdvRptCustomFields.SetTextNameValue('CustomText21', format(DocShippingInfo."Goods Appearance Descr."));
                TempAdvRptCustomFields.Insert(true);
            end;


            TempAdvRptCustomFields.SetTextNameValue('CustomText22', format(DocShippingInfo."Freight Type"));
            TempAdvRptCustomFields.Insert(true);

            if (DocShippingInfo."Shipping Starting Date" = 0D) and (DocShippingInfo."Shipping Starting Time" = 0T) then
                TempAdvRptCustomFields.SetTextNameValue('CustomText23', Format(ReturnShipmentHeader.SystemCreatedAt))
            else
                TempAdvRptCustomFields.SetTextNameValue('CustomText23', StrSubstNo('%1 %2', format(DocShippingInfo."Shipping Starting Date"), format(DocShippingInfo."Shipping Starting Time", 0, '<Hours24,2><Filler Character,0>:<Minutes,2>')));
            TempAdvRptCustomFields.Insert(true);

            // TempAdvRptCustomFields.SetTextNameValue('CustomText23', StrSubstNo('%1 %2', format(DocShippingInfo."Shipping Starting Date"), format(DocShippingInfo."Shipping Starting Time")));
            // TempAdvRptCustomFields.Insert(true);

            TempAdvRptCustomFields.SetTextNameValue('CustomText24', format(DocShippingInfo."No. of Parcels"));
            TempAdvRptCustomFields.Insert(true);
        end;

        RBHeader.SetCustomFieldList(TempAdvRptCustomFields);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS Advanced Reporting Mngt", 'OnAfterDocumentProcessing', '', true, true)]
    local procedure C18122007_OnAfterDocumentProcessing(HeaderRecRef: RecordRef; var RBHeader: Record "EOS Report Buffer Header"; var RBLine: Record "EOS Report Buffer Line")
    var
        TempAdvRptCustomFields: record "EOS AdvRpt Custom Fields";
        NetThings: Decimal;
    begin
        case RBHeader."EOS Report ID" of
            Report::"Sales Document":
                begin
                    RBLine.SetRange("EOS Line type", RBLine."EOS Line type"::EOSDocumentLine);
                    RBLine.SetRange("EOS Type", RBLine."EOS Type"::Item);
                    if RBLine.FindSet() then
                        repeat
                            NetThings += RBLine."EOS Line Amount"
                        until RBLine.Next() = 0;

                    RBHeader.GetCustomFieldList(TempAdvRptCustomFields);

                    TempAdvRptCustomFields.SetDecimalNameValue('CustomDecimal1', NetThings);
                    TempAdvRptCustomFields.Insert(true);

                    RBHeader.SetCustomFieldList(TempAdvRptCustomFields);
                    RBHeader.Modify();
                end;
            else
                exit;
        end;
    end;

    //  ROBA EOS, MA A CHE SERVE ???

    // Add the field in the list as mandatory
    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS Invoicing Management", 'AddRequiredFieldManagement', '', true, false)] //mpd- 13.04.21
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS Invoicing Management", 'AddCustomFieldManagement', '', true, false)] //mpd+ 13.04.21
    // local procedure InvoicingManagement_AddCustomFieldManagement(var TmpField: Record Field)

    // var
    //     SalesShptHeader: Record "Sales Shipment Header";
    //     SaleShptLine: record "Sales Shipment Line";
    //     InvManagement: Codeunit "EOS Invoicing Management";
    // begin
    //     InvManagement.AddField(TmpField, DATABASE::"Sales Shipment Line", SaleShptLine.FieldNo("Payment terms"));
    // end;

    // [EventSubscriber(ObjectType::Report, report::"EOS Combine Shipments", 'OnAfterInsertInvLineFromShptLine', '', true, false)]

    // local procedure OnAfterInsertInvLineFromShptLine(SalesShipLine: Record "Sales Shipment Line"; var SalesLine: Record "Sales Line")
    // var

    // begin
    //     SalesLine."Payment terms" := SalesShipLine."Payment terms";
    // end;
    //test MPD+ 14.04.21 start 
    // [EventSubscriber(ObjectType::Report, Report::"EOS Combine Shipments", '', '', true, false)]
    // local procedure CombineShipments_OnInsertSalesInvHeaderFields(var SalesInvHeader: Record "Sales Header"; SalesOrderHeader: Record "Sales Header")
    // begin
    //     with SalesInvHeader do begin
    //         Validate("Bank Account", SalesOrderHeader."Bank Account");
    //         Validate("Operation Type", SalesOrderHeader."Operation Type");
    //         Validate("Activity Code", SalesOrderHeader."Activity Code");
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS AdvRpt Layout Mngt", 'OnDiscoverAvailableSections', '', true, true)]
    // local procedure C18122021_OnDiscoverAvailableSections(var Sections: Record "EOS Adv Reporting Sections")
    // var
    //     CommentLine: record "Comment Line";
    //     ModInfo: ModuleInfo;
    // begin
    //     NavApp.GetCurrentModuleInfo(ModInfo);

    //     Sections.Init();
    //     Sections."EOS Code" := 'CodiceUN';
    //     Sections."EOS Description" := CopyStr(CommentLine.TableCaption(), 1, 50);
    //     Sections."EOS Position" := Sections."EOS Position"::AfterLine;
    //     Sections."EOS Default Enabled" := true;
    //     Sections."EOS Default Sort" := 20000;
    //     Sections.CopyFromModuleInfo(modInfo);
    //     Sections.Insert(true);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS AdvRpt Layout Mngt", 'OnDiscoverAvailableSections', '', true, true)]
    // local procedure C18122021_OnDiscoverAvailableSections_Art62(var Sections: Record "EOS Adv Reporting Sections")
    // var
    //     Item_Label: TextConst ENU = 'Mostra Prezzi DDT Art. 62', ITA = 'Mostra Prezzi DDT Art. 62';
    //     ModInfo: ModuleInfo;
    // begin
    //     NavApp.GetCurrentModuleInfo(ModInfo);

    //     Sections.Init();
    //     Sections."EOS Code" := 'Art62';
    //     Sections."EOS Description" := Item_Label;
    //     Sections."EOS Position" := Sections."EOS Position"::PostProcessing;
    //     Sections."EOS Default Enabled" := false;
    //     Sections.CopyFromModuleInfo(modInfo);
    //     Sections.Insert(true);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS AdvRpt Layout Mngt", 'OnDiscoverAvailableSections', '', true, false)]
    // local procedure C18122021_OnDiscoverAvailableSections_FormulaPrato(var Sections: Record "EOS Adv Reporting Sections")
    // var
    //     Layout_Label: TextConst ENU = 'Layout Formula Prato', ITA = 'Layout Formula Prato';
    //     ModInfo: ModuleInfo;
    // begin
    //     NavApp.GetCurrentModuleInfo(modInfo);

    //     Sections.Init();
    //     Sections."EOS Code" := 'FormulaPrato';
    //     Sections."EOS Description" := Layout_Label;
    //     Sections."EOS Position" := Sections."EOS Position"::BodyHeader;
    //     Sections."EOS Default Enabled" := false;
    //     Sections.CopyFromModuleInfo(modInfo);
    //     Sections.Insert(true);
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS AdvRpt Layout Mngt", 'OnExecuteBodyHeaderProcessing', '', false, false)]
    local procedure C18122021_OnExecuteBodyHeaderProcessing_FormulaPrato(var RBHeader: Record "EOS Report Buffer Header"; var RBLine: Record "EOS Report Buffer Line"; DocVariant: Variant; ExtensionCode: Code[20]; ExtensionGuid: Guid)
    var
        ModInfo: ModuleInfo;
    begin
        if ExtensionCode <> UpperCase('FormulaPrato') then
            exit;

        if RBHeader."EOS Source Table ID" <> Database::"Sales Header" then
            exit;

        NavApp.GetCurrentModuleInfo(ModInfo);
        if ExtensionGuid <> ModInfo.Id then
            exit;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS AdvRpt Layout Mngt", 'OnExecutePostProcessing', '', false, false)]
    local procedure C18122021_OnExecuteBodyHeaderProcessing_Art62(var RBHeader: Record "EOS Report Buffer Header"; var RBLine: Record "EOS Report Buffer Line"; DocVariant: Variant; ExtensionCode: Code[20]; ExtensionGuid: Guid)
    var
        ModInfo: ModuleInfo;
    begin
        if ExtensionCode <> UpperCase('Art62') then
            exit;

        if RBHeader."EOS Source Table ID" <> Database::"Sales Shipment Header" then
            exit;

        NavApp.GetCurrentModuleInfo(ModInfo);
        if ExtensionGuid <> ModInfo.Id then
            exit;

        EditArt62RBLineSalesPrice(DocVariant, ExtensionCode, ExtensionGuid, RBHeader, RBLine);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS AdvRpt Layout Mngt", 'OnExecuteAfterLineProcessing', '', true, true)]
    local procedure C18122021_OnExecuteAfterLineProcessing(DocVariant: Variant; ExtensionCode: Code[20]; ExtensionGuid: Guid; var LineRecRef: RecordRef; var RBHeader: Record "EOS Report Buffer Header"; var RBLine: Record "EOS Report Buffer Line")
    var
        RBLine2: record "EOS Report Buffer Line" temporary;
        CommentLine: record "Comment Line";
        Item: record Item;
        PurchaseLine: record "Purchase Line";
        //CustomSetup: record "MMA04 Custom Setup";
        i: Integer;
        ModInfo: ModuleInfo;
    begin
        i := 0;

        if (ExtensionCode <> UpperCase('CodiceUN')) then
            exit;

        NavApp.GetCurrentModuleInfo(modInfo);
        if ExtensionGuid <> modInfo.Id() then
            exit;

        if RBLine."EOS Type" <> RBLine."EOS Type"::Item then
            exit;

        if RBLine."EOS No." = '' then
            exit;

        if not Item.Get(RBLine."EOS No.") then
            exit;

        //CustomSetup.Get();
        CommentLine.SetRange("Table Name", CommentLine."Table Name"::Item);
        CommentLine.SetRange("No.", Item."No.");
        //CommentLine.SetRange("MMA04 Comment Code", CustomSetup."MMA04 Comment Code");
        //CommentLine.SetRange("MMA04 Show on Transport Doc.", true);
        if CommentLine.FindSet() then
            repeat
                RBLine2.copy(RBLine, true);
                RBLine2.Init();
                RBLine2."EOS Line No." := i;
                RBLine2."EOS Type" := RBLine2."EOS Type"::" ";
                RBLine2."EOS No." := '';
                RBLine2."EOS Description" := CommentLine.Comment;
                RBLine2."EOS Extension Code" := ExtensionCode;
                RBLine2."EOS Extension Guid" := ExtensionGuid;
                RBLine2."EOS Line type" := RBLine2."EOS Line type"::EOSLineComment;
                RBLine2.Appendline(RBHeader);
                i += 1;
            until commentline.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'SubstituteReport', '', false, false)]
    local procedure C2000000005_SubstituteReport(ReportId: Integer; RunMode: Option; RequestPageXml: Text; RecordRef: RecordRef; var NewReportId: Integer);
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        FattAccomp: Boolean;
    begin
        case RecordRef.Number() of
            112:
                begin
                    if format(RecordRef.Field(SalesInvoiceHeader.FieldNo("Operation Type")).Value) = 'VEN' then
                        NewReportId := Report::"UFO03 Invoice Document"
                    else if format(RecordRef.Field(SalesInvoiceHeader.FieldNo("Operation Type")).Value) = 'VEN-DIFF' then
                        NewReportId := Report::"UFO03 Invoice Document - FD";

                    // FattAccomp := RecordRef.Field(SalesInvoiceHeader.FieldNo("MMA04 Accomp. Inv.")).Value;
                    // // if (format(RecordRef.Field(SalesInvoiceHeader.FieldNo("No.")).Value).Contains('FV1-')) or
                    // //     (format(RecordRef.Field(SalesInvoiceHeader.FieldNo("No.")).Value).Contains('FV7-')) or
                    // //     (FattAccomp)
                    // if FattAccomp then
                end;
        end;
    end;

    #endregion EVENTS

    #region GLOBALS

    // procedure GetPrintsReference(pReferenceNo: Code[20]; pReferenceDate: Date): Text
    // var
    //     CustomSetup: record "MMA04 Custom Setup";
    // begin
    //     CustomSetup.Get();
    //     if CustomSetup."MMA04 Reference on Prints" = '' then
    //         exit('');

    //     exit(StrSubstNo(CustomSetup."MMA04 Reference on Prints", pReferenceNo, pReferenceDate));
    // end;

    procedure GetAddressInfo(pName: Text[100]; pName2: Text[100]; pAddress: Text[100]; pAddress2: Text[50]; pCountryRegionCode: Code[10]; pPostCode: code[20]; pCity: Text[50]; pCounty: Text[50]; pPhoneNo: Text[30]; pFaxNo: Text[30]) FormattedAddress: Text
    var
        EosLib: Codeunit "EOS Library EXT";
    begin
        FormattedAddress += pName;
        if pName2 <> '' then
            //FormattedAddress += EosLib.NewLine() + pName2;
            FormattedAddress += pName2;

        FormattedAddress += EosLib.NewLine() + pAddress;
        if pAddress2 <> '' then
            FormattedAddress += EosLib.NewLine() + pAddress2;

        FormattedAddress += EosLib.NewLine() + StrSubstNo('%1 - %2 %3 - %4', pPostCode, pCity, pCounty, pCountryRegionCode);
        //FormattedAddress += EosLib.NewLine() + StrSubstNo('%1 %2 - %3', pPostCode, pCity, pCounty);
        //FormattedAddress += EosLib.NewLine() + pCountryRegionCode;
        // --> aggiunto per stampa numero di telefono su WorkOrder
        FormattedAddress += EosLib.NewLine() + pPhoneNo + pFaxNo;

        if FormattedAddress = '  - ' then
            FormattedAddress := '';

    end;

    procedure GetBankInformation(pBillToNo: Code[20]; pPaymentMethodCode: Code[10]; pDocumentBankAccount: Code[20]; var pABICode: Code[5]; var pCABCode: Code[5]; var pIBANCode: Code[50]; var pBankName: Text[100]): Boolean
    var
        Customer: record Customer;
        Vendor: Record Vendor;
        CustomerBankAccount: record "Customer Bank Account";
        VendorBankAccount: Record "Vendor Bank Account";
        BankAccount: record "Bank Account";
        CompanyInformation: record "Company Information";
    begin
        if Customer.Get(pBillToNo) then begin
            if CopyStr(pPaymentMethodCode, 1, 2) = 'RB' then begin
                if CustomerBankAccount.Get(Customer."No.", Customer."Preferred Bank Account Code") then begin
                    pABICode := CustomerBankAccount.ABI;
                    pCABCode := CustomerBankAccount.CAB;
                    pIBANCode := CustomerBankAccount.IBAN;
                    pBankName := CustomerBankAccount.Name;

                    exit(true);
                end;
            end else
                if (pDocumentBankAccount <> '') and
                    BankAccount.Get(pDocumentBankAccount)
                then begin
                    pABICode := BankAccount.ABI;
                    pCABCode := BankAccount.CAB;
                    pIBANCode := BankAccount.IBAN;
                    pBankName := BankAccount.Name;

                    exit(false)
                end else begin
                    CompanyInformation.Get();

                    pIBANCode := CompanyInformation.IBAN;
                    pBankName := CompanyInformation."Bank Name";

                    exit(false);
                end;
        end else if Vendor.Get(pBillToNo) then begin
            if CopyStr(pPaymentMethodCode, 1, 2) <> 'RB' then begin
                if VendorBankAccount.Get(Vendor."No.", Vendor."Preferred Bank Account Code") then begin
                    pABICode := VendorBankAccount.ABI;
                    pCABCode := VendorBankAccount.CAB;
                    pIBANCode := VendorBankAccount.IBAN;
                    pBankName := VendorBankAccount.Name;

                    exit(true);
                end;
            end else
                if (pDocumentBankAccount <> '') and
                    BankAccount.Get(pDocumentBankAccount)
                then begin
                    pABICode := BankAccount.ABI;
                    pCABCode := BankAccount.CAB;
                    pIBANCode := BankAccount.IBAN;
                    pBankName := BankAccount.Name;

                    exit(false)
                end else begin
                    CompanyInformation.Get();

                    pIBANCode := CompanyInformation.IBAN;
                    pBankName := CompanyInformation."Bank Name";

                    exit(false);
                end;
        end;

        exit(false);

    end;

    procedure SetCustomDocumentReferenceOnLines(var LineLoop: record "EOS Report Buffer Line"; ObjectID: Text)
    var
        SalesHeader: record "Sales Header";
        SalesHeaderArchive: record "Sales Header Archive";
        //CustomSetup: record "MMA04 Custom Setup";
        LastReferenceNo: Code[20];
        DictonaryCode: Code[20];
        ReferenceLineText: Text;
        LineNo: Integer;
        ReferenceLineDictonary: Dictionary of [Code[20], Integer];
        ReferenceGuidDictonary: Dictionary of [Code[20], Guid];
    begin
        // CustomSetup.Get();
        // if not CustomSetup."MMA04 Custom Ref. Doc. Prints" then
        //     exit;

        if not (ObjectID in ['Report 50000' .. 'Report 60000']) then
            exit;

        if LineLoop.IsEmpty or not LineLoop.IsTemporary then
            exit;

        LineLoop.Reset();
        LineLoop.SetCurrentKey("EOS Line No.");
        if LineLoop.FindSet() then
            repeat
                if (LineLoop."EOS Order No." <> '') and
                   (LineLoop."EOS Order No." <> LastReferenceNo)
                then begin
                    LastReferenceNo := LineLoop."EOS Order No.";
                    ReferenceGuidDictonary.Add(LastReferenceNo, LineLoop."EOS Entry ID");
                    ReferenceLineDictonary.Add(LastReferenceNo, LineLoop."EOS Line No.");
                end;
            until LineLoop.Next() = 0;

        foreach DictonaryCode in ReferenceGuidDictonary.Keys do
            if ReferenceLineDictonary.ContainsKey(DictonaryCode) then begin
                Clear(LineNo);
                Clear(ReferenceLineText);

                LineLoop.Reset();
                LineLoop.SetCurrentKey("EOS Line No.");
                LineLoop.SetRange("EOS Entry ID", ReferenceGuidDictonary.Get(DictonaryCode));
                LineLoop.SetFilter("EOS Line No.", '<%1', ReferenceLineDictonary.Get(DictonaryCode));
                if not LineLoop.FindFirst() then begin
                    LineLoop.Get(ReferenceGuidDictonary.Get(DictonaryCode), ReferenceLineDictonary.Get(DictonaryCode));
                    LineNo := LineLoop."EOS Line No." / 2;
                end else
                    if LineLoop.Next(-1) = 0 then
                        LineNo := LineLoop."EOS Line No." / 2
                    else begin
                        LineNo := LineLoop."EOS Line No.";
                        LineLoop.Next();
                        LineNo := (LineLoop."EOS Line No." + LineNo) / 2;
                    end;

                if LineNo <> 0 then begin
                    SalesHeader.Reset();
                    SalesHeaderArchive.Reset();

                    if SalesHeader.Get(SalesHeader."Document Type"::Order, LineLoop."EOS Order No.") then begin
                        // if SalesHeader."Your Reference" = '' then
                        //     ReferenceLineText := StrSubstNo(CustomSetup."MMA04 Reference on Prints", SalesHeader."No.", SalesHeader."Order Date")
                        // else
                        //     ReferenceLineText := StrSubstNo(CustomSetup."MMA04 Reference on Prints-Your", SalesHeader."No.", SalesHeader."Order Date", SalesHeader."Your Reference")
                    end else begin
                        SalesHeaderArchive.SetCurrentKey("Document Type", "No.");
                        SalesHeaderArchive.SetRange("Document Type", SalesHeaderArchive."Document Type"::Order);
                        SalesHeaderArchive.SetRange("No.", LineLoop."EOS Order No.");
                        // if SalesHeaderArchive.FindLast() then
                        //     if SalesHeaderArchive."Your Reference" = '' then
                        //         ReferenceLineText := StrSubstNo(CustomSetup."MMA04 Reference on Prints", SalesHeaderArchive."No.", SalesHeaderArchive."Order Date")
                        //     else
                        //         ReferenceLineText := StrSubstNo(CustomSetup."MMA04 Reference on Prints-Your", SalesHeaderArchive."No.", SalesHeaderArchive."Order Date", SalesHeader."Your Reference");
                    end;

                    if ReferenceLineText <> '' then begin
                        LineLoop.Init();
                        LineLoop := LineLoop;
                        LineLoop."EOS Line No." := LineNo;
                        LineLoop."EOS Description" := '<b>' + ReferenceLineText + '</b>';
                        LineLoop."EOS Type" := LineLoop."EOS Type"::" ";
                        LineLoop."EOS Line Style" := LineLoop."EOS Line Style"::EOSDescription;
                        LineLoop.Insert(true);
                    end;
                end;
            end;

        LineLoop.Reset();
        if LineLoop.FindFirst() then;
    end;

    procedure SetCustomDocumentReferenceForDifferitaLines(var LineLoop: record "EOS Report Buffer Line"; ObjectID: Text)
    var
        SalesInvoiceLine: record "Sales Invoice Line";
        SalesShipmentHeader: record "Sales Shipment Header";
        //CustomSetup: record "MMA04 Custom Setup";
        SalesHeader: Record "Sales Header";
        SalesHeaderArchive: record "Sales Header Archive";
        ReferenceLineText: Text;
        LineNo: Integer;
        DictonaryKeyLine: Integer;
        ReferenceLineKeyDictonary: Dictionary of [Integer, Guid];
    begin
        // CustomSetup.Get();
        // if not CustomSetup."MMA04 Custom Ref. Doc. Prints" then
        //     exit;

        if not (ObjectID in ['Report 50000' .. 'Report 60000']) then
            exit;

        if LineLoop.IsEmpty or not LineLoop.IsTemporary then
            exit;

        if LineLoop."EOS Source Table ID" <> Database::"Sales Invoice Line" then
            exit;

        LineLoop.Reset();
        LineLoop.SetCurrentKey("EOS Line No.");
        if LineLoop.FindSet() then
            repeat
                if LineLoop."EOS Type" = LineLoop."EOS Type"::" " then
                    if CheckLineBufferDescriptionForInvoice(LineLoop."EOS Description") then
                        ReferenceLineKeyDictonary.Add(LineLoop."EOS Line No.", LineLoop."EOS Entry ID");
            until LineLoop.Next() = 0;

        foreach DictonaryKeyLine in ReferenceLineKeyDictonary.Keys do begin
            Clear(ReferenceLineText);

            // LineLoop.Reset();
            // LineLoop.SetCurrentKey("EOS Line No.");
            // LineLoop.SetRange("EOS Entry ID", ReferenceLineKeyDictonary.Get(DictonaryKeyLine));
            // LineLoop.SetFilter("EOS Line No.", '>%1', DictonaryKeyLine);
            // LineLoop.SetFilter("EOS Document No.", '<>%1', '');
            // LineLoop.SetFilter("EOS Type", '<>%1', LineLoop."EOS Type"::" ");
            // if LineLoop.FindFirst() then
            //     if SalesInvoiceLine.Get(LineLoop."EOS Document No.", LineLoop."EOS Source Line No.") then
            //         if SalesShipmentHeader.Get(SalesInvoiceLine."Shipment No.") then
            //             ReferenceLineText := StrSubstNo(CustomSetup."MMA04 Reference on Prints", SalesShipmentHeader."No.", SalesShipmentHeader."Posting Date");

            LineLoop.Get(ReferenceLineKeyDictonary.Get(DictonaryKeyLine), DictonaryKeyLine);
            // if ReferenceLineText <> '' then begin
            //     LineLoop.SetDescription(ReferenceLineText);
            //     LineLoop.Modify();
            //end;

            // --> gestione richiesta inserimento numero ordine e vs riferimento
            SalesHeader.Reset();
            SalesHeaderArchive.Reset();
            ReferenceLineText := '';
            LineNo := LineLoop."EOS Line No." + 1;

            if SalesInvoiceLine.Get(LineLoop."EOS Document No.", LineLoop."EOS Source Line No.") then begin
                SalesInvoiceLine.SetRange("Document No.", SalesInvoiceLine."Document No.");
                SalesInvoiceLine.Next();
                if SalesHeader.Get(SalesHeader."Document Type"::Order, SalesInvoiceLine."Order No.") then begin
                    // if SalesHeader."Your Reference" = '' then
                    //     ReferenceLineText := StrSubstNo(CustomSetup."MMA04 Reference on Prints", SalesHeader."No.", SalesHeader."Order Date")
                    // else
                    //     ReferenceLineText := StrSubstNo(CustomSetup."MMA04 Reference on Prints-Your", SalesHeader."No.", SalesHeader."Order Date", SalesHeader."Your Reference")
                end else begin
                    SalesHeaderArchive.SetCurrentKey("Document Type", "No.");
                    SalesHeaderArchive.SetRange("Document Type", SalesHeaderArchive."Document Type"::Order);
                    SalesHeaderArchive.SetRange("No.", SalesInvoiceLine."Order No.");
                    // if SalesHeaderArchive.FindLast() then
                    //     if SalesHeaderArchive."Your Reference" = '' then
                    //         ReferenceLineText := StrSubstNo(CustomSetup."MMA04 Reference on Prints", SalesHeaderArchive."No.", SalesHeaderArchive."Order Date")
                    //     else
                    //         ReferenceLineText := StrSubstNo(CustomSetup."MMA04 Reference on Prints-Your", SalesHeaderArchive."No.", SalesHeaderArchive."Order Date", SalesHeader."Your Reference");
                end;
            end;

            if ReferenceLineText <> '' then begin
                LineLoop.Init();
                LineLoop := LineLoop;
                LineLoop."EOS Line No." := LineNo;
                //LineLoop."EOS Description" := '<b>' + ReferenceLineText + '</b>';
                LineLoop."EOS Description" := ReferenceLineText;
                LineLoop."EOS Type" := LineLoop."EOS Type"::" ";
                LineLoop."EOS Line Style" := LineLoop."EOS Line Style"::EOSDescription;
                LineLoop.Insert(true);
            end;
            // <-- gestione richiesta inserimento numero ordine e vs riferimento

        end;

        LineLoop.Reset();
        if LineLoop.FindFirst() then;
    end;

    procedure SetCustomDocumentReferenceForCreditMemoLines(var LineLoop: record "EOS Report Buffer Line"; ObjectID: Text)
    var
        SalesCrMemoLine: record "Sales Cr.Memo Line";
        ReturnReceiptHeader: Record "Return Receipt Header";
        //CustomSetup: record "MMA04 Custom Setup";
        ReferenceLineText: Text;
        LineNo: Integer;
        DictonaryKeyLine: Integer;
        ReferenceLineKeyDictonary: Dictionary of [Integer, Guid];
    begin
        // CustomSetup.Get();
        // if not CustomSetup."MMA04 Custom Ref. Doc. Prints" then
        //     exit;

        if not (ObjectID in ['Report 50000' .. 'Report 60000']) then
            exit;

        if LineLoop.IsEmpty or not LineLoop.IsTemporary then
            exit;

        if LineLoop."EOS Source Table ID" <> Database::"Sales Cr.Memo Line" then
            exit;

        LineLoop.Reset();
        LineLoop.SetRange("EOS Type", LineLoop."EOS Type"::" ");
        if LineLoop.FindSet() then
            repeat
                if CheckLineBufferDescriptionForCrMemo(LineLoop."EOS Description") then
                    LineLoop.Delete(true);
            until LineLoop.Next() = 0;

        LineLoop.Reset();
        if LineLoop.FindFirst() then;
    end;

    procedure CollectTrackingFromTrackingSpec(var TmpTrackingSpec: Record "Tracking Specification"; SourceID: Code[20]; SourceType: Integer; SourceSubtype: Integer; SourceRefNo: Integer)
    var
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        TrackingSpecification: Record "Tracking Specification";
        TmpTrackingSpec2: Record "Tracking Specification" temporary;
        ReservEntry: Record "Reservation Entry";
        SignFactor: Integer;
        NewEntryNo: Integer;
    begin
        TmpTrackingSpec2.Reset();
        if TmpTrackingSpec2.IsTemporary then
            TmpTrackingSpec2.DeleteAll();

        ReservEntry."Source Type" := SourceType;
        ReservEntry."Source Subtype" := SourceSubtype;
        SignFactor := CreateReservEntry.SignFactor(ReservEntry);

        TrackingSpecification.Reset();
        TrackingSpecification.SetCurrentKey("Source ID", "Source Type", "Source Subtype", "Source Ref. No.");
        TrackingSpecification.Setrange("Source ID", SourceID);
        TrackingSpecification.Setrange("Source Type", SourceType);
        TrackingSpecification.Setrange("Source Subtype", SourceSubtype);
        TrackingSpecification.Setrange("Source Ref. No.", SourceRefNo);
        if TrackingSpecification.FindSet() then
            repeat
                TmpTrackingSpec2 := TrackingSpecification;
                TmpTrackingSpec2.Insert();
            until TrackingSpecification.Next() = 0;

        NewEntryNo := 1;

        TmpTrackingSpec2.Reset();
        TmpTrackingSpec2.SetCurrentKey("Lot No.", "Serial No.");
        if TmpTrackingSpec2.FindFirst() then
            repeat
                TmpTrackingSpec2.SetRange("Lot No.", TmpTrackingSpec2."Lot No.");
                TmpTrackingSpec2.SetRange("Serial No.", TmpTrackingSpec2."Serial No.");
                TmpTrackingSpec2.CalcSums("Quantity (Base)");

                TmpTrackingSpec := TmpTrackingSpec2;
                TmpTrackingSpec."Quantity (Base)" *= SignFactor;
                TmpTrackingSpec."Entry No." := NewEntryNo;
                TmpTrackingSpec.Insert();

                TmpTrackingSpec2.FindLast();
                TmpTrackingSpec2.SetRange("Lot No.");
                TmpTrackingSpec2.SetRange("Serial No.");
                NewEntryNo += 1;
            until TmpTrackingSpec2.Next() = 0;
    end;

    procedure CreateTrackingSpecOnLineLoop(var TmpTrackSpec: Record "Tracking Specification"; var LineLoop: Record "EOS Report Buffer Line"; LineLoop2: Record "EOS Report Buffer Line"; HeaderLoopEntryID: Guid; var NextLineNo: Integer)
    var

    begin
        TmpTrackSpec.Reset();
        if TmpTrackSpec.FindSet() then
            repeat
                NextLineNo += 10000;
                LineLoop.Init();
                LineLoop."EOS Entry ID" := HeaderLoopEntryID;
                LineLoop."Eos Line No." := NextLineNo;
                //LineLoopComodo."EOS Source ID" := LineLoop."EOS Source ID";
                //LineLoopComodo."EOS Source Table ID" := LineLoop."EOS Source Table ID";
                //LineLoopComodo."EOS Source Subtype" := LineLoop."EOS Source Subtype";
                //LineLoopComodo."EOS Source Line No." := LineLoop."EOS Source Line No.";
                LineLoop."Eos Line Type" := LineLoop."Eos Line Type"::EOSTrackingLine;
                LineLoop."EOS Line Style" := LineLoop."EOS Line Style"::EOSDescriptionQuantity;
                LineLoop."Eos Quantity" := Round(TmpTrackSpec."Quantity (Base)" / LineLoop2."EOS Qty. per Unit of Measure", 0.00001);
                LineLoop."Eos Lot No." := TmpTrackSpec."Lot No.";
                LineLoop."Eos Serial No." := TmpTrackSpec."Serial No.";
                LineLoop."Eos Expiration Date" := TmpTrackSpec."Expiration Date";
                LineLoop.Insert(true);
            until TmpTrackSpec.Next() = 0;
    end;

    #endregion GLOBALS 


    #region LOCALS

    local procedure EditArt62RBLineSalesPrice(DocVariant: Variant; ExtensionCode: Code[20]; ExtensionGuid: Guid; var RBHeader: Record "EOS Report Buffer Header"; var RBLine: Record "EOS Report Buffer Line")
    var
        Item: record item;
        RBLine2: Record "EOS Report Buffer Line" temporary;
        SalesShipmentLine: Record "Sales Shipment Line";
    begin
        RBLine2.Copy(RBLine, true);

        RBLine2.Reset();
        RBLine2.SetRange("EOS Type", RBLine2."EOS Type"::Item);
        RBLine2.SetFilter("EOS Quantity", '<>%1', 0);
        if RBLine2.FindSet() then
            repeat
                if item.Get(RBLine2."EOS No.") //AND (item."MMA04 Art. 62") 
                then
                    if SalesShipmentLine.Get(RBLine2."EOS Document No.", RBLine2."EOS Line No.") then begin
                        RBLine2."EOS Unit Price" := SalesShipmentLine."Unit Price";
                        RBLine2."EOS Line Discount %" := SalesShipmentLine."Line Discount %";
                        RBLine2."EOS VAT %" := SalesShipmentLine."VAT %";
                        RBLine2.Modify();
                    end;
            until RBLine2.Next() = 0;
    end;

    local procedure CheckLineBufferDescriptionForInvoice(pDescrition: Text[100]): Boolean
    var
        //CustomSetup: record "MMA04 Custom Setup";
        CheckTxt: Text[100];
        ControlInText: Text;
        i: Integer;
        j: Integer;
        k: Integer;
    begin
        // CustomSetup.Reset();
        // CustomSetup.Get();
        // if not (CustomSetup."MMA04 Custom Ref. Doc. Prints") or
        //    (CustomSetup."MMA04 String Check Invoice-FD" = '')
        // then
        //     exit(false);

        // for i := 1 to StrLen(CustomSetup."MMA04 String Check Invoice-FD") do
        //     if StrPos(ControlInText, CustomSetup."MMA04 String Check Invoice-FD"[i]) = 0 then
        //         ControlInText += CustomSetup."MMA04 String Check Invoice-FD"[i];

        // k := 1;
        // for i := 1 to StrLen(pDescrition) do
        //     for j := 1 to StrLen(ControlInText) do
        //         if pDescrition[i] = ControlInText[j] then begin
        //             CheckTxt[k] := pDescrition[i];
        //             k += 1;
        //         end;

        // if CheckTxt = CustomSetup."MMA04 String Check Invoice-FD" then
        //     exit(true);
    end;

    local procedure CheckLineBufferDescriptionForCrMemo(pDescrition: Text[100]): Boolean
    var
        //CustomSetup: record "MMA04 Custom Setup";
        CheckTxt: Text[100];
        ControlInText: Text;
        i: Integer;
        j: Integer;
        k: Integer;
    begin
        // CustomSetup.Reset();
        // CustomSetup.Get();
        // if not (CustomSetup."MMA04 Custom Ref. Doc. Prints") or
        //        (CustomSetup."MMA04 String Check Cr. Memo" = '')
        // then
        //     exit(false);

        // for i := 1 to StrLen(CustomSetup."MMA04 String Check Cr. Memo") do
        //     if StrPos(ControlInText, CustomSetup."MMA04 String Check Cr. Memo"[i]) = 0 then
        //         ControlInText += CustomSetup."MMA04 String Check Cr. Memo"[i];

        // k := 1;
        // for i := 1 to StrLen(pDescrition) do
        //     for j := 1 to StrLen(ControlInText) do
        //         if (pDescrition[i] = ControlInText[j]) and not (CheckTxt.Contains(pDescrition[i])) then begin
        //             CheckTxt[k] := pDescrition[i];
        //             k += 1;
        //         end;

        // if CheckTxt = CustomSetup."MMA04 String Check Cr. Memo" then
        //     exit(true);
    end;

    #endregion LOCALS

}
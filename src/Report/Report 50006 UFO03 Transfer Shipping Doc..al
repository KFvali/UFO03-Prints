report 50006 "UFO03 Transfer Shipping Doc."
{
    DefaultLayout = RDLC;
    RDLCLayout = 'UFO03 Transfer Shipping Doc.rdlc';

    CaptionML = ENU = 'Transfer Shipping Doc', ITA = 'Documento di Trasferimento';
    Permissions = TableData "VAT Clause" = r,
                  TableData "VAT Clause Translation" = r;
    PreviewMode = PrintLayout;
    UsageCategory = None;

    dataset
    {
        dataitem(FakeSalesHeader; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.");
            Description = 'Fake Sales Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakeSalesShipmentHeader; "Sales Shipment Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Sales Shipment Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakeReturnReceiptHeader; "Return Receipt Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Return Receipt Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakeSalesInvoiceHeader; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Sales Invoice Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakeSalesCrMemoHeader; "Sales Cr.Memo Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Sales Credit Memo Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakeSalesHeaderArchive; "Sales Header Archive")
        {
            DataItemTableView = sorting("Document Type", "No.", "Doc. No. Occurrence", "Version No.");
            Description = 'Fake Sales Header Archive, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakeServiceHeader; "Service Header")
        {
            DataItemTableView = sorting("Document Type", "No.");
            Description = 'Fake Service Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakeServiceShipmentHeader; "Service Shipment Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Service Shipment Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakeServiceInvoiceHeader; "Service Invoice Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Service InvoiceHeader, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakeServiceCrMemoHeader; "Service Cr.Memo Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Service Cr.Memo Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }

        dataitem(FakePurchaseHeader; "Purchase Header")
        {
            DataItemTableView = sorting("Document Type", "No.");
            Description = 'Fake Purchase Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }

        dataitem(FakePurchRcptHeader; "Purch. Rcpt. Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Purch. Rcpt. Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakeReturnShipmentHeader; "Return Shipment Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Return Shipment Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakePurchInvHeader; "Purch. Inv. Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Purch. Inv. Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakePurchCrMemoHdr; "Purch. Cr. Memo Hdr.")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Purch. Cr. Memo Hdr., Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }
        dataitem(FakePurchaseHeaderArchive; "Purchase Header Archive")
        {
            DataItemTableView = sorting("Document Type", "No.", "Doc. No. Occurrence", "Version No.");
            Description = 'Fake Purchase Header Archive, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }

        dataitem(FakeTransferHeader; "Transfer Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Transfer Header, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }

        dataitem(FakeTransferShipmentHeader; "Transfer Shipment Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Transfer ShipmentHeader, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }

        dataitem(FakeTransferReceiptHeader; "Transfer Receipt Header")
        {
            DataItemTableView = sorting("No.");
            Description = 'Fake Transfer ReceiptHeader, Only for Report Selection Integration';
            trigger OnPreDataItem()
            begin
                CurrReport.Break();
            end;
        }

        dataitem(HeaderLoop; "EOS Report Buffer Header")
        {
            UseTemporary = true;
            DataItemTableView = sorting("EOS No.");
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(SourceSubtype; HeaderLoop."EOS Source Subtype") { }
                column(HeaderImage; HeaderLoop."EOS Header Image") { }
                column(FooterImage; HeaderLoop."EOS Footer Image") { }
                column(CompanyPicture; CompanyInfo.Picture) { }
                //column(ReportTitle; HeaderLoop."EOS Report Title") { }

                // column(ReportCustomText; CustomSetup.getReporttext()) { }//22.04.2021 Gestione testi custom report IAD+
                // column(SignatureImage; CustomSetup."MMA04 Signature Image") { }//23.04.2021 Firma (setup mazzoni)
                column(CopyNo; Number) { }
                column(DocumentNo; HeaderLoop."EOS No.") { }
                column(PostingDate; HeaderLoop."EOS Posting Date") { }
                column(SourceID; HeaderLoop."EOS Source Table ID") { }
                column(Salesperson; Salesperson.Code) { } //mdp+ 12.01.21
                //Start mpd+ 010221
                column(CupCode; CupCode_Value) { }
                column(CigCode; CigCode_Value) { }
                column(OurBankRef; OurBankRef) { }
                //Stop mpd+ 010221
                //Start iad+ 020321
                column(OurBankRef1; OurBankRef1) { }
                //Stop iad+ 020321
                column(OperatorName; Employee.FullName()) { }
                column(SelltoBuyFromNo; HeaderLoop."EOS Sell-to/Buy-From No.") { }
                column(SellToBuyFromAddr; HeaderLoop.GetSellToBuyFromAddr()) { }
                column(BillToNo; HeaderLoop."EOS Bill-to/Pay-to No.") { }
                //Start  22032021 fix county /iad
                //ORG column(BillToAddress; HeaderLoop.GetBillToPayToAddr()) { }

                //ORG  column(ShipToAddress; HeaderLoop.GetShipToAddr()) { }
                column(ShipToAddress; GetShipToFormattedAddress()) { }
                column(BillToAddress; GetBillToFormattedAddress()) { }
                //Start  22032021 fix county /iad

                //Start npa 21.05.2021
                column(HideAddressCaption; HideAddressCaption) { }
                //Stop npa 21.05.2021
                column(LocationAddress; MMA_LocationAddr()) { }
                column(CustomerVendorContact; BuyFromContact.Name) { }
                column(CustomerVendorEMail; BuyFromContact."E-Mail") { }
                column(PaymentTerms; HeaderLoop.PaymentTerms_GetDescInLanguage()) { }
                column(PaymentMethod; HeaderLoop.PaymentMethod_GetDescInLanguage()) { }
                column(Reason; HeaderLoop.ReasonCode_GetDescInLanguage()) { }
                column(VATRegNo; HeaderLoop."EOS VAT Registration No.") { }
                column(FiscalCode; HeaderLoop."EOS Fiscal Code") { }
                //column(ShptMethod; HeaderLoop.ShptMethod_GetDescInLanguage()) { }
                column(ShptMethod; ShipmentMethodDesc) { }
                column(ShptBy; Format(HeaderLoop."EOS Shipment by")) { }
                column(ShpAgent; HeaderLoop.GetShippingAgentText()) { }
                column(GoodsAppearance; HeaderLoop."EOS Goods Appearance") { }
                column(ShipmentStartingDateTime; StrSubstNo('%1 %2', DT2Date(HeaderLoop."EOS Shipment Starting Date"), DT2Time(HeaderLoop."EOS Shipment Starting Date"))) { }
                column(ReturnAddress; HeaderLoop."EOS Return Address") { }
                column(NoOfParcels; HeaderLoop."EOS No. of Parcels") { }
                column(GrossWeight; HeaderLoop."EOS Gross Weight Dec") { }
                column(NetWeight; HeaderLoop."EOS Net Weight Dec") { }
                column(Volume; HeaderLoop."EOS Volume Dec") { }
                column(AddressPosition; Format(ReportSetup."EOS Address Position", 0, 9)) { }
                column(OurBank; HeaderLoop."EOS Bank IBAN") { }
                column(YourReference; HeaderLoop."EOS Your Reference") { }
                column(OrderDate; HeaderLoop."EOS Order Date") { }
                column(ShipmentDate; HeaderLoop."EOS Shipment Date") { }
                column(ValidTo; HeaderLoop."EOS Valid to") { }
                column(VATExclDeclaration; HeaderLoop."EOS Footer Line") { }
                column(VATLineAmountToPay; HeaderLoop."EOS Amount Including VAT") { }
                //Start iad
                column(ShowArt62Text; CheckArt62Item(HeaderLoop."EOS No.", HeaderLoop."EOS Source Table ID")) { }
                column(ShowLicenseReqText; CheckLicenseReqItem(HeaderLoop."EOS No.", HeaderLoop."EOS Source Table ID")) { }
                column(TextLicenseCptNew; TextLicense) { } //mpd+ 29.12.20
                //Stop iad
                //Start mpd+ 06.12.21
                column(CustomerPestLicense; CustomerPesticideLicense) { }
                //Stop mpd+ 06.12.21
                column(CstmHdrTxt1; HeaderLoop.GetCustomFieldTextValue('CustomText1')) { }
                column(CstmHdrTxt2; HeaderLoop.GetCustomFieldTextValue('CustomText2')) { }
                column(CstmHdrTxt3; HeaderLoop.GetCustomFieldTextValue('CustomText3')) { }
                column(CstmHdrTxt4; HeaderLoop.GetCustomFieldTextValue('CustomText4')) { }
                column(CstmHdrTxt5; HeaderLoop.GetCustomFieldTextValue('CustomText5')) { }
                column(CstmHdrTxt6; HeaderLoop.GetCustomFieldTextValue('CustomText6')) { }
                column(CstmHdrTxt7; HeaderLoop.GetCustomFieldTextValue('CustomText7')) { }
                column(CstmHdrTxt8; HeaderLoop.GetCustomFieldTextValue('CustomText8')) { }
                column(CstmHdrTxt9; HeaderLoop.GetCustomFieldTextValue('CustomText9')) { }
                column(CstmHdrTxt10; HeaderLoop.GetCustomFieldTextValue('CustomText10')) { }
                column(CstmHdrTxt11; HeaderLoop.GetCustomFieldTextValue('CustomText11')) { }
                column(CstmHdrTxt12; HeaderLoop.GetCustomFieldTextValue('CustomText12')) { }
                column(CstmHdrTxt13; HeaderLoop.GetCustomFieldTextValue('CustomText13')) { }
                column(CstmHdrTxt14; HeaderLoop.GetCustomFieldTextValue('CustomText14')) { }
                column(CstmHdrTxt15; HeaderLoop.GetCustomFieldTextValue('CustomText15')) { }
                column(CstmHdrTxt16; HeaderLoop.GetCustomFieldTextValue('CustomText16')) { }
                column(CstmHdrTxt17; HeaderLoop.GetCustomFieldTextValue('CustomText17')) { }
                column(CstmHdrTxt18; HeaderLoop.GetCustomFieldTextValue('CustomText18')) { }
                column(CstmHdrTxt19; HeaderLoop.GetCustomFieldTextValue('CustomText19')) { }
                column(CstmHdrTxt20; HeaderLoop.GetCustomFieldTextValue('CustomText20')) { }
                column(CstmHdrTxt21; HeaderLoop.GetCustomFieldTextValue('CustomText21')) { }
                column(CstmHdrTxt22; HeaderLoop.GetCustomFieldTextValue('CustomText22')) { }
                column(CstmHdrTxt23; HeaderLoop.GetCustomFieldTextValue('CustomText23')) { }
                column(CstmHdrTxt24; HeaderLoop.GetCustomFieldTextValue('CustomText24')) { }
                column(CstmHdrTxt25; HeaderLoop.GetCustomFieldTextValue('CustomText25')) { }
                column(CstmHdrTxt26; HeaderLoop.GetCustomFieldTextValue('CustomText26')) { }
                column(CstmHdrTxt27; HeaderLoop.GetCustomFieldTextValue('CustomText27')) { }
                column(CstmHdrTxt28; HeaderLoop.GetCustomFieldTextValue('CustomText28')) { }
                column(CstmHdrTxt29; HeaderLoop.GetCustomFieldTextValue('CustomText29')) { }
                column(CstmHdrTxt30; HeaderLoop.GetCustomFieldTextValue('CustomText30')) { }
                column(CstmHdrDec1; HeaderLoop.GetCustomFieldDecimalValue('CustomDecimal1')) { }
                column(CstmHdrDec2; HeaderLoop.GetCustomFieldDecimalValue('CustomDecimal2')) { }
                column(CstmHdrDec3; HeaderLoop.GetCustomFieldDecimalValue('CustomDecimal3')) { }
                column(CstmHdrDec4; HeaderLoop.GetCustomFieldDecimalValue('CustomDecimal4')) { }
                column(CstmHdrDec5; HeaderLoop.GetCustomFieldDecimalValue('CustomDecimal5')) { }
                column(CstmHdrInt1; HeaderLoop.GetCustomFieldIntegerValue('CustomInteger1')) { }
                column(CstmHdrInt2; HeaderLoop.GetCustomFieldIntegerValue('CustomInteger2')) { }
                column(CstmHdrInt3; HeaderLoop.GetCustomFieldIntegerValue('CustomInteger3')) { }
                column(CstmHdrInt4; HeaderLoop.GetCustomFieldIntegerValue('CustomInteger4')) { }
                column(CstmHdrInt5; HeaderLoop.GetCustomFieldIntegerValue('CustomInteger5')) { }

                column(CstmHdrFieldLabel1; HeaderLoop.GetCustomFieldTextValue('CustomFieldLabel1')) { }
                column(CstmHdrFieldValue1; HeaderLoop.GetCustomFieldTextValue('CustomFieldValue1')) { }
                column(CstmHdrFieldLabel2; HeaderLoop.GetCustomFieldTextValue('CustomFieldLabel2')) { }
                column(CstmHdrFieldValue2; HeaderLoop.GetCustomFieldTextValue('CustomFieldValue2')) { }
                column(PrintText1; PrintText1) { }
                //Start mpd+ 29.12.20
                // column(ShippingComments; StrSubstNo('%1 %2 %3 %4 %5 %6 %7 %8 %9 %10', ShippingComments[1], ShippingComments[2], ShippingComments[3], ShippingComments[4], ShippingComments[5],
                //                                                         ShippingComments[6], ShippingComments[7], ShippingComments[8], ShippingComments[9], ShippingComments[10]))
                // { }
                column(ShippingComments; ShippingCommentsText) { } //Didascalia Trasporto Conto Proprio
                //Stop mpd+ 29.12.20
                column(IsCustomerBank; IsCustomerBank) { }
                column(ABICode; ABICode) { }
                column(CABCode; CABCode) { }
                column(IBANCode; IBANCode) { }
                column(BankName; BankName) { }
                column(CurrencyCode; HeaderLoop."EOS Currency Code") { }
                column(PaymentMethodCode; HeaderLoop."EOS Payment Method Code") { }
                dataitem(LineLoop; "EOS Report Buffer Line")
                {
                    DataItemLinkReference = HeaderLoop;
                    DataItemLink = "EOS Entry ID" = field("EOS Entry ID");
                    DataItemTableView = sorting("EOS Entry ID", "EOS Line No.");
                    UseTemporary = true;

                    column(Line_Type; Format(LineLoop."EOS Type", 0, 2)) { }
                    column(Line_LineType; Format(LineLoop."EOS Line type", 0, 2)) { }
                    column(Line_Style; Format("EOS Line Style", 0, 2)) { }
                    column(Line_ExtensionCode; LineLoop."EOS Extension Code") { }
                    column(Line_LineNo; LineLoop."EOS Line No.") { }
                    //Start IAD 21.12.2020
                    column(Line_ItemNo; LineLoop."EOS No.") { }
                    column(Line_Description; LineLoop."EOS Description") { }
                    column(showvariant; showvariant) { }
                    column(Line_ItemVariantNo; LineLoop."EOS Variant Code") { }
                    column(Line_ItemVariantDesc; ItemVariantDesc) { }
                    //Stop IAD 21.12.2020
                    //Start mpd+ 06.12.21
                    column(Line_RegNo; PhytoItemRegNo) { }
                    //Stop mpd+ 06.12.21
                    column(Line_Description2; LineLoop."EOS Description 2") { }
                    column(Line_Quantity; LineLoop."EOS Quantity") { }
                    column(Line_UoMCode; CopyStr(LineLoop.GetUdMTraduction(HeaderLoop), 1, 4)) { }
                    //column(Line_LineDiscountPerc; LineLoop."EOS Discount Text") { } //ORG. mpd- 08.02.21
                    column(Line_LineDiscountPerc; LineLoop."EOS Line Discount %") { } //mpd+ 08.02.21
                    column(Line_UnitPrice; LineLoop."EOS Unit Price") { }
                    column(Line_Amount; LineLoop."EOS Amount" + LineLoop."EOS Inv. Discount Amount") { }
                    //column(Line_VATIdentifier; LineLoop."EOS VAT Identifier") { }
                    column(Line_VATIdentifier; VATIdentifier) { }
                    column(Line_ShipmentDate; LineLoop."EOS Shipment Date") { }
                    column(Line_Type_Desc; Format(LineLoop."EOS Type")) { }
                    column(Line_OrderQuantity; LineLoop."EOS Source Line Quantity") { }
                    column(CstmLneTxt1; LineLoop.GetCustomFieldTextValue('CustomText1')) { }
                    column(CstmLneTxt2; LineLoop.GetCustomFieldTextValue('CustomText2')) { }
                    column(CstmLneTxt3; LineLoop.GetCustomFieldTextValue('CustomText3')) { }
                    column(CstmLneTxt4; LineLoop.GetCustomFieldTextValue('CustomText4')) { }
                    column(CstmLneTxt5; LineLoop.GetCustomFieldTextValue('CustomText5')) { }
                    column(CstmLneTxt6; LineLoop.GetCustomFieldTextValue('CustomText6')) { }
                    column(CstmLneTxt7; LineLoop.GetCustomFieldTextValue('CustomText7')) { }
                    column(CstmLneTxt8; LineLoop.GetCustomFieldTextValue('CustomText8')) { }
                    column(CstmLneTxt9; LineLoop.GetCustomFieldTextValue('CustomText9')) { }
                    column(CstmLneTxt10; LineLoop.GetCustomFieldTextValue('CustomText10')) { }
                    column(CstmLneTxt11; LineLoop.GetCustomFieldTextValue('CustomText11')) { }
                    column(CstmLneTxt12; LineLoop.GetCustomFieldTextValue('CustomText12')) { }
                    column(CstmLneTxt13; LineLoop.GetCustomFieldTextValue('CustomText13')) { }
                    column(CstmLneTxt14; LineLoop.GetCustomFieldTextValue('CustomText14')) { }
                    column(CstmLneTxt15; LineLoop.GetCustomFieldTextValue('CustomText15')) { }
                    column(CstmLneTxt16; LineLoop.GetCustomFieldTextValue('CustomText16')) { }
                    column(CstmLneTxt17; LineLoop.GetCustomFieldTextValue('CustomText17')) { }
                    column(CstmLneTxt18; LineLoop.GetCustomFieldTextValue('CustomText18')) { }
                    column(CstmLneTxt19; LineLoop.GetCustomFieldTextValue('CustomText19')) { }
                    column(CstmLneTxt20; LineLoop.GetCustomFieldTextValue('CustomText20')) { }
                    column(CstmLneTxt21; HeaderLoop.GetCustomFieldTextValue('CustomText21')) { }
                    column(CstmLneTxt22; HeaderLoop.GetCustomFieldTextValue('CustomText22')) { }
                    column(CstmLneTxt23; HeaderLoop.GetCustomFieldTextValue('CustomText23')) { }
                    column(CstmLneTxt24; HeaderLoop.GetCustomFieldTextValue('CustomText24')) { }
                    column(CstmLneTxt25; HeaderLoop.GetCustomFieldTextValue('CustomText25')) { }
                    column(CstmLneTxt26; HeaderLoop.GetCustomFieldTextValue('CustomText26')) { }
                    column(CstmLneTxt27; HeaderLoop.GetCustomFieldTextValue('CustomText27')) { }
                    column(CstmLneTxt28; HeaderLoop.GetCustomFieldTextValue('CustomText28')) { }
                    column(CstmLneTxt29; HeaderLoop.GetCustomFieldTextValue('CustomText29')) { }
                    column(CstmLneTxt30; HeaderLoop.GetCustomFieldTextValue('CustomText30')) { }
                    column(CstmLneDec1; LineLoop.GetCustomFieldDecimalValue('CustomDecimal1')) { }
                    column(CstmLneDec2; LineLoop.GetCustomFieldDecimalValue('CustomDecimal2')) { }
                    column(CstmLneDec3; LineLoop.GetCustomFieldDecimalValue('CustomDecimal3')) { }
                    column(CstmLneDec4; LineLoop.GetCustomFieldDecimalValue('CustomDecimal4')) { }
                    column(CstmLneDec5; LineLoop.GetCustomFieldDecimalValue('CustomDecimal5')) { }
                    column(CstmLneInt1; LineLoop.GetCustomFieldIntegerValue('CustomInteger1')) { }
                    column(CstmLneInt2; LineLoop.GetCustomFieldIntegerValue('CustomInteger2')) { }
                    column(CstmLneInt3; LineLoop.GetCustomFieldIntegerValue('CustomInteger3')) { }
                    column(CstmLneInt4; LineLoop.GetCustomFieldIntegerValue('CustomInteger4')) { }
                    column(CstmLneInt5; LineLoop.GetCustomFieldIntegerValue('CustomInteger5')) { }

                    trigger OnAfterGetRecord()
                    var
                        Lines: Record "EOS Report Buffer Line" temporary;
                        Item: Record "Item" temporary;
                        //jobshipline: Record "MMA07 Job Shipment Line";
                        ItemVariant: Record "Item Variant";
                        LocItem: Record Item;
                        TransferShipmentLine: Record "Transfer Shipment Line";
                        lSalesLine: Record "Sales Line";
                    begin
                        if ImagesSent then begin
                            Clear(HeaderLoop."EOS Header Image");
                            Clear(HeaderLoop."EOS Footer Image");
                        end else
                            ImagesSent := true;

                        //Start npa 21.05.2021
                        if (LineLoop."EOS Source Table ID" = Database::"Transfer Shipment Line") and (LineLoop."EOS Type" = LineLoop."EOS Type"::Item) then begin
                            if LineLoop."EOS Variant Code" = '' then
                                if TransferShipmentLine.Get(HeaderLoop."EOS No.", LineLoop."EOS Line No.") then begin
                                    if TransferShipmentLine."Variant Code" <> '' then
                                        LineLoop."EOS Variant Code" := TransferShipmentLine."Variant Code";
                                end;
                        end;
                        //Stop npa 21.05.2021

                        lSalesLine.Reset();
                        lSalesLine.SetRange("Document Type", lSalesLine."Document Type"::Order);
                        lSalesLine.SetRange("Document No.", LineLoop."EOS Order No.");
                        lSalesLine.SetRange("Line No.", "EOS Order Line No.");
                        if lSalesLine.FindFirst() then begin
                            if LineLoop."EOS VAT Identifier" = '' then
                                VATIdentifier := lSalesLine."VAT Identifier"
                            else
                                VATIdentifier := Format(LineLoop."EOS VAT Identifier")
                        end;

                        ItemVariant.reset;
                        showvariant := false;
                        if itemVariant.get(LineLoop."EOS No.", LineLoop."EOS Variant Code")
                        and (LineLoop."EOS Quantity" <> 0) //mpd+ 12.01.21
                        then begin
                            showvariant := true;
                            if itemvariant.Description <> '' then
                                ItemVariantDesc := itemvariant.Description
                        end;

                        PhytoItemRegNo := '';
                        // if LocItem.Get(LineLoop."EOS No.") and LocItem."MMA04 License Requested" then
                        //     PhytoItemRegNo := LocItem."MMA04 Reg No Ministery Health";

                        //Message('LineInfo %1 %2 %3 %4', LineLoop."EOS Line Style", LineLoop."EOS Line type", LineLoop."EOS Quantity", LineLoop."EOS Type");

                        // --> gestione lotti 
                        if LineLoop."EOS Line Type" = LineLoop."EOS Line type"::EOSTrackingLine then begin
                            LineLoop."EOS Description" := '';
                            IF (LineLoop."EOS Lot No." <> '') AND (LineLoop."EOS Serial No." = '') then
                                LineLoop."EOS Description" := COPYSTR(STRSUBSTNO('Nr.lotto: %1', LineLoop."EOS Lot No."), 1, MAXSTRLEN(LineLoop."EOS Description"));
                            IF (LineLoop."EOS Serial No." <> '') AND (LineLoop."EOS Lot No." = '') then
                                LineLoop."EOS Description" := COPYSTR(STRSUBSTNO('Nr. seriale %1', LineLoop."EOS Serial No."), 1, MAXSTRLEN(LineLoop."EOS Description"));
                            IF (LineLoop."EOS Serial No." <> '') AND (LineLoop."EOS Lot No." <> '') then
                                LineLoop."EOS Description" := COPYSTR(STRSUBSTNO('Nr. lotto %1, nr. seriale %2', LineLoop."EOS Lot No.", LineLoop."EOS Serial No."), 1, MAXSTRLEN(LineLoop."EOS Description"));
                        end;
                        // <-- gestione lotti 

                    end;
                }
                dataitem(Totals; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(VAT_Identifier1; VAT_Identifier[1]) { }
                    column(VAT_Perc1; VAT_Perc[1]) { }
                    column(VAT_Description1; VAT_Description[1]) { }
                    column(VAT_Base1; VAT_Base[1]) { }
                    column(VAT_Amount1; VAT_Amount[1]) { }
                    column(VAT_InvoiceDiscountAmount1; VAT_InvoiceDiscountAmount[1]) { }
                    column(VAT_ClauseCode1; VAT_ClauseCode[1]) { }
                    column(VAT_ClauseDescription1; VAT_ClauseDescription[1]) { }
                    column(VAT_Identifier2; VAT_Identifier[2]) { }
                    column(VAT_Perc2; VAT_Perc[2]) { }
                    column(VAT_Description2; VAT_Description[2]) { }
                    column(VAT_Base2; VAT_Base[2]) { }
                    column(VAT_Amount2; VAT_Amount[2]) { }
                    column(VAT_InvoiceDiscountAmount2; VAT_InvoiceDiscountAmount[2]) { }
                    column(VAT_ClauseCode2; VAT_ClauseCode[2]) { }
                    column(VAT_ClauseDescription2; VAT_ClauseDescription[2]) { }
                    column(VAT_Identifier3; VAT_Identifier[3]) { }
                    column(VAT_Perc3; VAT_Perc[3]) { }
                    column(VAT_Description3; VAT_Description[3]) { }
                    column(VAT_Base3; VAT_Base[3]) { }
                    column(VAT_Amount3; VAT_Amount[3]) { }
                    column(VAT_InvoiceDiscountAmount3; VAT_InvoiceDiscountAmount[3]) { }
                    column(VAT_ClauseCode3; VAT_ClauseCode[3]) { }
                    column(VAT_ClauseDescription3; VAT_ClauseDescription[3]) { }
                    column(VAT_Identifier4; VAT_Identifier[4]) { }
                    column(VAT_Perc4; VAT_Perc[4]) { }
                    column(VAT_Description4; VAT_Description[4]) { }
                    column(VAT_Base4; VAT_Base[4]) { }
                    column(VAT_Amount4; VAT_Amount[4]) { }
                    column(VAT_InvoiceDiscountAmount4; VAT_InvoiceDiscountAmount[4]) { }
                    column(VAT_ClauseCode4; VAT_ClauseCode[4]) { }
                    column(VAT_ClauseDescription4; VAT_ClauseDescription[4]) { }
                    column(ShowVATClauseTab; VAT_ClauseCode[1] + VAT_ClauseCode[2] + VAT_ClauseCode[3] + VAT_ClauseCode[4] <> '') { }
                    column(PaymentLine_DueDate1; PaymentLine_DueDate[1]) { }
                    column(PaymentLine_Amount1; PaymentLine_Amount[1]) { }
                    column(PaymentLine_DueDate2; PaymentLine_DueDate[2]) { }
                    column(PaymentLine_Amount2; PaymentLine_Amount[2]) { }
                    column(PaymentLine_DueDate3; PaymentLine_DueDate[3]) { }
                    column(PaymentLine_Amount3; PaymentLine_Amount[3]) { }
                    column(PaymentLine_DueDate4; PaymentLine_DueDate[4]) { }
                    column(PaymentLine_Amount4; PaymentLine_Amount[4]) { }
                    column(VATLineCurrencyCode; HeaderLoop."EOS Currency Code") { }
                    column(VATLineTotal; VATLineTotal) { }
                    column(VATLineInvDiscTotal; VATLineInvDiscTotal) { }
                    column(VATLineBaseTotal; VATLineBaseTotal) { }
                    column(VATLineAmountTotal; VATLineAmountTotal) { }
                    column(VATLineAmountInclVATTotal; VATLineAmountInclVATTotal) { }
                    column(PrintVat; PrintVAT) { }
                }

                trigger OnAfterGetRecord()
                begin
                    if not HeaderLoop."EOS Hide Prices" then begin
                        HeaderLoop.GetVATAmountLines(LineLoop,
                                                    VAT_Identifier,
                                                    VAT_Perc,
                                                    VAT_Description,
                                                    VAT_Base,
                                                    VAT_Amount,
                                                    VAT_InvoiceDiscountAmount,
                                                    VAT_ClauseCode,
                                                    VAT_ClauseDescription,
                                                    VATLineTotal,
                                                    VATLineInvDiscTotal,
                                                    VATLineBaseTotal,
                                                    VATLineAmountTotal,
                                                    VATLineAmountInclVATTotal);
                        HeaderLoop.GetPaymentLines(PaymentLine_DueDate, PaymentLine_Amount)
                    end;
                    if not CurrReport.Preview() then
                        HeaderLoop.CountPrinted();

                end;

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, 1 + HeaderLoop."EOS No. of Copies");
                end;
            }

            trigger OnAfterGetRecord()
            var
                PrintsManagement: Codeunit "UFO03 Prints Managment";
                Commentline: Record "Comment Line";
                SalesShipHeader: record "Sales Shipment Header";
                Locsalesheader: Record "Sales Header";
                loccustomer: Record Customer;
                locbankAcc: Record "Customer Bank Account";
                TransferShipmentHeader: Record "Transfer Shipment Header";
                i: Integer;
            begin
                if not ReportSetup.Get(HeaderLoop."EOS Report Setup Code") then
                    ReportSetup.Init();

                if not Salesperson.Get(HeaderLoop."EOS Salesperson Code") then
                    Clear(Salesperson);

                if not Employee.Get(HeaderLoop."EOS Operator No.") then
                    Clear(Employee);

                if not BuyFromContact.Get(HeaderLoop."EOS Sell-to Contact No.") then
                    Clear(BuyFromContact);

                if not SellToContact.Get(HeaderLoop."EOS Sell-to Contact No.") then
                    Clear(SellToContact);


                // >>> 20241022 VL --> commentato perché vecchio di EOS
                // if ReportSetup."EOS Print Logos" then begin
                //     HeaderLoop.GetHeaderImage(HeaderImage);
                //     HeaderLoop.GetFooterImage(FooterImage);
                // end;

                IF ReportSetup."EOS Print Logos" then
                    HeaderLoop.PopulateHeaderFooterImages();
                // <<< 20241022 VL 

                if not CurrReport.Preview() then
                    HeaderLoop.LogInteraction();

                //Start mpd+ 010221
                CigCode_Value := '';
                CupCode_Value := '';
                if SalesShipHeader.get(HeaderLoop."EOS No.") then
                    if Locsalesheader.Get(Locsalesheader."Document Type"::Order, SalesShipHeader."Order No.") then begin
                        CigCode_Value := Locsalesheader."Fattura Tender Code";
                        CupCode_Value := Locsalesheader."Fattura Project Code";

                    end;
                // Test lunghezza campi
                // CigCode_Value := 'Z212F8C476';
                // CupCode_Value := 'E44H19000910004';
                //Customsetup.get;

                // >>> commentato perché gestito in maniera differente
                // OurBankRef := '';
                // OurBankRef1 := '';
                // if loccustomer.get(HeaderLoop."EOS Bill-to/Pay-to No.") then
                //     if loccustomer."Preferred Bank Account Code" <> '' then begin
                //         if locbankAcc.Get(loccustomer."No.", loccustomer."Preferred Bank Account Code") then begin

                //             //ORG  OurBankRef := CopyStr(locbankAcc.Name, 1, 26);//Perche fino a 26??

                //             OurBankRef := CopyStr(locbankAcc.Name, 1, 49);//21.04.21 IAD+
                //             if locbankAcc.ABI <> '' then
                //                 OurBankRef1 += 'ABI:' + locbankAcc.ABI;

                //             if locbankAcc.CAB <> '' then
                //                 OurBankRef1 += '   CAB:' + locbankAcc.CAB;
                //         end;
                //     end
                //     else begin

                //         if locBankAcc.Get(loccustomer."EOS Our Bank Account") then
                //             OurBankRef := CopyStr(locBankAcc.Name, 1, 49);

                //     end;
                // <<< commentato perché gestito in maniera differente
                //Stop mpd+ 010221


                //Start 29.12.20 mpd+
                TextLicense := '';
                if CheckShippingAgentComments() then
                    TextLicense := TextLicenseLbl;
                //Stop 29.12.20 mpd+

                //Start  24.12.2020 Gestione Testi trasporto conto proprio /IAD  
                //if HeaderLoop."EOS Source Table ID" = 110 then begin //mpd- 29.12.20
                ShippingCommentsText := '';
                if HeaderLoop."EOS Source Table ID" = Database::"Sales Shipment Header" then begin //mpd+ 29.12.20
                    if SalesShipHeader.get(HeaderLoop."EOS No.") then;
                    if SalesShipHeader."Shipping Agent Code" <> '' then begin

                        CommentLine.Reset();
                        //CommentLine.SetRange("Table Name", CommentLine."Table Name"::"Shipping Agent");
                        CommentLine.SetRange("No.", SalesShipHeader."Shipping Agent Code");
                        if CommentLine.FindSet() then
                            repeat
                                ShippingCommentsText += CommentLine.Comment + '';
                            until CommentLine.Next() = 0;
                    end;
                    //Stop  24.12.2020 Gestione Testi trasporto Conto proprio /IAD
                end;

                if HeaderLoop."EOS Shipment Method Code" <> '' then begin
                    if ShipmentMethod.get(HeaderLoop."EOS Shipment Method Code") then
                        ShipmentMethodDesc := ShipmentMethod.Description
                    else
                        ShipmentMethodDesc := HeaderLoop.ShptMethod_GetDescInLanguage()
                end else begin
                    if SalesShipHeader."Shipment Method Code" <> '' then
                        if ShipmentMethod.get(SalesShipHeader."Shipment Method Code") then
                            ShipmentMethodDesc := ShipmentMethod.Description
                end;


                //Start npa 21.05.2021
                if (HeaderLoop."EOS Source Table ID" = Database::"Transfer Shipment Header") then begin
                    HideAddressCaption := TransferShipmentHeader.Get(HeaderLoop."EOS No.");
                end;
                //Stop npa 21.05.2021

                SalesShipHeader.Reset();
                if SalesShipHeader.Get(HeaderLoop."EOS No.") then;
                IsCustomerBank := PrintsManagement.GetBankInformation(HeaderLoop."EOS Bill-to/Pay-to No.", HeaderLoop."EOS Payment Method Code", SalesShipHeader."EOS Our Bank Account", ABICode, CABCode, IBANCode, BankName);

                // >>> KF DEBUG-MODE
                // if Debug then
                //     SetRecRefForDebugMode(HeaderLoop."EOS Source Table ID", HeaderLoop."EOS Source Subtype", HeaderLoop."EOS Source ID");
                // <<< KF DEBUG-MODE

            end;
        }
    }

    requestpage
    {
        Caption = 'Options';

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(ReportSetupCodeFld; ReportSetupCode)
                    {
                        CaptionML = ENU = 'Report Setup Code', ITA = 'Cod. Setup Report';
                        TableRelation = "EOS Report Setup";
                        ApplicationArea = All;
                        trigger OnValidate()
                        begin
                            if ReportSetup.Get(ReportSetupCode) then begin
                                LogInteraction := ReportSetup."EOS Log Interaction";
                                UpdateLocalCopies();
                                RequestOptionsPage.Update(false);
                            end;
                        end;
                    }
                    field(NoofCopiesFld; NoOfCopies)
                    {
                        CaptionML = ENU = 'No. of Copies', ITA = 'Nr. di copie';
                        ApplicationArea = All;
                        Editable = NoofCopiesEditable;
                    }
                    field(LogInteractionFld; LogInteraction)
                    {
                        CaptionML = ENU = 'Log Interaction', ITA = 'Log Interazione';
                        ApplicationArea = All;
                    }
                    field(Debug; Debug)
                    {
                        CaptionML = ENU = 'Debug', ITA = 'Debug';
                        ApplicationArea = All;
                        ToolTip = 'Download Dataset';
                    }
                    // field(PrintVAT; PrintVAT)
                    // {
                    //     CaptionML = ENU = 'Hide VAT', ITA = 'Nascondi IVA';
                    //     ApplicationArea = All;
                    // }
                }
            }
        }

        trigger OnOpenPage()
        var
            SubscriptionMgt: Codeunit "EOS EX009 Subscription";
        begin
            RequestOptionsPage.Caption := RequestOptionsPage.Caption() + SubscriptionMgt.GetLicenseText(true);

            DetectCurrentDocument();
        end;
    }

    labels
    {
        label(ReportTitle; ENU = 'Transport Document', ITA = 'Documento di Trasporto')
        label(ReporttitleText; ENU = 'ADR transport document pursuant to section 5.4.1 of the ADR Transport sheet (DM 554/2009)', ITA = 'Documento di trasporto ADR ai sensi della sezione 5.4.1 dell''ADR Scheda di trasporto (DM 554/2009)')
        //'Documento di trasporto ADR ai sensi della sezione 5.4.1 dell''ADR Scheda di trasporto (DM 554/2009)';
        label(RecipientCaption; ENU = 'Recepient', ITA = 'Destinatario')
        label(PlaceCaption; ENU = 'Place of Destination (Delivery address)', ITA = 'Luogo di destinazione')
        label(BillToAddress_Caption; ENU = 'Billing address', ITA = 'Indirizzo Fatturazione')
        label(CIGCaption; ENU = 'CIG', ITA = 'CIG')
        label(CUPCaption; ENU = 'CUP', ITA = 'CUP')
        label(CustomerVendorContact_Caption; ENU = 'Contact', ITA = 'Contatto')
        label(CustomerVendorMail_Caption; ENU = 'E-Mail', ITA = 'E-Mail')
        label(CustomerVendorNo_Caption; ENU = 'Customer No.', ITA = 'Nr. Cliente')
        label(DocumentNo_Caption; ENU = 'No.', ITA = 'Nr.')
        label(FiscalCode_Caption; ENU = 'Fiscal code', ITA = 'Codice Fiscale')
        label(GoodsAppearance_Caption; ENU = 'Goods appearance', ITA = 'Aspetto dei beni')
        label(TransportbyThe_Caption; ENU = 'Transport by the', ITA = 'Trasporto a cura del')
        label(GrossWeight_Caption; ENU = 'Gross weight', ITA = 'Peso')
        label(Line_Amount_Caption; ENU = 'Amount', ITA = 'Importo')
        label(Line_Description_Caption; ENU = 'Description', ITA = 'Descrizione')
        label(Line_ItemNo_Caption; ENU = 'No.', ITA = 'Nr.')
        label(Line_LineDiscountPerc_Caption; ENU = 'Disc. %', ITA = 'Sconto %')
        label(Line_OrderQuantity_Caption; ENU = 'Order Quantity', ITA = 'Quantità Ordine')
        label(Line_Quantity_Caption; ENU = 'Quantity', ITA = 'Quantità')
        label(Line_ShipmentDate_Caption; ENU = 'Shpt. Date', ITA = 'Data di Spedizione')
        label(Line_Type_Descr_Caption; ENU = 'Type', ITA = 'Tipo')
        label(Line_UnitPrice_Caption; ENU = 'Price', ITA = 'Prezzo')
        label(Line_UoM_Caption; ENU = 'U.M.', ITA = 'U.M.')
        label(Line_VATIdentifier_Caption; ENU = 'VAT', ITA = 'Cod.IVA')
        label(NetWeightCaption; ENU = 'Net weight', ITA = 'Peso')
        label(WeightCaption; ENU = 'Weight', ITA = 'Peso')
        label(NoOfParcels_Caption; ENU = 'Parcels', ITA = 'Nr. Colli')
        label(OperatorName_Caption; ENU = 'Contact', ITA = 'Contatto')
        label(OrderConf_Title; ENU = 'Order Confirmation', ITA = 'Conferma Ordine')
        label(OrderDate_Caption; ENU = 'Order Date', ITA = 'Data Ordine')
        label(Our_Bank; ENU = 'Our Bank Account', ITA = 'Banca di canalizzazione')
        label(Page_Caption; ENU = 'Page', ITA = 'Pagina')
        label(Payment_Amount_Caption; ENU = 'Amount', ITA = 'Importo')
        label(Payment_DueDate_Caption; ENU = 'Due Date', ITA = 'Data Scadenza')
        label(PaymentMethod_Caption; ENU = 'Payment method', ITA = 'Metodo di pagamento')
        label(PaymentTerms_Caption; ENU = 'Payment terms', ITA = 'Condizione di pagamento')
        label(PostingDate_Caption; ENU = 'Date', ITA = 'Data')
        label(Reason_Caption; ENU = 'Transport reason', ITA = 'Causale del trasporto')
        label(ReturnAddr_Caption; ENU = 'Return address', ITA = 'Indirizzo mittente')
        label(Salesperson_Caption; ENU = 'Salesperson', ITA = 'Agente')
        label(ShipmentDate_Caption; ENU = 'Shpt. Date', ITA = 'Data di Spedizione')
        label(ShipToAddress_Caption; ENU = 'Shipping address', ITA = 'Luogo di destinazione')
        label(ShpAgent_Caption; ENU = 'Shipping agent', ITA = 'Vettore')
        label(ShptBy_Caption; ENU = 'Shpt. by', ITA = 'Agente')
        label(ShptMethod_Caption; ENU = 'Shipment meth.', ITA = 'Porto')
        label(ShptStart_Caption; ENU = 'Shipment Start', ITA = 'Inizio del trasporto o consegna data e ora')
        label(SigDriver_Caption; ENU = 'Signature - Driver', ITA = 'Firma dell''incaricato  al trasporto o vettore')
        label(SigRecipient_Caption; ENU = 'Signature - Recipient', ITA = 'Firma del destinatario')
        label(SigShpAgent_Caption; ENU = 'Signature - Ship. agent', ITA = 'Firma dell''incaricato  al trasporto o vettore')
        label(Total_DocumentTotalCaption; ENU = 'Document Total', ITA = 'Totale')
        label(Total_DocumentTotalVatExclCaption; ENU = 'Document Total Vat Excl.', ITA = 'Totale documento escl. IVA')
        label(Total_NetAmountToPayCaption; ENU = 'Net Amount To Pay', ITA = 'Importo netto da pagare')
        label(Total_TotalAmountCaption; ENU = 'Total VAT', ITA = 'Totale IVA')
        label(Total_TotalBaseCaption; ENU = 'Total Base', ITA = 'Totale Base')
        label(Total_TotalCaption; ENU = 'Total', ITA = 'Totale')
        label(Total_TotalInvDiscCaption; ENU = 'Invoice Discount', ITA = 'Sc. Fattutra')
        label(ValidTo_Caption; ENU = 'Validity', ITA = 'Validità')
        label(VAT_InvDisc_Caption; ENU = 'Inv. Disc.', ITA = 'Sc. Fatt.')
        label(VAT_Line_VATIdentifier_Caption; ENU = 'VAT Code', ITA = 'Codice IVA')
        label(VAT_VATAmount_Caption; ENU = 'Amount', ITA = 'Importo')
        label(VAT_VATBase_Caption; ENU = 'Base', ITA = 'Base')
        label(VAT_VATPercent_Caption; ENU = 'VAT %', ITA = '% IVA')
        label(VAT_VATText_Caption; ENU = 'Description', ITA = 'Descrizione')
        label(VATClausesCaption; ENU = 'VAT Additional Info:', ITA = 'Info. Aggiuntive IVA')
        label(VATRegNo_Caption; ENU = 'VAT Reg.', ITA = 'Partita IVA') //P.IVA
        label(Volume_Caption; ENU = 'Volume', ITA = 'Volume')
        label(YourReference_Caption; ENU = 'Your reference', ITA = 'Vostro Riferimento')
        label(BankReference_Caption; ENU = 'Your bank references', ITA = 'Vs. riferimenti bancari')
        label(YourBankAccountRef_Caption; ENU = 'Our bank references', ITA = 'Ns. riferimenti bancari')
        label(CustomerBankReference_Caption; ENU = 'Customer Bank', ITA = 'Banca Cliente')
        label(TextLicenseCpt; ENU = 'DECLARATION OF GOODS TRANSPORTED ON OWN ACCOUNT PURSUANT TO ART. 39 L. N. 298/74 AND SUCC. MOD', ITA = 'DICHIARAZIONE MERCI TRASPORTATE IN CONTO PROPRIO AI SENSI DELL''ART. 39 L.N. 298/74 E SUCC. MOD.')//Declarazione
        label(TextLicense2; ENU = 'TRANSPORT NOT EXCEEDING THE EXEMPTION LIMITS REQUIREMENTS TO 1.1.3.6 Tot. Dangerous goods:', ITA = 'TRASPORTO NON SUPERIORE AI LIMITI DI ESENZIONE PRESCRITTI AL 1.1.3.6 Tot. merci pericolose: KG/LT 900,000') //TRASPORTO NON SUPERIORE AI LIMITI DI ESENZIONE PRESCRIZIONI AL 1.1.3.6 Tot. merci pericole:
        //label(TextArt62; ENU = 'IT IS A NON-DETERIORABLE AGRICULTURAL PRODUCT. SINGLE ASSIGNMENT. Art. 62 c.1, DL 1/2012 - L.27 / 2012', ITA = 'TRATTASI DI PRODOTTI AGRICOLI NON DETERIORABILI. UNICA CESSIONE . Art. 62 c.1, DL 1/2012 - L.27/2012')//Declarazione Art 62              
        label(TextArt62; ENU = 'THIS IS A SALE OF NON-PERISHABLE AGRICULTURAL PRODUCTS. DELIVERY PERIOD: CALENDAR MONTH - Legislative Decree 198/2021', ITA = 'TRATTASI DI CESSIONE DI PRODOTTI AGRICOLI NON DEPERIBILI. PERIODO DI CONSEGNA: MESE SOLARE - D.Lgs. 198/2021')//Declarazione Art 62              
        label(SigCompilier_Caption; ENU = 'Compiler Signature', ITA = 'Firma Compilatore')// Firma del compilatore
        label(TaxDiscount_Caption; ENU = 'Tax Discount', ITA = 'Bolli')//Bolli
        label(CarrierGenInfo_Caption; ENU = 'General Information of the carrier', ITA = 'Generalità del vettore')//Generalità del vettore
        label(PhytoLicense_CaptionM; ENU = 'Phytosanitary Certification', ITA = 'Autorizzazione Fitosanitaria') //Abilitazione Fitosanitaria
        label(TransportationBythe_Caption; ENU = 'Transportation by the', ITA = 'Trasporto a cura del')//Trasporto acura del 
        label(CollectionCosts; ENU = 'Collection Costs', ITA = 'SPESE INCASSO') //Totale Incasso
        label(GoodsTotal_Caption; ENU = 'Goods Total', ITA = 'TOTALE MERCE') //Totale  Merce
        label(LoadingPlace_Caption; ENU = 'Goods Loading Place', ITA = 'Luogo di carico della merce') // Luogo di carico della merce
        label(text1; ENU = 'CONTRIBUTION TO FOOD SAFETY PERFORMED WHERE DUE', ITA = 'CONTRIBUTO PER LA SICUREZZA ALIMENTARE ASSOLTO OVE DOVUTO') //CONTRIBUTO PER LA SICUREZZA ALIMENTARE ASSOLTO OVE DOVUTO
        label(text2; ENU = 'CONTRIBUTION TO THE COMPLIANCE PERFORMED WHERE DUE', ITA = 'CONTRIBUTO CONAI ASSOLTO OVE DOVUTO') //CONTRIBUTO CONAI ASSOLTO OVE DOVUTO
        label(text3; ENU = 'POLIECO CONTRIBUTION COMPLETED', ITA = 'CONTRIBUTO POLIECO ASSOLTO') //CONTRIBUTO POLIECO ASSOLTO
        label(PhytoItemRegNo_Caption; ENU = 'N.Reg.', ITA = 'Nr. Reg.')
        label(ABI_Caption; ENU = 'ABI', ITA = 'ABI')
        label(CAB_Caption; ENU = 'CAB', ITA = 'CAB')
        label(Valuta_Caption; ENU = 'Currency', ITA = 'Valuta')
        label(IBAN_Caption; ENU = 'IBAN', ITA = 'IBAN')
        label(FirmaLegRappr_Caption; ENU = 'Legal Representative Signature', ITA = 'Firma Legale Rappresentante')
    }

    trigger OnInitReport()
    var

    begin
        CompanyInfo.get;
        CompanyInfo.CalcFields(Picture);
    end;

    trigger OnPreReport()
    var
        AdvancedReportingMngt: Codeunit "EOS Advanced Reporting Mngt";
        AdvRptDebug: Codeunit "EOS AdvRpt Debug";
        PrintsManagement: Codeunit "UFO03 Prints Managment";
        StopExecution: Boolean;
    begin
        AdvRptDebug.AddEventLog('OnPreReport', 'Start', '');
        DetectCurrentDocument();

        HeaderLoop."EOS No. of Copies" := NoOfCopies;
        HeaderLoop."EOS Log Interaction" := LogInteraction;

        SetupLanguage(DocVariantToPrint);
        AdvancedReportingMngt.PrepareBuffer(DocVariantToPrint, ReportSetupCode, HeaderLoop, LineLoop, CurrReport.ObjectId(false));
        PrintsManagement.SetCustomDocumentReferenceOnLines(LineLoop, CurrReport.ObjectId(false));

        OnBeforePrintingReport(HeaderLoop, LineLoop, NoOfCopies, LogInteraction, PrintVAT, StopExecution);
        if StopExecution then
            CurrReport.Quit();

        ReportSetup.Get(HeaderLoop."EOS Report Setup Code");
        AdvRptDebug.AddEventLog('OnPreReport', 'Stop', '');
    end;

    trigger OnPostReport()
    var
        //ReportDebug: Codeunit "MMA03 Report Debug";
        ReportID: Integer;
        AdvRptDebug: Codeunit "EOS AdvRpt Debug";
    begin
        AdvRptDebug.AddEventLog('OnPostReport', 'Stop', '');

        // >>> KF DEBUG-MODE
        // If Debug then begin
        //     ReportID := ReportDebug.GetNumberFromString(CurrReport.ObjectId(false));
        //     ReportDebug.ExportReportDataset(ReportID, RecRef);
        // end;
        // <<< KF DEBUG-MODE
    end;

    // local procedure SetRecRefForDebugMode(TableID: Integer; DocumentType: Integer; DocumentNo: Code[20])
    // var
    // begin
    //     // >>> KF DEBUG-MODE
    //     case TableID of
    //         5744:
    //             begin
    //                 RecRef.Close();
    //                 RecRef.Open(5744);
    //                 RecRef.Copy(FakeTransferShipmentHeader);
    //             end;
    //     end;
    //     // <<< KF DEBUG-MODE
    // end;

    local procedure SetupLanguage(DocVariant: Variant)
    var
        AdvancedReportingMngt: Codeunit "EOS Advanced Reporting Mngt";
        AdvRptSharedMemory: Codeunit "EOS AdvRpt SharedMemory";
    begin
        if ForcedLanguageID = 0 then
            ForcedLanguageID := AdvRptSharedMemory.GetReportLanguage();

        if ForcedLanguageID <> 0 then
            CurrReport.LANGUAGE := ForcedLanguageID
        else
            CurrReport.LANGUAGE := AdvancedReportingMngt.GetReportLanguageID(DocVariant, CurrReport.ObjectId(false));
    end;

    procedure SetForcedLanguageID(LangID: Integer)
    begin
        ForcedLanguageID := LangID;
    end;

    local procedure UpdateLocalCopies()
    begin
        NoofCopiesEditable := true;
        if ReportSetupCode = '' then
            exit;
        ReportSetup.Get(ReportSetupCode);
        if ReportSetup."EOS No. of Copies Source" = ReportSetup."EOS No. of Copies Source"::" " then
            NoOfCopies := ReportSetup."EOS No. of Copies"
        else begin
            NoOfCopies := 0;
            NoofCopiesEditable := false;
        end;
    end;

    local procedure DetectCurrentDocument()
    var
        AdvRptDefaultSetup: Record "EOS AdvRpt Default Setup";
        AdvancedReportingMngt: Codeunit "EOS Advanced Reporting Mngt";
        AdvRptDefSetup: Codeunit "EOS AdvRpt Def Setup";
        AdvRptRoutines: Codeunit "EOS AdvRpt Routines";
        AdvRptSharedMemory: Codeunit "EOS AdvRpt SharedMemory";
        Found: Boolean;
        ReportID: Integer;
    begin
        if Format(DocVariantToPrint) <> '' then
            exit;

        if not AdvRptSharedMemory.GetCustomReportDocument(DocVariantToPrint) then begin
            Found := false;
            AdvRptRoutines.GetDocumentToPrint(FakeSalesHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeSalesShipmentHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeReturnReceiptHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeSalesInvoiceHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeSalesCrMemoHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeSalesHeaderArchive, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeServiceHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeServiceShipmentHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeServiceInvoiceHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeServiceCrMemoHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakePurchaseHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakePurchRcptHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeReturnShipmentHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakePurchInvHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakePurchCrMemoHdr, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakePurchaseHeaderArchive, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeTransferHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeTransferReceiptHeader, DocVariantToPrint, Found);
            AdvRptRoutines.GetDocumentToPrint(FakeTransferShipmentHeader, DocVariantToPrint, Found);
            if not Found then
                Error(UnknowDocumentToPrintErr, CurrReport.ObjectId(false), CurrReport.ObjectId(true));
        end;

        if ReportSetupCode = '' then begin
            if AdvancedReportingMngt.TryDecodeReportName(CurrReport.ObjectId(false), ReportID) then;
            AdvRptDefSetup.GetDefaultDocumentSetup(DocVariantToPrint, ReportID, true, AdvRptDefaultSetup);
            ReportSetupCode := AdvRptDefaultSetup."EOS Default Report Setup";
            UpdateLocalCopies();
        end;
    end;

    procedure GetPrintValues(var ReportRBHeader: Record "EOS Report Buffer Header" temporary;
                                   var ReportRBLine: Record "EOS Report Buffer Line" temporary;
                                   var ReportReportSetupCode: Code[10];
                                   var ReportNoOfCopies: Integer;
                                   var ReportLogInteraction: Boolean;
                                   var ReportPrintVAT: Boolean)
    var
        AdvancedReportingMngt: Codeunit "EOS Advanced Reporting Mngt";
    begin
        HeaderLoop.Reset();
        if HeaderLoop.IsEmpty() then begin
            DetectCurrentDocument();

            HeaderLoop."EOS No. of Copies" := NoOfCopies;
            HeaderLoop."EOS Log Interaction" := LogInteraction;

            SetupLanguage(DocVariantToPrint);
            AdvancedReportingMngt.PrepareBuffer(DocVariantToPrint, ReportSetupCode, HeaderLoop, LineLoop, CurrReport.ObjectId(false));
        end;

        ReportRBHeader.Copy(HeaderLoop, true);
        ReportRBLine.Copy(LineLoop, true);
        ReportReportSetupCode := ReportSetupCode;
        ReportNoOfCopies := NoOfCopies;
        ReportLogInteraction := LogInteraction;
        ReportPrintVAT := ReportPrintVAT;
    end;

    /// <summary>This event is reaised after building Header and line buffer but before sending data to Report Viewer</summary>
    /// <param name="RBHeader">Document header</param>
    /// <param name="RBLine">Document Lines</param>
    /// <param name="NoOfCopies">Current No. of Copies</param>
    /// <param name="LogInteraction">Log interaction flag</param>
    /// <param name="PrintVAT">Print VAT Flag</param>
    /// <param name="StopExecution">Returning true will be executed CurrReport.Quit method</param>
    [IntegrationEvent(false, false)]
    local procedure OnBeforePrintingReport(var RBHeader: Record "EOS Report Buffer Header" temporary;
                                           var RBLine: Record "EOS Report Buffer Line" temporary;
                                           var NoOfCopies: Integer;
                                           var LogInteraction: Boolean;
                                           var PrintVAT: Boolean;
                                           var StopExecution: Boolean)
    begin
    end;

    //Start  24.12.2020 Gestione Testi trasporto proprio /IAD    funzioni per controllare se ci sono degli articoli che necessitano Patentino o con art62 attivo
    local procedure CheckLicenseReqItem(var DocumentNo: code[20]; SourceTableID: Integer): Boolean;
    var
        Print: Boolean;
        Item: Record Item;
        //JobShipLine: Record "MMA07 Job Shipment Line";
        SalesShipLine: Record "Sales Shipment Line";
        SalesHeader: Record "Sales Header";
    begin
        //Start mpd+ 06.01.21
        CustomerPesticideLicense := '';
        //Stop mpd+ 06.01.21

        CASE SourceTableID OF
            110:
                begin
                    // SalesShipLine.SetRange("Document No.", DocumentNo);
                    // SalesShipLine.SetRange(Type, SalesShipLine.type::Item);

                    // if SalesShipLine.FindSet() then
                    //     repeat
                    //         if Item.Get(SalesShipLine."No.") AND Item."License Requested" then begin
                    //             Print := true;
                    //             //Start mpd+ 06.01.21
                    //             if HeaderLoop."MMA03 Customer Pest Lic" <> '' then
                    //                 CustomerPesticideLicense := HeaderLoop."MMA03 Customer Pest Lic"
                    //             else begin
                    //                 // if SalesHeader.get(SalesHeader."Document Type"::Order, SalesShipLine."Order No.") then
                    //                 //     CustomerPesticideLicense := SalesHeader."Customer Pest Lic";
                    //             end;
                    //             //Stop mpd+ 06.01.21 
                    //             exit(Print);
                    //         end;
                    //     until SalesShipLine.Next() = 0;
                    Print := false;
                    exit(Print);
                end;
            50004:
                begin
                    // JobShipLine.SetRange("MMA07 Document No.", DocumentNo);
                    // JobShipLine.SetRange("MMA07 Type", JobShipLine."MMA07 Type"::Item);

                    // if JobShipLine.FindSet() then
                    //     repeat
                    //         if Item.Get(JobShipLine."MMA07 No.") // AND Item."License Requested" 
                    //         then begin
                    //             Print := true;
                    //             exit(Print);
                    //         end;
                    //     until JobShipLine.Next() = 0;
                    // Print := false;
                    // exit(Print);
                end;
        END;
    end;

    local procedure CheckArt62Item(var DocumentNo: code[20]; SourceTableID: Integer): Boolean
    var
        Item: Record Item;
        //JobShipLine: Record "MMA07 Job Shipment Line";
        SalesShipLine: Record "Sales Shipment Line";
        Print: Boolean;
    begin
        CASE SourceTableID OF
            110:
                begin
                    // SalesShipLine.SetRange("Document No.", DocumentNo);
                    // SalesShipLine.SetRange(Type, SalesShipLine.type::Item);

                    // if SalesShipLine.FindSet() then
                    //     repeat
                    //         if Item.Get(SalesShipLine."No.") AND Item."MMA04 Art. 62" then begin
                    //             Print := true;
                    //             exit(Print);
                    //         end;
                    //     until SalesShipLine.Next() = 0;
                    // Print := false;
                    // exit(Print);
                end;

        end;
    end;

    local procedure CheckShippingAgentComments(): Boolean //29.12.20 MPd+
    var
        CommentLine: record "Comment Line";
        SalesShipHeader: record "Sales Shipment Header";
    begin
        CommentLine.Reset();
        //CommentLine.SetRange("Table Name", CommentLine."Table Name"::"Shipping Agent");
        CommentLine.SetRange("No.", HeaderLoop."EOS Shipping Agent Code");
        if not CommentLine.IsEmpty then
            exit(true);
    end;
    //Stop  24.12.2020 Gestione Testi trasporto proprio /IAD  

    //Start mpd+ 29.12.20
    procedure MMA_LocationAddr(): Text
    var
        FormatAddr: Codeunit "Format Address";
        AddrArray: array[8] of Text[100];
        ExitText: text;
        Location: record location;
    begin
        if not location.get(HeaderLoop."EOS Location Code") then
            exit('');

        // FormatAddr.FormatAddr(AddrArray, FORMAT(location.Code), FORMAT(location.Name), FORMAT(location."Name 2"), FORMAT(location.Address),
        //    FORMAT(location."Address 2"), FORMAT(location.City), FORMAT(location."Post Code"), FORMAT(location.County),
        //    FORMAT(location."Country/Region Code"));

        // EXIT(MMA_GetAddressString(AddrArray));
        ExitText := FORMAT(location.Code) + ', ' + FORMAT(location.Name) + ', ' + FORMAT(location.Address) + ', ' + FORMAT(location.City) + ', ' + FORMAT(location."Post Code")
        + ', ' + FORMAT(location.County) + ', ' + FORMAT(location."Country/Region Code");

        exit
    end;
    //Stop mpd+ 29.12.20

    //Start 22.03.21 Fix County /iad 
    local procedure GetShipToAddr2(): Text
    var
        FormatAddr: Codeunit "Format Address";
        AddrArray: array[8] of text[50];
        Postcode: Record "Post Code";
        ShipToCounty: Text[30];
    begin
        PostCode.reset;
        PostCode.SetRange(Code, HeaderLoop."EOS Ship-to Post Code");
        PostCode.SetRange(city, HeaderLoop."EOS Ship-to City");
        if PostCode.FindFirst() then
            ShipToCounty := Postcode."County";

        FormatAddr.FormatAddr(
          AddrArray, HeaderLoop."EOS Ship-to Name", HeaderLoop."EOS Ship-to Name 2", HeaderLoop."EOS Ship-to Contact", HeaderLoop."EOS Ship-to Address",
           HeaderLoop."EOS Ship-to Address 2", HeaderLoop."EOS Ship-to City", HeaderLoop."EOS Ship-to Post Code", ShipToCounty,
           HeaderLoop."EOS Ship-to Country");

        EXIT(GetAddressString(AddrArray));
    end;

    local procedure GetBillToPayToAddr2(): Text
    var
        FormatAddr: Codeunit "Format Address";
        AddrArray: array[8] of text[50];
        Postcode: Record "Post Code";
        TransferShipmentHeader: Record "Transfer Shipment Header";
        BillToCounty: Text[30];
    begin
        //Start npa 21.05.2021
        if HideAddressCaption then begin
            TransferShipmentHeader.Get(HeaderLoop."EOS No.");
            PostCode.reset;
            PostCode.SetRange(Code, TransferShipmentHeader."Transfer-from Post Code");
            PostCode.SetRange(city, TransferShipmentHeader."Transfer-from City");
            if PostCode.FindFirst() then
                BillToCounty := Postcode."County";

            FormatAddr.FormatAddr(
              AddrArray, TransferShipmentHeader."Transfer-from Name", TransferShipmentHeader."Transfer-from Name 2", '', TransferShipmentHeader."Transfer-from Address",
              TransferShipmentHeader."Transfer-from Address 2", TransferShipmentHeader."Transfer-from City", TransferShipmentHeader."Transfer-from Post Code", BillToCounty,
              TransferShipmentHeader."Trsf.-from Country/Region Code");

            EXIT(GetAddressString(AddrArray));
        end;
        //Stop npa 21.05.2021

        PostCode.reset;
        PostCode.SetRange(Code, HeaderLoop."EOS Bill-to/Pay-to Post Code");
        PostCode.SetRange(city, HeaderLoop."EOS Bill-to/Pay-to City");
        if PostCode.FindFirst() then
            BillToCounty := Postcode."County";

        FormatAddr.FormatAddr(
          AddrArray, HeaderLoop."EOS Bill-to/Pay-to Name", HeaderLoop."EOS Bill-to/Pay-to Name 2", '', HeaderLoop."EOS Bill-to/Pay-to Address",
          HeaderLoop."EOS Bill-to/Pay-to Address 2", HeaderLoop."EOS Bill-to/Pay-to City", HeaderLoop."EOS Bill-to/Pay-to Post Code", BillToCounty,
         HeaderLoop."EOS Bill-to/Pay-to Country");

        EXIT(GetAddressString(AddrArray));

    end;

    local procedure GetAddressString(VAR AddrArray: ARRAY[8] OF Text[50]): Text
    var
        i: Integer;
        ResText: text;
        eoslib: Codeunit "EOS Library EXT";
    begin
        FOR i := 1 TO ARRAYLEN(AddrArray) DO
            IF AddrArray[i] <> '' THEN
                IF ResText = '' THEN
                    ResText := AddrArray[i]
                ELSE
                    ResText := ResText + EosLib.NewLine + AddrArray[i];
        EXIT(ResText);
    end;

    //Stop 22.03.21 Fix County /iad

    local procedure GetBillToFormattedAddress(): Text
    var
        PrintsManagement: Codeunit "UFO03 Prints Managment";
        //PostCode: record "Post Code";
        TransferShipHeader: Record "Transfer Shipment Header";
    begin
        // PostCode.Reset();
        // if PostCode.Get(HeaderLoop."EOS Bill-to/Pay-to Post Code", HeaderLoop."EOS Bill-to/Pay-to City") then;

        TransferShipHeader.Reset();
        if TransferShipHeader.Get(HeaderLoop."EOS No.") then;

        exit(PrintsManagement.GetAddressInfo(TransferShipHeader."Transfer-to Name", TransferShipHeader."Transfer-to Name 2", TransferShipHeader."Transfer-to Address", TransferShipHeader."Transfer-to Address 2", '', TransferShipHeader."Transfer-to Post Code", TransferShipHeader."Transfer-to City", TransferShipHeader."Transfer-to County", '', ''));
    end;

    local procedure GetShipToFormattedAddress(): Text
    var
        PrintsManagement: Codeunit "UFO03 Prints Managment";
        PostCode: Record "Post Code";
        TransferShipHeader: Record "Transfer Shipment Header";
    begin
        PostCode.Reset();
        if PostCode.Get(HeaderLoop."EOS Ship-to Post Code", HeaderLoop."EOS Ship-to City") then;

        TransferShipHeader.Reset();
        if TransferShipHeader.Get(HeaderLoop."EOS No.") then;

        exit(PrintsManagement.GetAddressInfo(TransferShipHeader."Transfer-from Name", TransferShipHeader."Transfer-from Name 2", TransferShipHeader."Transfer-from Address", TransferShipHeader."Transfer-from Address 2", '', TransferShipHeader."Transfer-from Post Code", TransferShipHeader."Transfer-from City", TransferShipHeader."Transfer-from County", '', ''));
    end;

    var
        OurBankRef: Text[50]; //mpd+ 010221
        OurBankRef1: Text[50]; //iad+ 020321
        BuyFromContact: Record Contact;
        Employee: Record Employee;
        TempBlob: Codeunit "Temp Blob";
        //FooterImage: Record TempBlob temporary;
        //HeaderImage: Record TempBlob temporary;
        ReportSetup: Record "EOS Report Setup";
        Salesperson: Record "Salesperson/Purchaser";
        SellToContact: Record Contact;
        //CustomSetup: record "MMA04 Custom Setup"; //iad+ 220421
        ImagesSent: Boolean;
        LogInteraction: Boolean;
        //[InDataSet]
        NoofCopiesEditable: Boolean;
        PrintVAT: Boolean;
        ReportSetupCode: Code[10];
        VAT_ClauseCode: array[10] of Code[10];
        VAT_Identifier: array[10] of Code[20];
        PaymentLine_DueDate: array[10] of Date;
        PaymentLine_Amount: array[10] of Decimal;
        VATLineAmountInclVATTotal: Decimal;
        VATLineAmountTotal: Decimal;
        VATLineBaseTotal: Decimal;
        VATLineInvDiscTotal: Decimal;
        VATLineTotal: Decimal;
        VAT_Amount: array[10] of Decimal;
        VAT_Base: array[10] of Decimal;
        VAT_InvoiceDiscountAmount: array[10] of Decimal;
        VAT_Perc: array[10] of Decimal;
        ForcedLanguageID: Integer;
        NoOfCopies: Integer;
        VAT_ClauseDescription: array[10] of Text;
        VAT_Description: array[10] of Text;
        PrintText1: Boolean;
        ShowTxt: Boolean;
        ShowLicenseReqText: Boolean;
        ShowArt62Text: Boolean;
        ItemVariantDesc: text[100];
        Line_Description: text[100];
        DocVariantToPrint: Variant;
        UnknowDocumentToPrintErr: TextConst ENU = 'Report %1 (%2): unable to recognize document to print', ITA = 'Report %1 (%2): impossibile stampare il documento';
        LicenseTxt1Title: Label '';
        LicenseTxt1: Label '';
        LicenseTxt2: Label '';
        Art62Txt: Label '';
        ShippingCommentsText: text; //mpd+ 29.12.20
        Comments: array[10] of Text[100];
        showvariant: boolean;
        TextLicense: text;
        TextLicenseLbl: TextConst ENU = 'DECLARATION OF GOODS TRANSPORTED ON OWN ACCOUNT PURSUANT TO ART. 39 L. N. 298/74 AND SUCC. MOD', ITA = 'DICHIARAZIONE MERCI TRASPORTATE IN CONTO PROPRIO AI SENSI DELL''ART. 39 L.N. 298/74 E SUCC. MOD.';//Declarazione
        CustomerPesticideLicense: Code[20];
        PhytoItemRegNo: code[30];
        CigCode_Value: Code[15];
        CupCode_Value: Code[15];
        HideAddressCaption: Boolean;
        ABICode: Code[5];
        CABCode: Code[5];
        IBANCode: Code[50];
        BankName: Text[100];
        IsCustomerBank: Boolean;
        PrintsManagement: Codeunit "UFO03 Prints Managment";
        LastOrderNo: Code[20];
        Debug: Boolean;
        // RecRef: RecordRef; // recref del debug
        // ReportDebug: Codeunit "MMA03 Report Debug";
        VATIdentifier: Code[20];
        ShipmentMethod: Record "Shipment Method";
        ShipmentMethodDesc: Text;
        ShowTextLicense: Boolean;
        CompanyInfo: Record "Company Information";
}


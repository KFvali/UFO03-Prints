report 50005 "UFO03 Purchase Request"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'UFO03 Purchase Request.rdlc';
    CaptionML = ENU = 'Purchase Request', ITA = 'Richiesta d''offerta';
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
                //Start iad
                //column(ReportTitle; HeaderLoop."EOS Report Title") { }
                column(ReportTitle; VarReportTitle) { }
                column(VarFooter; VarFooter) { }
                column(ExpctRecpDt_PurchHdr; format(ExpctRecpDt_PurchHdr)) { }
                column(ShippingAgentCode; ShippingAgentCode) { }//Agent code
                column(ExpDate; Format(ExpDate)) { }  // data consegna richiesta
                column(VendorOrderNo; VendorOrderNo) { }
                column(ABI; StrSubstNo(ABILbl, VendorABI)) { }
                column(CAB; StrSubstNo(CABLbl, VendorCAB)) { }
                column(CIG; StrSubstNo(CIG_Caption, CIG)) { }
                column(CUP; StrSubstNo(CUP_Caption, CUP)) { }

                //column(ABILbl; ABILbl) { }
                //column(CABLbl; CABLbl) { }
                column(WrittenBy; WrittenBy) { }
                column(ApprovedBy; ApprovedBy) { }
                column(BankAccount; BankAccount) { }
                column(BuyerCaption; BuyerCaption) { }
                column(VendorCaption; VendorCaption) { }
                column(Notes; Notes) { }
                column(Txt1; Txt1) { }
                column(Txt2; Txt2) { }
                column(PageLbl; PageLbl) { }
                column(FooterTxt; FooterTxt) { }
                column(FooterOrderTxt; FooterOrderTxt) { }
                column(PurchaseFooterLbl; PurchaseFooterLbl) { }
                column(PurchaseOrderCaption; PurchaseOrderCaption) { }
                column(PurchaseQuoteCaption; PurchaseQuoteCaption) { }
                column(PurchaseQuoteFooter; StrSubstNo(PurchaseQuoteCaption, HeaderLoop."EOS No.")) { }
                column(PurchaseOrderFooter; StrSubstNo(PurchaseOrderCaption, HeaderLoop."EOS No.")) { }

                //Stop iad
                column(CopyNo; Number) { }
                column(DocumentNo; HeaderLoop."EOS No.") { }
                //column(PostingDate; HeaderLoop."EOS Posting Date") { }
                column(PostingDate; OrderDate) { }
                column(Salesperson; Salesperson.Name) { }
                column(SalesPersonMail; Salesperson."E-Mail") { }
                column(SalesPersonPhoneNo; Salesperson."Phone No.") { }
                column(TextMail; TextMail) { }
                column(TextPhone; TextPhone) { }
                column(OperatorName; Employee.FullName()) { }
                column(SelltoBuyFromNo; HeaderLoop."EOS Sell-to/Buy-From No.") { }
                column(SellToBuyFromAddr; HeaderLoop.GetSellToBuyFromAddr()) { }
                column(BillToNo; HeaderLoop."EOS Bill-to/Pay-to No.") { }
                //Start  22.03.21 fix county /iad
                //ORG column(BillToAddress; HeaderLoop.GetBillToPayToAddr()) { }

                //ORG  column(ShipToAddress; HeaderLoop.GetShipToAddr()) { }
                column(ShipToAddress; GetShipToFormattedAddress()) { }
                column(BillToAddress; GetBillToFormattedAddress()) { }
                column(CustomerVendorContact; BuyFromContact.Name) { }
                column(CustomerVendorEMail; BuyFromContact."E-Mail") { }
                column(CustomerVendorPhoneNo; BuyfromContact."Phone No.") { }
                column(PaymentTerms; HeaderLoop.PaymentTerms_GetDescInLanguage()) { }
                column(PaymentMethod; HeaderLoop.PaymentMethod_GetDescInLanguage()) { }
                column(Reason; HeaderLoop.ReasonCode_GetDescInLanguage()) { }
                column(VATRegNo; HeaderLoop."EOS VAT Registration No.") { }
                column(FiscalCode; HeaderLoop."EOS Fiscal Code") { }
                column(ShptMethod; HeaderLoop.ShptMethod_GetDescInLanguage()) { }
                column(ShptBy; Format(HeaderLoop."EOS Shipment by")) { }
                //column(ShpAgent; HeaderLoop.GetShippingAgentText() { }
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
                column(OrderDate; Format(OrderDate, 0, '<Day,2>/<Month,2>/<Year,2>')) { }
                column(ShipmentDate; HeaderLoop."EOS Shipment Date") { }
                column(ValidTo; HeaderLoop."EOS Valid to") { }
                column(VATExclDeclaration; HeaderLoop."EOS Footer Line") { }
                column(VATLineAmountToPay; HeaderLoop."EOS Amount Including VAT") { }
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
                column(ReportTitleNew; ReportTitleNew) { }
                column(ABICode; ABICode) { }
                column(CABCode; CABCode) { }
                column(IBANCode; IBANCode) { }
                column(BankName; BankName) { }
                column(QuoteNo; QuoteNo) { }
                column(RedattoDa; WrittenBy) { }
                column(PaymentMethodCode; HeaderLoop."EOS Payment Method Code") { }
                column(NascondiPrezzi; NascondiPrezzi) { }

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
                    column(Line_ItemNo; LineLoop."EOS No.") { }
                    column(Line_Description; LineLoop."EOS Description") { }
                    //Start iad 15.01.2021
                    column(showvariant; showvariant) { }
                    column(Line_ItemVariantNo; LineLoop."EOS Variant Code") { }
                    column(Line_ItemVariantDesc; ItemVariantDesc) { }
                    //Stop iad 15.01.2021
                    column(Line_Description2; LineLoop."EOS Description 2") { }
                    column(Line_Quantity; LineLoop."EOS Quantity") { }
                    column(Line_UoMCode; CopyStr(LineLoop.GetUdMTraduction(HeaderLoop), 1, 4)) { }
                    //column(Line_LineDiscountPerc; LineLoop."EOS Discount Text") { }
                    column(Line_LineDiscountPerc; PercSconto) { }
                    column(Line_UnitPrice; LineLoop."EOS Unit Price") { DecimalPlaces = 5; }
                    column(Line_Amount; LineLoop."EOS Amount" + LineLoop."EOS Inv. Discount Amount") { }
                    column(Line_VATIdentifier; LineLoop."EOS VAT Identifier") { }
                    column(Line_ShipmentDate; Format(LineLoop."EOS Shipment Date")) { }
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
                        ItemVariant: Record "Item Variant";
                    begin
                        if ImagesSent then begin
                            Clear(HeaderLoop."EOS Header Image");
                            Clear(HeaderLoop."EOS Footer Image");
                        end else
                            ImagesSent := true;

                        //Start iad 15.01.2021
                        ItemVariant.reset;
                        showvariant := false;
                        if itemVariant.get(LineLoop."EOS No.", LineLoop."EOS Variant Code")
                        and (LineLoop."EOS Quantity" <> 0)
                        then begin
                            showvariant := true;
                            if itemvariant.Description <> '' then
                                ItemVariantDesc := itemvariant.Description
                        end;
                        //Start iad 15.01.2021

                        If "EOS Discount Text" = '0' then
                            PercSconto := ''
                        else
                            PercSconto := "EOS Discount Text";
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
                VendorBankAccount: Record "Vendor Bank Account";
                PurchaseHeader: Record "Purchase Header";
                FormatAddr: Codeunit "Format Address";
                AddrArray1: array[8] of Text;
                AddrArray2: array[8] of Text;
                VendorAddr: array[8] of Text;
                ShipToAddr: array[8] of Text;
                //sb: Codeunit "NP StringBuilder";
                i: Integer;
                J: Integer;
                User: Record User;
                User2: Record User;
                SetupUtente: Record "User Setup";

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

                //Start iad
                if HeaderLoop."EOS Source Table ID" = 38 then begin
                    CASE HeaderLoop."EOS Source Subtype" OF
                        0:
                            VarReportTitle := PurchaseQuoteCaption;
                        1:
                            VarReportTitle := PurchaseOrderCaption;
                        ELSE
                            VarReportTitle := HeaderLoop."EOS Report Title";
                    END;
                end;
                PurchaseHeader.SetRange("No.", HeaderLoop."EOS Source ID");
                if PurchaseHeader.findset then begin
                    OrderDate := PurchaseHeader."Order Date";
                    ExpctRecpDt_PurchHdr := PurchaseHeader."Expected Receipt Date";
                    // WrittenBy := PurchaseHeader."Assigned User ID";
                    // ApprovedBy := PurchaseHeader."MMA04 Approved By";
                    BankAccount := PurchaseHeader."Bank Account";//Banca d'appoggio
                    VendorOrderNo := PurchaseHeader."Vendor Order No.";//Vendor Order No
                    ExpDate := PurchaseHeader."Expected Receipt Date";
                    //ShippingAgentCode := PurchaseHeader."MMA04 Shipping Agent Code NP";
                    CIG := PurchaseHeader."EOS Fattura Tender Code";
                    CUP := PurchaseHeader."EOS Fattura Project Code";

                    User.Reset();
                    User2.Reset();

                    ApprovedBy := '';
                    WrittenBy := '';

                    // ---> ricapire come fare per questi campi
                    // if PurchaseHeader."MMA04 Approved By" <> '' then begin
                    //     User.SetCurrentKey("User Name");
                    //     User.SetFilter("User Name", PurchaseHeader."MMA04 Approved By");
                    //     if User.FindSet() then
                    //         ApprovedBy := User."Full Name"
                    //     else
                    //         Clear(ApprovedBy);
                    // end;

                    // if PurchaseHeader."Assigned User ID" <> '' then begin
                    //     if SetupUtente.Get(PurchaseHeader."Assigned User ID") then
                    //         WrittenBy := SetupUtente."MMA04 Shorted Name"
                    //     else
                    //         Clear(WrittenBy);
                    // end;

                    if HeaderLoop."EOS Order Date" = 0D then
                        OrderDate := PurchaseHeader."Order Date"
                    else
                        OrderDate := HeaderLoop."EOS Order Date";
                    VendorBankAccount.reset();
                    VendorBankAccount.SetRange("Vendor No.", PurchaseHeader."Buy-from Vendor No.");
                    VendorBankAccount.SetRange(Code, PurchaseHeader."Bank Account");
                    if VendorBankAccount.findset then begin
                        VendorABI := VendorBankAccount.ABI;
                        VendorCAB := VendorBankAccount.CAB;
                    end;

                end;

                PurchaseHeader.Reset();
                if PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, HeaderLoop."EOS No.") then
                    IsCustomerBank := PrintsManagement.GetBankInformation(HeaderLoop."EOS Bill-to/Pay-to No.", HeaderLoop."EOS Payment Method Code", PurchaseHeader."EOS Our Bank Account", ABICode, CABCode, IBANCode, BankName);

                if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Quote then begin
                    ReportTitleNew := ReportTitleOff;
                    TipoDocumento := 'Offerta'
                end;
                // --> scommentare su ordine
                // if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then begin
                //     ReportTitleNew := ReportTitleOrd;
                //     TipoDocumento := 'Ordine'
                // end;

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
                        CaptionML = ENU = 'Log Interaction', ITA = 'Log Interazioni';
                        ApplicationArea = All;
                    }
                    field(Debug; Debug)
                    {
                        CaptionML = ENU = 'Debug', ITA = 'Debug';
                        ApplicationArea = All;
                        ToolTip = 'Download Dataset';
                    }
                    field(HidePrices; NascondiPrezzi)
                    {
                        CaptionML = ENU = 'Hide prices', ITA = 'Nascondi prezzi';
                        ApplicationArea = All;
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

        //label(BillToAddress_Caption; ENU = 'Billing address', ITA = 'Indirizzo di Fatturazione')
        label(BillToAddress_Caption; ENU = 'Billing address', ITA = 'Luogo di destinazione')
        label(CustomerVendorContact_Caption; ENU = 'Dear', ITA = 'Spet.le')
        label(CustomerVendorMail_Caption; ENU = 'E-Mail', ITA = 'Mail')
        label(CustomerVendorPhoneCaption; ENU = 'E-Mail', ITA = 'Mail')
        label(CustomerVendorNo_Caption; ENU = 'Vendor No.', ITA = 'Nr. Fornitore')
        label(DocumentNo_Caption; ENU = 'No.', ITA = 'Numero')
        label(FiscalCode_Caption; ENU = 'Fiscal code', ITA = 'Codice fiscale')
        label(GoodsAppearance_Caption; ENU = 'Goods appearance', ITA = 'Aspetto Esteriore della merce')
        label(GrossWeight_Caption; ENU = 'Gross weight')
        label(Line_Amount_Caption; ENU = 'Amount', ITA = 'Importo')
        label(Line_Description_Caption; ENU = 'Description', ITA = 'Descrizione')
        label(Line_ItemNo_Caption; ENU = 'No.', ITA = 'Nr.')
        label(Line_LineDiscountPerc_Caption; ENU = 'Disc. %', ITA = 'Sconto %')
        label(Line_OrderQuantity_Caption; ENU = 'Order Quantity', ITA = 'Quantità Ordine')
        label(Line_Quantity_Caption; ENU = 'Quantity', ITA = 'Q.tà')
        label(Line_ShipmentDate_Caption; ENU = 'Shpt. Date', ITA = 'Data Spedizione')
        label(Line_Type_Descr_Caption; ENU = 'Type', ITA = 'Tipo')
        //label(Line_UnitPrice_Caption; ENU = 'Price', ITA = 'Prezzo Unitario')
        label(Line_UnitPrice_Caption; ENU = 'Price', ITA = 'Prezzo')
        label(Line_UoM_Caption; ENU = 'U.M.', ITA = 'U.M.')
        label(Line_VATIdentifier_Caption; ENU = 'VAT', ITA = 'Cod. IVA')
        label(NetWeightCaption; ENU = 'Net weight', ITA = 'Peso Netto')
        label(NoOfParcels_Caption; ENU = 'No. of Parcels', ITA = 'Nr. Colli')
        label(OperatorName_Caption; ENU = 'Contact', ITA = 'Contatto')
        label(OrderConf_Title; ENU = 'Order Confirmation', ITA = 'Conferma Ordine')
        label(OrderDate_Caption; ENU = 'Order Date', ITA = 'DATA')
        label(Our_Bank; ENU = 'Our Bank Account')
        label(Page_Caption; ENU = 'Page', ITA = 'Pag.')
        label(Payment_Amount_Caption; ENU = 'Amount', ITA = 'Importo')
        label(Payment_DueDate_Caption; ENU = 'Due Date', ITA = 'Data')
        label(PaymentMethod_Caption; ENU = 'Payment method', ITA = 'Metodo pagamento')
        label(PaymentTerms_Caption; ENU = 'Payment terms', ITA = 'Condizione pagamento')
        label(PostingDate_Caption; ENU = 'Date', ITA = 'Data')
        label(Reason_Caption; ENU = 'Transport reason', ITA = 'Causale del trasporto')
        label(ReturnAddr_Caption; ENU = 'Return address')
        label(Salesperson_Caption; ENU = 'Purchaser')
        label(ShipmentDate_Caption; ENU = 'Shpt. Date', ITA = 'Data Spedizione')
        //label(ShipToAddress_Caption; ENU = 'Shipping address', ITA = 'Indirizzo di consegna')
        label(ShipToAddress_Caption; ENU = 'Shipping address', ITA = 'Spett.le')
        label(ShpAgent_Caption; ENU = 'Shipping agent', ITA = 'Vettore')
        label(ShptBy_Caption; ENU = 'Shpt. by', ITA = 'Trasporto a cura')
        label(ShptMethod_Caption; ENU = 'Shipment meth.', ITA = 'Metodo di spedizione')
        label(ShptStart_Caption; ENU = 'Shipment Start', ITA = 'Inizio Spedizione')
        label(SigDriver_Caption; ENU = 'Signature - Driver')
        label(SigRecipient_Caption; ENU = 'Signature - Recipient')
        label(SigShpAgent_Caption; ENU = 'Signature - Ship. agent')
        label(Total_DocumentTotalVatExclCaption; ENU = 'Document Total Vat Excl.')
        label(Total_NetAmountToPayCaption; ENU = 'Net Amount To Pay')
        //label(Total_TotalAmountCaption; ENU = 'Total VAT', ITA = 'Totale Imposta')
        label(Total_TotalAmountCaption; ENU = 'Total VAT', ITA = 'Totale IVA')
        label(Total_TotalBaseCaption; ENU = 'Total Base', ITA = 'Totale Imponibile')
        label(Total_TotalCaption; ENU = 'Total', ITA = 'Totale Importo')
        //label(Total_DocumentTotalCaption; ENU = 'Order Total', ITA = 'Totale Ordine')
        label(Total_DocumentTotalCaption; ENU = 'Order Total', ITA = 'Totale Documento')
        label(ExpectedDate_Caption; ENU = 'Expected date', ITA = 'CONSEGNA RICHIESTA')
        label(WrittenBy_Caption; ENU = 'Written by', ITA = 'REDATTO DA')
        label(ApprovedBy_Caption; ENU = 'Approved by', ITA = 'Approvato da')
        label(YourOffer_Caption; ENU = 'Your Offer', ITA = 'Vs. Offerta')
        label(Bank_Caption; ENU = 'Bank', ITA = 'Banca d''appoggio')
        label(Transportby_Caption; ENU = 'Transported  by', ITA = 'Trasportato da')
        //label(Total_TotalInvDiscCaption; ENU = 'Invoice Discount', ITA = 'Sconto Fattura')
        label(Total_TotalInvDiscCaption; ENU = 'Invoice Discount', ITA = 'Totale Extra Sc')
        label(ValidTo_Caption; ENU = 'Validity', ITA = 'Validità')
        label(VAT_InvDisc_Caption; ENU = 'Inv. Disc.', ITA = 'Sc. Fattura')
        label(VAT_Line_VATIdentifier_Caption; ENU = 'VAT Code', ITA = 'Codice IVA')
        label(VAT_VATAmount_Caption; ENU = 'Amount', ITA = 'Importo')
        label(VAT_VATBase_Caption; ENU = 'Base', ITA = 'Base')
        label(VAT_VATPercent_Caption; ENU = 'VAT %', ITA = '%IVA')
        label(VAT_VATText_Caption; ENU = 'Description', ITA = 'Descrizione')
        label(VATClausesCaption; ENU = 'VAT Additional Info:', ITA = 'VAT Info. Aggiuntive')
        label(VATRegNo_Caption; ENU = 'VAT Reg.', ITA = 'P.IVA')
        label(Volume_Caption; ENU = 'Volume', ITA = 'Volume')
        label(YourReference_Caption; ENU = 'Your reference', ITA = 'Vs. Riferimento')
        label(Note_caption; ENU = 'NOTES:', ITA = 'NOTE:')
        label(Note2_caption; ENU = 'Book delivery at +39 0547 88260 or by email at ', ITA = 'Prenotare la consegna al numero +39 0547 88260 oppure via mail all''indirizzo')
        //label(Note3_caption; ENU = 'logistica@amelia3.it', ITA = 'logistica@amelia3.it')
        label(Note3_caption; ENU = 'logistica@azienda.it', ITA = 'logistica@azienda.it')
        label(Note4_caption; ENU = 'Goods reception hours: Monday to Friday 08.30 - 12.00', ITA = 'Orario ricezione merce: dal lunedì al venerdì 08:30 - 12:00')
        label(RedattoDa_caption; ENU = 'Compiled by', ITA = 'Redatto da')
        label(DtRichSped_caption; ENU = 'Expected shipment date', ITA = 'Data Consegna Richiesta')
        // label(BankReference_Caption; ENU = 'Our bank references', ITA = 'Ns. riferimenti bancari')
        // label(YourBankAccountRef_Caption; ENU = 'Your bank references', ITA = 'Vs. Banca d''appoggio')
        label(YourBankAccountRef_Caption; ENU = 'Our bank references', ITA = 'Ns. Banca d''appoggio')
        label(BankReference_Caption; ENU = 'Your bank references', ITA = 'Vs. Banca d''appoggio')
        label(OfferNo; ENU = 'Our offer No.', ITA = 'Ns. Rdo')
        label(ShipMeth; ENU = 'Shipment Method', ITA = 'Porto')//Porto
        label(Transportedby; ENU = 'Transported by', ITA = 'Trasporto a cura')
        label(CustomerBankReference_Caption; ENU = 'Customer Bank', ITA = 'Banca Cliente')
        label(ABI_Caption; ENU = 'ABI', ITA = 'ABI')
        label(CAB_Caption; ENU = 'CAB', ITA = 'CAB')
        label(IBAN_Caption; ENU = 'IBAN', ITA = 'IBAN')


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
        StopExecution: Boolean;
    begin
        AdvRptDebug.AddEventLog('OnPreReport', 'Start', '');
        DetectCurrentDocument();

        HeaderLoop."EOS No. of Copies" := NoOfCopies;
        HeaderLoop."EOS Log Interaction" := LogInteraction;

        SetupLanguage(DocVariantToPrint);
        AdvancedReportingMngt.PrepareBuffer(DocVariantToPrint, ReportSetupCode, HeaderLoop, LineLoop, CurrReport.ObjectId(false));

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
    //         36:
    //             begin
    //                 RecRef.Close();
    //                 RecRef.Open(38);
    //                 RecRef.Copy(FakePurchaseHeader);
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

    local procedure GetBillToFormattedAddress(): Text
    var
        PrintsManagement: Codeunit "UFO03 Prints Management";
    //PostCode: record "Post Code";
    begin
        // PostCode.Reset();
        // if PostCode.Get(HeaderLoop."EOS Bill-to/Pay-to Post Code", HeaderLoop."EOS Bill-to/Pay-to City") then;

        if HeaderLoop."EOS Bill-to/Pay-to No." <> '' then
            exit(PrintsManagement.GetAddressInfo(HeaderLoop."EOS Bill-to/Pay-to Name", HeaderLoop."EOS Bill-to/Pay-to Name 2", HeaderLoop."EOS Bill-to/Pay-to Address", HeaderLoop."EOS Bill-to/Pay-to Address 2", HeaderLoop."EOS Bill-to/Pay-to Country", HeaderLoop."EOS Bill-to/Pay-to Post Code", HeaderLoop."EOS Bill-to/Pay-to City", HeaderLoop."EOS Bill-to/Pay-to County", '', ''));
    end;

    local procedure GetShipToFormattedAddress(): Text
    var
        PrintsManagement: Codeunit "UFO03 Prints Management";
    //PostCode: Record "Post Code";
    begin
        // PostCode.Reset();
        // if PostCode.Get(HeaderLoop."EOS Ship-to Post Code", HeaderLoop."EOS Ship-to City") then;

        if HeaderLoop."EOS Ship-to Code" <> '' then
            exit(PrintsManagement.GetAddressInfo(HeaderLoop."EOS Ship-to Name", HeaderLoop."EOS Ship-to Name 2", HeaderLoop."EOS Ship-to Address", HeaderLoop."EOS Ship-to Address 2", HeaderLoop."EOS Ship-to Country", HeaderLoop."EOS Ship-to Post Code", HeaderLoop."EOS Ship-to City", HeaderLoop."EOS Ship-to County", '', ''));
    end;

    var
        VendorAddress: text;
        BuyerAddress: text;
        BuyFromContact: Record Contact;
        Employee: Record Employee;
        // FooterImage: Record TempBlob temporary;
        // HeaderImage: Record TempBlob temporary;
        ReportSetup: Record "EOS Report Setup";
        Salesperson: Record "Salesperson/Purchaser";
        SellToContact: Record Contact;
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
        FooterCaption: text[100];
        VAT_ClauseDescription: array[10] of Text;
        VAT_Description: array[10] of Text;
        DocVariantToPrint: Variant;
        UnknowDocumentToPrintErr: TextConst ENU = 'Report %1 (%2): unable to recognize document to print', ITA = 'Report %1 (%2): impossibile riconoscere il documento da stampare';
        PurchaseOrderCaption: TextConst ENU = 'Purchase Order', ITA = 'Ordine d''acquisto';
        PurchaseQuoteCaption: TextConst ENU = 'Offer Request', ITA = 'Richiesta d''offerta';
        QuoteFooterLbl: TextConst ENU = 'Offer %1', ITA = 'Offerta %1';
        PurchaseFooterLbl: TextConst ENU = 'Order %1', ITA = 'Ordine %1';
        ABILbl: TextConst ENU = 'ABI  %1', ITA = 'ABI  %1';
        CABLbl: TextConst ENU = 'CAB  %1', ITA = 'CAB  %1';
        CIG_Caption: TextConst ENU = 'CIG  %1', ITA = 'CIG  %1';
        CUP_Caption: TextConst ENU = 'CUP  %1', ITA = 'CUP  %1';
        VarReportTitle: text;
        VarFooter: text;
        //Orderdate: Date;
        ExpctRecpDt_PurchHdr: Date;
        ShippingAgentCode: Code[10];
        SalesPersonMail: text;
        SalesPersonPhoneNo: text;
        TextMail: TextConst ENU = 'Email', ITA = 'Email';
        TextPhone: TextConst ENU = 'Phone No.', ITA = 'Nr. telefono';
        VendorCaption: TextConst ENU = 'C.a.', ITA = 'C.a.';
        BuyerCaption: TextConst ENU = 'Ref.', ITA = 'Ref.';
        Notes: TextConst ENU = 'NOTES', ITA = 'NOTE';
        Txt1: TextConst ENU = 'Book the delivery.', ITA = 'Prenotare la consegna';
        Txt2: TextConst ENU = 'Goods reception time: from monday to friday 8:30 - 12:00', ITA = 'Orario ricevimento merce: da lunedì a venerdì 8:30 - 12:00';
        FooterTxt: TextConst ENU = 'Offer No.', ITA = 'Nr. offerta';
        FooterOrderTxt: TextConst ENU = 'Order No.', ITA = 'Nr. ordine';
        PageLbl: TextConst ENU = 'Page', ITA = 'Pag.';
        WrittenBy: code[50];
        ApprovedBy: code[50];
        BankAccount: code[20];
        VendorABI: code[5];
        VendorCAB: Code[5];
        VendorOrderNo: code[35];
        ExpDate: Date;
        CIG: code[20];
        CUP: code[20];
        showvariant: boolean;
        ItemVariantDesc: text[100];
        ReportTitleOff: TextConst ENU = 'QUOTE REQUEST', ITA = 'RICHIESTA DI OFFERTA';
        ReportTitleOrd: TextConst ENU = 'PURCHASE ORDER', ITA = 'ORDINE DI ACQUISTO';
        ReportTitleNew: Text;
        TipoDocumento: Text;
        Debug: Boolean;
        // RecRef: RecordRef; // recref del debug
        // ReportDebug: Codeunit "MMA03 Report Debug";
        IsCustomerBank: Boolean;
        PrintsManagement: Codeunit "UFO03 Prints Management";
        ABICode: Code[5];
        CABCode: Code[5];
        IBANCode: Code[50];
        BankName: Text[100];
        QuoteNo: Code[20];
        PercSconto: Text;
        OrderDate: Date;
        NascondiPrezzi: Boolean;
        CompanyInfo: Record "Company Information";

}


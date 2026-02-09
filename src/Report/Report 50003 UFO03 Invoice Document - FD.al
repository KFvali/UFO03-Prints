report 50003 "UFO03 Invoice Document - FD"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'UFO03 Invoice Document - FD.rdlc';

    CaptionML = ENU = 'Invoice Document FD', ITA = 'Fattura Differita';
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
                column(TableID; HeaderLoop."EOS Source Table ID") { }
                column(HeaderImage; HeaderLoop."EOS Header Image") { }
                column(FooterImage; HeaderLoop."EOS Footer Image") { }
                column(CompanyPicture; CompanyInfo.Picture) { }
                column(CompanyREA; CompanyInfo."REA No.") { }
                column(CompanyVAT; CompanyInfo."VAT Registration No.") { }
                column(CompanyIban; CompanyInfo.IBAN) { }
                column(CompanyShareCapitalTxt; RigaCapitaleSociale) { }
                column(ReportTitle; HeaderLoop."EOS Report Title") { }
                column(CopyNo; Number) { }
                column(DocumentNo; HeaderLoop."EOS No.") { }
                column(PostingDate; HeaderLoop."EOS Posting Date") { }
                //column(Salesperson; Salesperson.Name) { }
                //column(Salesperson; Salesperson.Code) { }
                column(Salesperson; Agente) { }
                column(CupCode; CupCode_Value) { }
                column(CigCode; CigCode_Value) { }
                column(OurBankRef; OurBankRef) { }
                column(OurBankRef1; OurBankRef1) { }
                column(OperatorName; Employee.FullName()) { }
                column(SelltoBuyFromNo; HeaderLoop."EOS Sell-to/Buy-From No.") { }
                column(SellToBuyFromAddr; HeaderLoop.GetSellToBuyFromAddr()) { }
                column(BillToNo; HeaderLoop."EOS Bill-to/Pay-to No.") { }
                //ORG column(BillToAddress; HeaderLoop.GetBillToPayToAddr()) { }
                //ORG  column(ShipToAddress; HeaderLoop.GetShipToAddr()) { }
                column(ShipToAddress; GetShipToFormattedAddress()) { }
                column(BillToAddress; GetBillToFormattedAddress()) { }
                column(CustomerVendorContact; BuyFromContact.Name) { }
                column(CustomerVendorEMail; BuyFromContact."E-Mail") { }
                column(CustomerGroup; CustomerGroup) { }
                column(PaymentTerms; HeaderLoop.PaymentTerms_GetDescInLanguage()) { }
                column(PaymentMethod; HeaderLoop.PaymentMethod_GetDescInLanguage()) { }
                column(PaymentMethodCode; HeaderLoop."EOS Payment Method Code") { }
                column(Reason; HeaderLoop.ReasonCode_GetDescInLanguage()) { }
                column(VATRegNo; HeaderLoop."EOS VAT Registration No.") { }
                column(FiscalCode; HeaderLoop."EOS Fiscal Code") { }
                column(ShptMethod; HeaderLoop.ShptMethod_GetDescInLanguage()) { }
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
                column(ABICode; ABICode) { }
                column(CABCode; CABCode) { }
                column(IBANCode; IBANCode) { }
                column(BankName; BankName) { }
                column(CurrencyCode; HeaderLoop."EOS Currency Code") { }
                column(NascondiBanche; NascondiBanche) { }
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
                    column(Line_Description2; LineLoop."EOS Description 2") { }
                    //Start 220321  /IAD
                    column(showvariant; showvariant) { }
                    column(Line_ItemVariantNo; LineLoop."EOS Variant Code") { }
                    column(Line_ItemVariantDesc; ItemVariantDesc) { }
                    //Stop  220321  /IAD
                    column(Line_Quantity; LineLoop."EOS Quantity") { DecimalPlaces = 3; }
                    column(Line_UoMCode; CopyStr(LineLoop.GetUdMTraduction(HeaderLoop), 1, 4)) { }
                    //column(Line_LineDiscountPerc; LineLoop."EOS Discount Text") { }
                    column(Line_LineDiscountPerc; PercSconto) { }
                    column(Line_UnitPrice; LineLoop."EOS Unit Price") { DecimalPlaces = 5; }
                    column(Line_Amount; LineLoop."EOS Amount" + LineLoop."EOS Inv. Discount Amount") { }
                    column(Line_VATIdentifier; LineLoop."EOS VAT Identifier") { }
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
                    column(DichIntentoTesto; DichIntentoTesto) { }
                    trigger OnAfterGetRecord()
                    var
                        Lines: Record "EOS Report Buffer Line" temporary;
                        Item: Record "Item" temporary;
                        //jobshipline: Record "MMA07 Job Shipment Line";
                        ItemVariant: Record "Item Variant";
                        LocItem: Record Item;
                        lSalesInvLine: Record "Sales Invoice Line";
                        DichIntento: Record "EOS VAT Exemption";
                        DicituraImpostaTxt: TextConst ENU = 'Tax not applied as per declaration of intent with receipt protocol %1', ITA = 'Imposta non applicata come da dichiarazione d''intento con protocollo di ricezione %1';

                    begin
                        if ImagesSent then begin
                            Clear(HeaderLoop."EOS Header Image");
                            Clear(HeaderLoop."EOS Footer Image");
                        end else
                            ImagesSent := true;
                        ItemVariant.reset;
                        showvariant := false;
                        if itemVariant.get(LineLoop."EOS No.", LineLoop."EOS Variant Code") and (LineLoop."EOS Quantity" <> 0)
                        then begin
                            showvariant := true;
                            if itemvariant.Description <> '' then
                                ItemVariantDesc := itemvariant.Description
                        end;

                        If "EOS Discount Text" = '0' then
                            PercSconto := ''
                        else
                            PercSconto := "EOS Discount Text";

                        Clear(DichIntentoTesto);
                        lSalesInvLine.Reset();
                        if lSalesInvLine.get(LineLoop."EOS Document No.", LineLoop."EOS Source Line No.") then begin
                            if lSalesInvLine."EOS VAT Exemption No." <> '' then begin
                                DichIntento.Reset();
                                if DichIntento.get(DichIntento.Type::Customer, lSalesInvLine."EOS VAT Exemption No.") then
                                    DichIntentoTesto := StrSubstNo(DicituraImpostaTxt, DichIntento."Document No.")
                                else
                                    clear(DichIntentoTesto);
                            end;
                        end;
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
                var
                    VATIdentifier: Record "VAT Identifier";
                    VATIdentifier2: Record "VAT Identifier";
                    VATIdentifier3: Record "VAT Identifier";
                    VATIdentifier4: Record "VAT Identifier";
                    CustLedgerEntry: Record "Cust. Ledger Entry";
                    i: Integer;

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

                    // ---> gestione parentesi da togliere su descrizioni IVA
                    if VAT_Description[1] = '' then begin
                        if VATIdentifier.Get(VAT_Identifier[1]) then
                            VAT_Description[1] := VATIdentifier.Description
                    end else begin
                        if StrPos(VAT_Description[1], '(') > 0 then
                            VAT_Description[1] := CopyStr(VAT_Description[1], 1, StrPos(VAT_Description[1], '(') - 1)
                        else
                            VAT_Description[1] := VAT_Description[1];
                    end;

                    if VAT_Description[2] = '' then begin
                        if VATIdentifier2.Get(VAT_Identifier[2]) then
                            VAT_Description[2] := VATIdentifier2.Description
                    end else begin
                        if StrPos(VAT_Description[2], '(') > 0 then
                            VAT_Description[2] := CopyStr(VAT_Description[2], 1, StrPos(VAT_Description[2], '(') - 1)
                        else
                            VAT_Description[2] := VAT_Description[2];
                    end;

                    if VAT_Description[3] = '' then begin
                        if VATIdentifier3.Get(VAT_Identifier[3]) then
                            VAT_Description[3] := VATIdentifier3.Description
                    end else begin
                        if StrPos(VAT_Description[3], '(') > 0 then
                            VAT_Description[3] := CopyStr(VAT_Description[3], 1, StrPos(VAT_Description[3], '(') - 1)
                        else
                            VAT_Description[3] := VAT_Description[3];
                    end;

                    if VAT_Description[4] = '' then begin
                        if VATIdentifier4.Get(VAT_Identifier[4]) then
                            VAT_Description[4] := VATIdentifier4.Description
                    end else begin
                        if StrPos(VAT_Description[4], '(') > 0 then
                            VAT_Description[4] := CopyStr(VAT_Description[4], 1, StrPos(VAT_Description[4], '(') - 1)
                        else
                            VAT_Description[4] := VAT_Description[4];
                    end;
                    // <--- gestione parentesi da togliere su descrizioni IVA

                    // ---> gestione pagamenti e scadenze (non funziona la gestione standard)
                    i := 1;

                    CustLedgerEntry.Reset();
                    CustLedgerEntry.SetCurrentKey("Document No.");
                    CustLedgerEntry.SetRange("Document No.", HeaderLoop."EOS No.");
                    if CustLedgerEntry.FindSet() then begin
                        repeat
                            CustLedgerEntry.CalcFields("Original Amount");
                            PaymentLine_DueDate[i] := CustLedgerEntry."Due Date";
                            PaymentLine_Amount[i] := CustLedgerEntry."Original Amount";
                            i += 1;
                        until CustLedgerEntry.Next() = 0;
                    end;
                    // <--- gestione pagamenti e scadenze (non funziona la gestione standard)

                end;

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, 1 + HeaderLoop."EOS No. of Copies");
                end;
            }

            trigger OnAfterGetRecord()
            var
                SalesInvHeader: Record "Sales Invoice Header";
                SalesCrMemoHeader: record "Sales Cr.Memo Header";
                loccustomer: Record Customer;
                locCustbankAcc: Record "Customer Bank Account";
                locBankAcc: Record "Bank Account";
                PaymentMethod: Record "Payment Method";

            begin
                if not ReportSetup.Get(HeaderLoop."EOS Report Setup Code") then
                    ReportSetup.Init();

                if not Salesperson.Get(HeaderLoop."EOS Salesperson Code") then
                    Clear(Salesperson);

                if Salesperson.Code <> '' then begin
                    if Salesperson.Name <> '' then
                        Agente := Salesperson.Code + ' - ' + Salesperson.Name
                    else
                        Agente := Salesperson.Code;
                end else
                    clear(Agente);

                if not Employee.Get(HeaderLoop."EOS Operator No.") then
                    Clear(Employee);

                if not BuyFromContact.Get(HeaderLoop."EOS Sell-to Contact No.") then
                    Clear(BuyFromContact);

                if not SellToContact.Get(HeaderLoop."EOS Sell-to Contact No.") then
                    Clear(SellToContact);
                if not PaymentMethod.Get(HeaderLoop."EOS Payment Method Code") then
                    Clear(PaymentMethod); //mpd+ 08.02.21

                // if ReportSetup."EOS Print Logos" then begin
                //     HeaderLoop.GetHeaderImage(HeaderImage);
                //     HeaderLoop.GetFooterImage(FooterImage);
                // end;

                IF ReportSetup."EOS Print Logos" then
                    HeaderLoop.PopulateHeaderFooterImages();

                if not CurrReport.Preview() then
                    HeaderLoop.LogInteraction();

                CigCode_Value := '';
                CupCode_Value := '';
                if SalesInvHeader.Get(HeaderLoop."EOS No.") then begin
                    CigCode_Value := SalesInvHeader."Fattura Tender Code";
                    CupCode_Value := SalesInvHeader."Fattura Project Code";
                    CustomerGroup := SalesInvHeader."Customer Posting Group";
                end;
                if SalesCrMemoHeader.Get(HeaderLoop."EOS No.") then begin
                    CigCode_Value := SalesCrMemoHeader."Fattura Tender Code";
                    CupCode_Value := SalesCrMemoHeader."Fattura Project Code";
                end;

                OurBankRef := '';
                OurBankRef1 := '';
                loccustomer.get(HeaderLoop."EOS Bill-to/Pay-to No.");
                //if (PaymentMethod."MMA04 Print Customer Bank Info") then begin
                if (loccustomer."Preferred Bank Account Code" <> '') AND
                (locCustbankAcc.Get(loccustomer."No.", loccustomer."Preferred Bank Account Code")) then begin
                    //ORG OurBankRef := CopyStr(locCustbankAcc.Name, 1, 26); Perche 26?? //IAD
                    OurBankRef := CopyStr(locCustbankAcc.Name, 1, 49); //IAD + 21.04.2021
                    if locCustbankAcc.ABI <> '' then
                        OurBankRef1 += ' ABI:' + locCustbankAcc.ABI;

                    if locCustbankAcc.CAB <> '' then
                        OurBankRef1 += ' CAB:' + locCustbankAcc.CAB;
                end;
                //end
                //else begin

                if locBankAcc.Get(loccustomer."EOS Our Bank Account") then
                    OurBankRef := CopyStr(locBankAcc.Name, 1, 49);

                //end;

                SalesInvHeader.Reset();
                SalesCrMemoHeader.Reset();

                if SalesInvHeader.Get(HeaderLoop."EOS No.") then begin
                    IsCustomerBank := PrintsManagement.GetBankInformation(HeaderLoop."EOS Bill-to/Pay-to No.", HeaderLoop."EOS Payment Method Code", SalesInvHeader."EOS Our Bank Account", ABICode, CABCode, IBANCode, BankName);
                    NascondiBanche := false
                end else
                    if SalesCrMemoHeader.Get(HeaderLoop."EOS No.") then begin
                        IsCustomerBank := PrintsManagement.GetBankInformation(HeaderLoop."EOS Bill-to/Pay-to No.", HeaderLoop."EOS Payment Method Code", SalesCrMemoHeader."EOS Our Bank Account", ABICode, CABCode, IBANCode, BankName);
                        NascondiBanche := true;
                    end;

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
        //ReportTitle = 'Deferred Invoice';
        label(BillToAddress_Caption; ENU = 'Billing address', ITA = 'Destinatario')
        label(CustomerVendorContact_Caption; ENU = 'Contact', ITA = 'Contatti')
        label(CustomerVendorMail_Caption; ENU = 'E-Mail', ITA = 'Mail')
        label(CustomerVendorNo_Caption; ENU = 'Customer No.', ITA = 'Nr. Cliente')
        label(DocumentNo_Caption; ENU = 'No.', ITA = 'Nr.')
        label(FiscalCode_Caption; ENU = 'Fiscal code', ITA = 'Codice Fiscale')
        label(GoodsAppearance_Caption; ENU = 'Goods appearance', ITA = 'Aspetto dei beni')
        label(GrossWeight_Caption; ENU = 'Gross weight', ITA = 'Peso')
        label(Line_Amount_Caption; ENU = 'Amount', ITA = 'Importo')
        label(Line_Description_Caption; ENU = 'Description', ITA = 'Descrizione')
        label(Line_ItemNo_Caption; ENU = 'No.', ITA = 'Nr.')
        label(Line_NoReg_Caption; ENU = 'Reg. No.', ITA = 'Nr. Reg')
        label(Line_LineDiscountPerc_Caption; ENU = 'Disc. %', ITA = 'Sconto %')
        label(Line_OrderQuantity_Caption; ENU = 'Order Quantity', ITA = 'Quantità Ordine')
        label(Line_Quantity_Caption; ENU = 'Quantity', ITA = 'Quantità')
        label(Line_ShipmentDate_Caption; ENU = 'Shpt. Date', ITA = 'Data Spediz.')
        label(Line_Type_Descr_Caption; ENU = 'Type', ITA = 'Tipo')
        label(Line_UnitPrice_Caption; ENU = 'Price', ITA = 'Prezzo')
        //label(Line_UoM_Caption; ENU = 'U.M.', ITA = 'U.M.')
        label(Line_UoM_Caption; ENU = 'UM', ITA = 'UM')
        //label(Line_VATIdentifier_Caption; ENU = 'VAT', ITA = 'Cod.IVA')
        label(Line_VATIdentifier_Caption; ENU = 'VAT', ITA = 'IVA')
        label(NetWeightCaption; ENU = 'Net weight', ITA = 'Peso Netto')
        label(NoOfParcels_Caption; ENU = 'No. of Parcels', ITA = 'Nr. Colli')
        label(OperatorName_Caption; ENU = 'Contact', ITA = 'Contatto')
        label(OrderConf_Title; ENU = 'Order Confirmation', ITA = 'Conferma Ordine')
        label(OrderDate_Caption; ENU = 'Order Date', ITA = 'Data Ordine')
        label(Our_Bank; ENU = 'Our Bank Account', ITA = 'Nostro Conto Bancario')
        label(Page_Caption; ENU = 'Page', ITA = 'Pagina')
        label(Payment_Amount_Caption; ENU = 'Installment Amount', ITA = 'Importo Rata')
        label(Payment_DueDate_Caption; ENU = 'Due Date', ITA = 'Scadenza')
        label(PaymentMethod_Caption; ENU = 'Payment method', ITA = 'Metodo di pagamento')
        label(PaymentTerms_Caption; ENU = 'Payment terms', ITA = 'Condizione di pagamento')
        label(PostingDate_Caption; ENU = 'Date', ITA = 'Data')
        label(Reason_Caption; ENU = 'Transport reason', ITA = 'Causale del trasporto')
        label(ReturnAddr_Caption; ENU = 'Return address', ITA = 'Indirizzo mittente')
        label(Salesperson_Caption; ENU = 'Salesperson', ITA = 'Agente')
        label(ShipmentDate_Caption; ENU = 'Shpt. Date', ITA = 'Data Spediz.')
        label(ShipToAddress_Caption; ENU = 'Shipping address', ITA = 'Luogo di destinazione')
        label(ShpAgent_Caption; ENU = 'Shipping agent', ITA = 'Generalità del vettore')
        label(ShptBy_Caption; ENU = 'Shpt. by'/*, ITA = 'Agente'*/)
        label(ShptMethod_Caption; ENU = 'Shipment meth.', ITA = 'Porto')
        label(ShptStart_Caption; ENU = 'Shipment Start', ITA = 'Inizio del trasporto o consegna data e ora')
        label(SigDriver_Caption; ENU = 'Signature - Driver', ITA = 'Firma del compiltore')
        label(SigRecipient_Caption; ENU = 'Signature - Recipient', ITA = 'Firma del destinatario')
        label(SigShpAgent_Caption; ENU = 'Signature - Ship. agent', ITA = 'Firma del''incaricato al trasporto o vettore')
        label(Total_DocumentTotalCaption; ENU = 'Document Total', ITA = 'TOTALE FATTURA')
        label(Total_DocumentTotalVatExclCaption; ENU = 'Document Total Vat Excl.', ITA = 'TOTALE FATTURA IVA escl.')
        label(Total_NetAmountToPayCaption; ENU = 'Net Amount To Pay', ITA = 'Importo netto da pagare')
        label(Total_TotalAmountCaption; ENU = 'Total VAT', ITA = 'Totale IVA')
        label(Total_TotalBaseCaption; ENU = 'Total Base', ITA = 'Totale Imponibile')
        label(Total_TotalCaption; ENU = 'Total amount', ITA = 'Totale Importo')
        //label(Total_TotalInvDiscCaption; ENU = 'Invoice Discount', ITA = 'Totale Sc. Fatt.')
        label(Total_TotalInvDiscCaption; ENU = 'Invoice Discount', ITA = 'Totale Extra Sc.')
        label(ValidTo_Caption; ENU = 'Validity', ITA = 'Validità')
        //label(VAT_InvDisc_Caption; ENU = 'Inv. Disc.', ITA = 'Sc. Fatt.')
        label(VAT_InvDisc_Caption; ENU = 'Inv. Disc.', ITA = 'Extra Sc.')
        //label(VAT_Line_VATIdentifier_Caption; ENU = 'VAT Code', ITA = 'Cod.IVA')
        label(VAT_Line_VATIdentifier_Caption; ENU = 'VAT', ITA = 'IVA')
        label(VAT_VATAmount_Caption; ENU = 'Amount', ITA = 'Importo')
        label(VAT_VATBase_Caption; ENU = 'Base', ITA = 'Imponibile')
        label(VAT_VATPercent_Caption; ENU = 'VAT %', ITA = '% IVA')
        label(VAT_VATText_Caption; ENU = 'Description', ITA = 'Descrizione')
        label(VATClausesCaption; ENU = 'VAT Additional Info:', ITA = 'IVA Info aggiuntive')
        label(VATRegNo_Caption; ENU = 'VAT Reg.', ITA = 'Partita IVA')
        label(Volume_Caption; ENU = 'Volume', ITA = 'Volume')
        label(YourReference_Caption; ENU = 'Your reference', ITA = 'Vostro Riferimento')
        label(SigCompilier_Caption; ENU = 'Compiler Signature', ITA = 'Firma compilatore')
        label(TaxDiscount_Caption; ENU = 'Tax Discount'/*, ITA = 'Bolli'*/)
        label(CarrierGenInfo_Caption; ENU = 'General Information of the carrier', ITA = 'Generalità del vettore')
        label(CollectionCosts; ENU = 'Collection Costs', ITA = 'Spese d''incasso')
        label(GoodsTotal_Caption; ENU = 'Goods Total', ITA = 'Totale Merce')
        label(LoadingPlace_Caption; ENU = 'Goods Loading Place', ITA = 'Luogo di carico della merce')
        label(TypeNoDocument_Caption; ENU = 'DOCUMENT TYPE\NUMBER', ITA = 'TIPO/NUMERO DOCUMENTO')
        label(DATE_caption; ENU = 'DATE', ITA = 'DATA')
        label(BankAccountDetail_Caption; ENU = 'BANK ACCOUNT DETAILS', ITA = 'BANCA D''APPOGGIO')
        label(Advances_Caption; ENU = 'ADVANCES', ITA = 'ACCONTI')
        label(DistinctDeadline_Caption; ENU = 'DISTINCT DEADLINE', ITA = 'DISTINTA SCADENZE')
        label(Various_Caption; ENU = 'VARIOUS', ITA = 'VARIE')
        label(TotaltoPay_Caption; ENU = 'TOTAL TO PAY', ITA = 'TOTALE DA PAGARE')
        label(TotalExpenses_Caption; ENU = 'TOTAL EXPENSES', ITA = 'TOTALE SPESE')
        label(DiscountAmountCaption; ENU = 'DISCOUNT AMOUNT', ITA = 'IMPORTO SCONTO')
        label(CIGCaption; ENU = 'CIG', ITA = 'CIG')
        label(CUPCaption; ENU = 'CUP', ITA = 'CUP')
        label(YourBankAccountRef_Caption; ENU = 'Our bank references', ITA = 'Ns. riferimenti bancari')
        label(AmountVAT_caption; ENU = 'VAT', ITA = 'IVA')
        label(AmountVATLordo_caption; ENU = 'Amount', ITA = 'Importo')
        label(TransportbyThe_Caption; ENU = 'Transport by the'/*, ITA = 'Trasporto a cura del'*/)
        label(BankReference_Caption; ENU = 'Your bank references', ITA = 'Vs. riferimenti bancari')
        label(CustomerBankReference_Caption; ENU = 'Customer Bank', ITA = 'Banca Cliente')
        label(ABI_Caption; ENU = 'ABI', ITA = 'ABI')
        label(CAB_Caption; ENU = 'CAB', ITA = 'CAB')
        label(Valuta_Caption; ENU = 'Currency', ITA = 'Valuta')
        label(IBAN_Caption; ENU = 'IBAN', ITA = 'IBAN')
        label(CompanyPIva_caption; ENU = 'P.iva e C.F.', ITA = 'P.iva e C.F.')
        label(CompanyRea_caption; ENU = 'Iscr. cciaa Terni n. rea', ITA = 'Iscr. cciaa Terni n. rea')
        label(IBANCompany_caption; ENU = 'IBAN', ITA = 'IBAN')
        label(Conai1_caption; ENU = 'CONAI CONTRIBUTION PAID WHERE DUE', ITA = 'CONTRIBUTO CONAI ASSOLTO OVE DOVUTO. ')
        label(Piede6_caption; ENU = '(*) SM = Discount on Goods; ID = Company VAT; IC = Customer VAT; SO = Replacement', ITA = '(*) SM = Sconto in Merce; ID = Iva Carico Ditta; IC = Iva Carico Cliente; SO = Sostituzione')
        label(Piede9_caption; ENU = 'INFORMATION AND REQUEST FOR CONSENT TO THE PROCESSING OF PERSONAL DATA IN ACCORDANCE WITH EU REGULATION 679/2016 AND CURRENT ITALIAN LEGISLATION ON THE SUBJECT', ITA = 'INFORMATIVA E RICHIESTA CONSENSO AL TRATTAMENTO DEI DATI PERSONALI AI SENSI DEL REGOLAMENTO UE 679/2016 E NORMATIVA ITALIANA VIGENTE IN MATERIA')
        label(Piede10_caption; ENU = 'The processing of personal data is carried out, in full compliance with the aforementioned legislation, in compliance with the fundamental rights and freedoms of the interested party, ', ITA = 'Il trattamento dei dati personali si svolge, nel pieno rispetto della normativa suddetta, nel rispetto dei diritti e delle libertà fondamentali dell''interessato, ')
        label(Piede11_caption; ENU = 'with particular reference to confidentiality and the right to protection. The processing is carried out to fulfill administrative-accounting and fiscal obligations, ', ITA = 'con particolare riferimento alla riservatezza e al diritto alla protezione. Il trattamento viene effettuato per adempiere ad obblighi amministrativo-contabili e fiscali, ')
        label(Piede12_caption; ENU = 'as per the information available at www.amelia3.it, which we ask you to read', ITA = 'come da informativa reperibile all''indirizzo www.amelia3.it, della quali Vi preghiamo di prendere visione')
        label(SupplierNumber_Caption; ENU = 'SUPPLIER NUMBER', ITA = 'FORNITORE N.', DEU = 'LIEFERANT N.')
        label(YourReferenceNumber_Caption; ENU = 'YOUR REFERENCE ORDER NUMBER', ITA = 'RIFERIMENTO VS NUMERO ORDINE', DEU = 'IN BEZUNG AUF IHRE BESTELLUNG NR.')
        label(CommodityCode_Caption; ENU = 'Commodity code:', ITA = 'Commodity code:')
        label(GrossWeightSotto_caption; ENU = 'Gross Weight: Kg', ITA = 'Gross Weight: Kg')
        label(Colli_caption; ENU = 'Packaging: n.', ITA = 'Packaging: n.')
        label(Resa_Caption; ENU = 'Delivery:', ITA = 'Delivery:')
        label(Trasporto_Caption; ENU = 'Carriage:', ITA = 'Carriage:')
        label(PaeseOrigine_Caption; ENU = 'Country of origin:', ITA = 'Country of origin:')
        label(PaeseDestinazione_Caption; ENU = 'Destination country:', ITA = 'Destination country:')
        label(CommodityCode1_Caption; ENU = 'Codice merce:', ITA = 'Codice merce:')
        label(GrossWeightSotto1_caption; ENU = 'Peso Lordo: Kg', ITA = 'Peso Lordo: Kg')
        label(Colli1_caption; ENU = 'Colli: n.', ITA = 'Colli: n.')
        label(Resa1_Caption; ENU = 'RESA:', ITA = 'RESA:')
        label(Trasporto1_Caption; ENU = 'Trasporto:', ITA = 'Trasporto:')
        label(PaeseOrigine1_Caption; ENU = 'Paese d''origine:', ITA = 'Paese d''origine:')
        label(PaeseDestinazione1_Caption; ENU = 'Paese destinazione:', ITA = 'Paese destinazione:')
        label(DestinazioneMerce_Caption; ENU = 'Destinazione Merce:', ITA = 'Destinazione Merce:')
        label(Esportatore1_Caption; ENU = 'L''esportatore dichiara che i prodotti oggetto del', ITA = 'L''esportatore dichiara che i prodotti oggetto del')
        label(Esportatore2_Caption; ENU = 'presente documento, salvo dove diversamente', ITA = 'presente documento, salvo dove diversamente')
        label(Esportatore3_Caption; ENU = 'indicato, sono di origine preferenziale della', ITA = 'indicato, sono di origine preferenziale della')
        label(Esportatore4_Caption; ENU = 'Comunità europea.', ITA = 'Comunità europea.')
        label(EsportatoreIng1_Caption; ENU = 'The exporter of the products covered by this', ITA = 'The exporter of the products covered by this')
        label(EsportatoreIng2_Caption; ENU = 'document, declares that, except where otherwise', ITA = 'document, declares that, except where otherwise')
        label(EsportatoreIng3_Caption; ENU = 'clearly indicated, these products are of the', ITA = 'clearly indicated, these products are of the')
        label(EsportatoreIng4_Caption; ENU = 'European Community preferential origin.', ITA = 'European Community preferential origin.')
        label(Intracomunitaria1_Caption; ENU = 'Operazione intracomunitaria', ITA = 'Operazione intracomunitaria')
        label(Intracomunitaria2_Caption; ENU = 'non imponibile IVA art.', ITA = 'non imponibile IVA art.')
        label(Intracomunitaria3_Caption; ENU = '41 DPR 331/93', ITA = '41 DPR 331/93')
        label(Intracomunitaria4_Caption; ENU = '-Reverse charge-', ITA = '-Reverse charge-')
        label(Extracomunitaria1_Caption; ENU = 'Operazione extracomunitaria', ITA = 'Operazione extracomunitaria')
        label(Extracomunitaria2_Caption; ENU = 'non imponibile IVA art. 8', ITA = 'non imponibile IVA art. 8')
        label(Extracomunitaria3_Caption; ENU = 'DPR 633/72', ITA = 'DPR 633/72')
        label(NonImpIVA1_Caption; ENU = 'Non imp. IVA art 8/2 DPR 633', ITA = 'Non imp. IVA art 8/2 DPR 633')
        label(NonImpIVA2_Caption; ENU = 'del 26/10/72 e succ. modifiche', ITA = 'del 26/10/72 e succ. modifiche')
        label(NonImpIVA3_Caption; ENU = 'Vs. aut. N.   162 del 12/12/24', ITA = 'Vs. aut. N.   162 del 12/12/24')
        label(NonImpIVA4_Caption; ENU = 'Ns protoc.   1 del 12/12/24', ITA = 'Ns protoc.   1 del 12/12/24')
    }

    trigger OnInitReport()
    var

    begin
        CompanyInfo.get;
        CompanyInfo.CalcFields(Picture);

        RigaCapitaleSociale := CapSocAz_CaptionLbl + ' 10.400,00 ' + InteramenteVersatoLbl;

        // ---> settato qui per sistemare la visualizzazione dei lotti
        ReportSetupCode := 'FAT DIF';
    end;

    trigger OnPreReport()
    var
        PrintsManagement: Codeunit "UFO03 Prints Management";
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

        case LineLoop."EOS Source Table ID" of
            Database::"Sales Invoice Line":
                PrintsManagement.SetCustomDocumentReferenceForDifferitaLines(LineLoop, CurrReport.ObjectId(false));

            Database::"Sales Cr.Memo Line":
                PrintsManagement.SetCustomDocumentReferenceForCreditMemoLines(LineLoop, CurrReport.ObjectId(false));
        end;


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
    //         112:
    //             begin
    //                 RecRef.Close();
    //                 RecRef.Open(112);
    //                 RecRef.Copy(FakeSalesInvoiceHeader);
    //             end;
    //         114:
    //             begin
    //                 RecRef.Close();
    //                 RecRef.Open(114);
    //                 RecRef.Copy(FakeSalesCrMemoHeader);
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
        BillToCounty: Text[30];
    begin
        PostCode.reset;
        PostCode.SetRange(Code, HeaderLoop."EOS Bill-to/Pay-to Post Code");
        PostCode.SetRange(city, HeaderLoop."EOS Bill-to/Pay-to City");
        if PostCode.FindFirst() then
            BillToCounty := Postcode."County";

        FormatAddr.FormatAddr(
          AddrArray, HeaderLoop."EOS Bill-to/Pay-to Name", HeaderLoop."EOS Bill-to/Pay-to Name 2", '', HeaderLoop."EOS Bill-to/Pay-to Address", //mpd- 
          HeaderLoop."EOS Bill-to/Pay-to Address 2", HeaderLoop."EOS Bill-to/Pay-to City", HeaderLoop."EOS Bill-to/Pay-to Post Code", BillToCounty,
         HeaderLoop."EOS Bill-to/Pay-to Country");
        // Start TDAG00993/tt
        /*IF "Mail-To Contact No." <> '' THEN BEGIN
            CLEAR(AddrArray);
            Contact.GET("Mail-To Contact No.");
            FormatAddr.ContactAddr(AddrArray, Contact);
        END;
        // Stop TDAG00993/tt*/
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

    local procedure GetBillToFormattedAddress(): Text
    var
        PrintsManagement: Codeunit "UFO03 Prints Management";
        Customer: Record Customer;
        TelLbl: TextConst ITA = 'Telefono: %1', ENU = 'Phone: %1';
        FaxLbl: TextConst ITA = ' - Fax: %1', ENU = ' - Fax: %1';
        Telefono: text;
        Fax: text;
    //PostCode: record "Post Code";
    begin
        // PostCode.Reset();
        // if PostCode.Get(HeaderLoop."EOS Bill-to/Pay-to Post Code", HeaderLoop."EOS Bill-to/Pay-to City") then;

        if HeaderLoop."EOS Bill-to/Pay-to No." <> '' then begin
            if Customer.get(HeaderLoop."EOS Bill-to/Pay-to No.") then begin
                if Customer."Phone No." <> '' then
                    Telefono := StrSubstNo(TelLbl, Customer."Phone No.")
                else
                    Clear(Telefono);
                if Customer."Fax No." <> '' then
                    Fax := StrSubstNo(FaxLbl, Customer."Fax No.")
                else
                    Clear(Fax);
            end;
            exit(PrintsManagement.GetAddressInfo(HeaderLoop."EOS Bill-to/Pay-to Name", HeaderLoop."EOS Bill-to/Pay-to Name 2", HeaderLoop."EOS Bill-to/Pay-to Address", HeaderLoop."EOS Bill-to/Pay-to Address 2", HeaderLoop."EOS Bill-to/Pay-to Country", HeaderLoop."EOS Bill-to/Pay-to Post Code", HeaderLoop."EOS Bill-to/Pay-to City", HeaderLoop."EOS Bill-to/Pay-to County", Telefono, Fax));
        end;
    end;

    local procedure GetShipToFormattedAddress(): Text
    var
        PrintsManagement: Codeunit "UFO03 Prints Management";
        Customer: Record Customer;
        TelLbl: TextConst ITA = 'Telefono: %1', ENU = 'Phone: %1';
        FaxLbl: TextConst ITA = ' - Fax: %1', ENU = ' - Fax: %1';
        Telefono: text;
        Fax: text;
    //PostCode: Record "Post Code";
    begin
        // PostCode.Reset();
        // if PostCode.Get(HeaderLoop."EOS Ship-to Post Code", HeaderLoop."EOS Ship-to City") then;
        if HeaderLoop."EOS Ship-to Code" <> '' then begin
            if Customer.get(HeaderLoop."EOS Ship-to Code") then begin
                if Customer."Phone No." <> '' then
                    Telefono := StrSubstNo(TelLbl, Customer."Phone No.")
                else
                    Clear(Telefono);
                if Customer."Fax No." <> '' then
                    Fax := StrSubstNo(FaxLbl, Customer."Fax No.")
                else
                    Clear(Fax);
            end;
            exit(PrintsManagement.GetAddressInfo(HeaderLoop."EOS Ship-to Name", HeaderLoop."EOS Ship-to Name 2", HeaderLoop."EOS Ship-to Address", HeaderLoop."EOS Ship-to Address 2", HeaderLoop."EOS Ship-to Country", HeaderLoop."EOS Ship-to Post Code", HeaderLoop."EOS Ship-to City", HeaderLoop."EOS Ship-to County", Telefono, Fax));
        end;
    end;

    var
        BuyFromContact: Record Contact;
        Employee: Record Employee;
        // FooterImage: Record TempBlob temporary;
        // HeaderImage: Record TempBlob temporary;
        ReportSetup: Record "EOS Report Setup";
        Salesperson: Record "Salesperson/Purchaser";
        SellToContact: Record Contact;
        ImagesSent: Boolean;
        LogInteraction: Boolean;
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
        DocVariantToPrint: Variant;
        UnknowDocumentToPrintErr: Label 'Report %1 (%2): unable to recognize document to print';
        CigCode_Value: Code[15];
        CupCode_Value: Code[15];
        OurBankRef: Text[50];
        OurBankRef1: Text[50];
        showvariant: boolean;
        ItemVariantDesc: text[180];
        ABICode: Code[5];
        CABCode: Code[5];
        IBANCode: Code[50];
        BankName: Text[100];
        IsCustomerBank: Boolean;
        PrintsManagement: Codeunit "UFO03 Prints Management";
        Debug: Boolean;
        // RecRef: RecordRef; // recref del debug
        // ReportDebug: Codeunit "MMA03 Report Debug";
        PercSconto: Text;
        NascondiBanche: Boolean;
        DichIntentoTesto: Text;
        CompanyInfo: Record "Company Information";
        RigaCapitaleSociale: Text;
        CapSocAz_CaptionLbl: TextConst ENU = 'Share capital', ITA = 'Cap. Soc.';
        InteramenteVersatoLbl: TextConst ENU = 'fully paid', ITA = 'inter. vers.';
        Agente: Text;
        CustomerGroup: code[20];
}


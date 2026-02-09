report 50000 "UFO03 Sales Document"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'UFO03 Sales Document.rdlc';
    CaptionML = ENU = 'Sales - Quote Document', ITA = 'Offerta/Ordine di vendita';
    PreviewMode = PrintLayout;

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
                column(ReportTitle; HeaderLoop."EOS Report Title") { }
                column(CompanyPicture; CompanyInfo.Picture) { }
                column(CompanyREA; CompanyInfo."REA No.") { }
                column(CompanyVAT; CompanyInfo."VAT Registration No.") { }
                column(CompanyIban; CompanyInfo.IBAN) { }
                column(CompanyShareCapitalTxt; RigaCapitaleSociale) { }
                column(CopyNo; Number) { }
                column(DocumentNo; HeaderLoop."EOS No.") { }
                //column(PostingDate; HeaderLoop."EOS Posting Date") { }
                column(PostingDate; OrderDate) { }
                //column(Salesperson; Salesperson.Name) { }
                //column(Salesperson; SellToContact."Salesperson Code") { }
                column(Salesperson; HeaderLoop."EOS Salesperson Code") { }
                column(OperatorName; Employee.FullName()) { }
                column(SelltoBuyFromNo; HeaderLoop."EOS Sell-to/Buy-From No.") { }
                column(SellToBuyFromAddr; HeaderLoop.GetSellToBuyFromAddr()) { }
                column(BillToNo; HeaderLoop."EOS Bill-to/Pay-to No.") { }
                //column(BillToAddress; HeaderLoop.GetBillToPayToAddr()) { }
                //column(ShipToAddress; HeaderLoop.GetShipToAddr()) { }                
                column(ShipToAddress; GetShipToFormattedAddress()) { }
                column(BillToAddress; GetBillToFormattedAddress()) { }
                column(CustomerVendorContact; BuyFromContact.Name) { }
                column(SellToContactName; SellToContact.Name) { }
                column(SellToContactPhone; StrSubstNo(Tel, SellToContact."Phone No.")) { }
                column(SellToContactCell; StrSubstNo(Cell, SellToContact."Mobile Phone No.")) { }
                column(SellToContactMail; StrSubstNo(Email, SellToContact."E-Mail")) { }
                column(SellToContactZone; SellToContact."Territory Code") { }
                column(ShipToAddrPhone; StrSubstNo(Tel, ShipToAddressTel)) { }
                column(ShipToAddrMail; StrSubstNo(Email, ShipToAddressMail)) { }
                column(ShipToAddrCell; StrSubstNo(Cell, ShipToAddressCel)) { }
                column(ABI; StrSubstNo(ABILbl, CustomerABI)) { }
                column(CAB; StrSubstNo(CABLbl, CustomerCAB)) { }
                column(CIG; StrSubstNo(CIGLbl, CIG)) { }
                column(CUP; StrSubstNo(CUPLbl, CUP)) { }
                column(customerIBAN; customerIBAN) { }
                column(CustomerBankName; CustomerBankName) { }
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
                column(YourReference; YourReference) { }
                column(OrderDate; HeaderLoop."EOS Order Date") { }
                column(ShipmentDate; HeaderLoop."EOS Shipment Date") { }
                column(ValidTo; HeaderLoop."EOS Valid to") { }
                column(VATExclDeclaration; HeaderLoop."EOS Footer Line") { }
                column(VATLineAmountToPay; HeaderLoop."EOS Amount Including VAT") { }
                column(CstmHdrTxt1; HeaderLoop.GetCustomFieldTextValue('CustomText1')) { }
                column(CstmHdrTxt2; HeaderLoop.GetCustomFieldTextValue('CustomText2')) { }
                column(FormulaPrato; LayoutFormulaPratoBool) { }
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
                column(CstmHdrTxt18Ord; HeaderLoop.GetCustomFieldTextValue('CustomText18')) { }
                column(CstmHdrTxt18Off; TipoSped) { }
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
                column(CstmHdrTxt31; HeaderLoop.GetCustomFieldTextValue('CustomText31')) { }
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
                column(CupCode; CUP) { }
                column(CigCode; CIG) { }
                column(ABICode; ABICode) { }
                column(CABCode; CABCode) { }
                column(IBANCode; IBANCode) { }
                column(BankName; BankName) { }
                column(CurrencyCode; HeaderLoop."EOS Currency Code") { }
                column(QuoteNo; QuoteNo) { }
                column(RequestedDeliveryDate; Format(RequestedDeliveryDate)) { }
                column(PromisedDeliveryDate; Format(PromisedDeliveryDate)) { }
                column(ApprovedBy; ApprovedBy) { }
                column(TipoDocumento; TipoDocumento) { }
                column(DataValidita; Format(DataValidita)) { }
                column(RedattoDa; RedattoDa) { }
                column(PaymentMethodCode; HeaderLoop."EOS Payment Method Code") { }
                column(WorkDescription; OrderHeaderNotes) { }
                column(NascondiPrezzi; NascondiPrezzi) { }
                column(GiornoChiusura; GiornoChiusura) { }

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
                    trigger OnAfterGetRecord()
                    var
                        itemvariant: Record "Item Variant";
                    begin
                        if ImagesSent then begin
                            Clear(HeaderLoop."EOS Header Image");
                            Clear(HeaderLoop."EOS Footer Image");
                        end else
                            ImagesSent := true;

                        ItemVariant.reset;
                        showvariant := false;
                        if itemVariant.get(LineLoop."EOS No.", LineLoop."EOS Variant Code") and (LineLoop."EOS Quantity" <> 0) then begin
                            showvariant := true;
                            if itemvariant.Description <> '' then
                                ItemVariantDesc := itemvariant.Description
                        end;

                        If "EOS Discount Text" = '0' then
                            PercSconto := ''
                        else
                            PercSconto := "EOS Discount Text";

                        // if (LineLoop."EOS type" = LineLoop."EOS type"::" ") and (LineLoop."EOS No." = '') then
                        //     Message(LineLoop."EOS Description");

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
                CustBankAccount: Record "Customer Bank Account";
                SalesHeader: Record "Sales Header";
                Customer: Record Customer;
                ShipToAddress: Record "Ship-to Address";
                lOrderHeaderNoteInStream: InStream;
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

                User.Reset();
                User2.Reset();
                SetupUtente.Reset();

                ApprovedBy := '';
                RedattoDa := '';
                GiornoChiusura := '';

                SalesHeader.SetRange("No.", HeaderLoop."EOS Source ID");
                if SalesHeader.findset then begin
                    CIG := SalesHeader."Fattura Tender Code";
                    CUP := SalesHeader."Fattura Project Code";
                    QuoteNo := SalesHeader."Quote No.";
                    RequestedDeliveryDate := SalesHeader."Requested Delivery Date";
                    PromisedDeliveryDate := SalesHeader."Promised Delivery Date";
                    DataValidita := SalesHeader."Quote Valid Until Date";

                    if HeaderLoop."EOS Order Date" <> 0D then
                        OrderDate := HeaderLoop."EOS Order Date"
                    else
                        OrderDate := SalesHeader."Order Date";

                    if customer.get(SalesHeader."Sell-to Customer No.") then begin
                        CustomerVatNo := Customer."VAT Registration No.";
                    end;

                    ShipToAddress.Reset();
                    ShipToAddress.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                    ShipToAddress.SetRange(Code, SalesHeader."Ship-to Code");
                    if ShipToAddress.FindSet() then begin
                        ShipToAddressTel := ShipToAddress."Phone No.";
                        ShipToAddressMail := ShipToAddress."E-Mail";
                        ShipToAddressCel := ''; //da capire dove recuperarlo
                    end;

                    if HeaderLoop."EOS Shipment Method Code" <> '' then begin
                        if ShipmentMethod.get(HeaderLoop."EOS Shipment Method Code") then
                            ShipmentMethodDesc := ShipmentMethod.Description
                        else
                            ShipmentMethodDesc := HeaderLoop.ShptMethod_GetDescInLanguage()
                    end else begin
                        if SalesHeader."Shipment Method Code" <> '' then
                            if ShipmentMethod.get(SalesHeader."Shipment Method Code") then
                                ShipmentMethodDesc := ShipmentMethod.Description
                    end;

                    SalesHeader.Reset();
                    if SalesHeader.Get(SalesHeader."Document Type"::Order, HeaderLoop."EOS No.") then
                        IsCustomerBank := PrintsManagement.GetBankInformation(HeaderLoop."EOS Bill-to/Pay-to No.", HeaderLoop."EOS Payment Method Code", SalesHeader."EOS Our Bank Account", ABICode, CABCode, IBANCode, BankName)
                    else begin
                        SalesHeader.Reset();
                        if SalesHeader.Get(SalesHeader."Document Type"::Order, HeaderLoop."EOS No.") then;
                        IsCustomerBank := PrintsManagement.GetBankInformation(HeaderLoop."EOS Bill-to/Pay-to No.", HeaderLoop."EOS Payment Method Code", SalesHeader."EOS Our Bank Account", ABICode, CABCode, IBANCode, BankName);
                    end;

                    if SalesHeader."Document Type" = SalesHeader."Document Type"::Quote then begin
                        ReportTitleNew := ReportTitleOff;
                        TipoDocumento := 'Offerta'
                    end
                    else if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
                        ReportTitleNew := ReportTitleOrd;
                        TipoDocumento := 'Ordine'
                    end;

                    if TipoDocumento = 'Offerta' then begin
                        // ---> da rivedere il tipo di spedizione
                        // if SalesHeader."MMA04 Freight Type" = SalesHeader."MMA04 Freight Type"::" " then
                        //     TipoSped := ''
                        // else if SalesHeader."MMA04 Freight Type" = SalesHeader."MMA04 Freight Type"::"Agent Code" then
                        //     TipoSped := 'Vettore'
                        // else if SalesHeader."MMA04 Freight Type" = SalesHeader."MMA04 Freight Type"::"Carriage Consigner" then
                        //     TipoSped := 'Mittente'
                        // else if SalesHeader."MMA04 Freight Type" = SalesHeader."MMA04 Freight Type"::"Carriage Forward" then
                        //     TipoSped := 'Destinatario'
                        // else
                        //     Clear(TipoSped);
                    end;

                    // --> gestione Descrizione lavoro
                    SalesHeader.Calcfields("Work Description");
                    IF SalesHeader."Work Description".HasValue then begin
                        SalesHeader."Work Description".CreateInStream(lOrderHeaderNoteInStream);
                        while not lOrderHeaderNoteInStream.EOS do begin
                            lOrderHeaderNoteInStream.ReadText(OrderHeaderNotes);
                        end;
                    end;
                    // <-- gestione Descrizione lavoro

                    // >>> KF DEBUG-MODE
                    if Debug then
                        SetRecRefForDebugMode(HeaderLoop."EOS Source Table ID", HeaderLoop."EOS Source Subtype", HeaderLoop."EOS Source ID");
                    // <<< KF DEBUG-MODE

                    YourReference := '';

                    SalesHeader.Reset();
                    SalesHeader.Get(HeaderLoop."EOS Source Subtype", HeaderLoop."EOS Source ID");
                    YourReference := HeaderLoop."EOS Your Reference" //+ ' ' + SalesHeader."MMA04 Internal Your Reference"
                    ;
                end;

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
                        CaptionML = ENU = 'Report Setup Code', ITA = 'Cod. setup report';
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
                    field(PrintVATFld; PrintVAT)
                    {
                        CaptionML = ENU = 'Hide VAT', ITA = 'Nascondi IVA';
                        ApplicationArea = All;
                    }
                    field(HidePrices; NascondiPrezzi)
                    {
                        CaptionML = ENU = 'Hide prices', ITA = 'Nascondi prezzi';
                        ApplicationArea = All;
                    }
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
        //label(BillToAddress_Caption; ENU = 'Billing address', ITA = 'Spett.le')
        label(BillToAddress_Caption; ENU = 'Invoice holder', ITA = 'Intestatario fattura')
        label(CustomerVendorContact_Caption; ENU = 'Contact', ITA = 'Contatto')
        label(CustomerVendorMail_Caption; ENU = 'E-Mail', ITA = 'E-Mail')
        label(CustomerVendorNo_Caption; ENU = 'Customer No.', ITA = 'Cod. Cliente')
        label(DocumentNo_Caption; ENU = 'No.', ITA = 'Numero')
        label(FiscalCode_Caption; ENU = 'Fiscal code', ITA = 'Codice Fiscale')
        label(GoodsAppearance_Caption; ENU = 'Goods appearance', ITA = 'Stato Colli')
        label(GrossWeight_Caption; ENU = 'Gross weight', ITA = 'Peso Lordo')
        label(Line_Amount_Caption; ENU = 'Amount', ITA = 'Importo')
        label(Line_Description_Caption; ENU = 'Description', ITA = 'Descrizione')
        label(Line_ItemNo_Caption; ENU = 'No.', ITA = 'Nr')
        label(Line_LineDiscountPerc_Caption; ENU = 'Disc. %', ITA = 'Sconto %')
        label(Line_OrderQuantity_Caption; ENU = 'Order Quantity', ITA = 'Quantità Ordinata')
        label(Line_Quantity_Caption; ENU = 'Q.ty', ITA = 'Q.tà')
        label(Line_ShipmentDate_Caption; ENU = 'Shpt. Date', ITA = 'Data Spedizione')
        label(Line_Type_Descr_Caption; ENU = 'Type', ITA = 'Tipo')
        label(Line_UnitPrice_Caption; ENU = 'Price', ITA = 'Prezzo')
        label(Line_UoM_Caption; ENU = 'UM', ITA = 'UM')
        //label(Line_VATIdentifier_Caption; ENU = 'VAT Code', ITA = 'Cod.Iva')
        label(Line_VATIdentifier_Caption; ENU = 'VAT', ITA = 'IVA')
        label(NetWeightCaption; ENU = 'Net weight', ITA = 'Peso Netto')
        label(NoOfParcels_Caption; ENU = 'No. of Parcels', ITA = 'Num. di colli')
        label(OperatorName_Caption; ENU = 'Contact', ITA = 'Contatto')
        label(OrderDate_Caption; ENU = 'Order Date', ITA = 'Data Ordine')
        label(Our_Bank; ENU = 'Our Bank Account', ITA = 'Banca di canalizzazione')
        label(Page_Caption; ENU = 'Pag.', ITA = 'Pag.')
        label(Payment_Amount_Caption; ENU = 'Amount', ITA = 'Importo')
        label(Payment_DueDate_Caption; ENU = 'Due Date', ITA = 'Data Scadenza')
        label(PaymentMethod_Caption; ENU = 'Payment Method', ITA = 'Metodo di Pagamento')
        label(PaymentTerms_Caption; ENU = 'Payment Terms', ITA = 'Condizioni di Pagamento')
        label(PostingDate_Caption; ENU = 'Date', ITA = 'Data')
        label(Reason_Caption; ENU = 'Transport reason', ITA = 'Causale Trasporto')
        label(ReturnAddr_Caption; ENU = 'Return address', ITA = 'Indirizzo mittente')
        label(Salesperson_Caption; ENU = 'Salesperson', ITA = 'Agente')
        label(ShipmentDate_Caption; ENU = 'Shpt. Date', ITA = 'Data Spedizione')
        //label(ShipToAddress_Caption; ENU = 'Shipping address', ITA = 'Luogo di destinazione')
        label(ShipToAddress_Caption; ENU = 'Delivery point', ITA = 'Punto di consegna')
        label(ShpAgent_Caption; ENU = 'Shipping agent', ITA = 'Vettore')
        label(Agent; ENU = 'Agent', ITA = 'Agente')
        label(Transportedby; ENU = 'Transported by', ITA = 'Trasporto a cura')
        label(ShptBy_Caption; ENU = 'Shpt. by', ITA = 'Vettore')
        label(ShptMethod_Caption; ENU = 'Shipment meth.', ITA = 'Metodo Spedizione')
        label(ShptStart_Caption; ENU = 'Shipment Start', ITA = 'Inizio Spedizione')
        label(SigDriver_Caption; ENU = 'Signature - Driver', ITA = 'Firma Autista')
        label(SigRecipient_Caption; ENU = 'Signature - Recipient', ITA = 'Firma Destinatario')
        label(SigShpAgent_Caption; ENU = 'Signature - Ship. agent', ITA = 'Firma Vettore')
        label(Total_DocumentTotalCaption; ENU = 'Document Total', ITA = 'Totale Documento')
        label(Total_DocumentTotalVatExclCaption; ENU = 'Document Total Vat Excl.', ITA = 'Tot. Documento IVA Esclusa')
        label(Total_NetAmountToPayCaption; ENU = 'Net Amount To Pay', ITA = 'Totale netto da pagare')
        label(Total_TotalAmountCaption; ENU = 'Total VAT', ITA = 'Totale IVA')
        label(Total_TotalBaseCaption; ENU = 'Total Base', ITA = 'Totale Imponibile')
        label(Total_TotalCaption; ENU = 'Total', ITA = 'Totale Importo')
        label(Total_TotalInvDiscCaption; ENU = 'Invoice Discount', ITA = 'Totale Extra Sc')
        label(ValidTo_Caption; ENU = 'Validity', ITA = 'Validità')
        label(VAT_InvDisc_Caption; ENU = 'Inv. Disc.', ITA = 'Scont. Fatt.')
        label(VAT_Line_VATIdentifier_Caption; ENU = 'VAT Code', ITA = 'Codice IVA')
        label(VAT_VATAmount_Caption; ENU = 'Amount', ITA = 'Imponibile')
        label(VAT_VATBase_Caption; ENU = 'Base', ITA = 'Base')
        label(VAT_VATPercent_Caption; ENU = 'VAT %', ITA = '% IVA')
        label(VAT_VATText_Caption; ENU = 'Description', ITA = 'Descrizione')
        label(VATClausesCaption; ENU = 'VAT Additional Info:', ITA = 'Info. IVA')
        label(VATRegNo_Caption; ENU = 'VAT Reg.', ITA = 'P. IVA')
        label(Volume_Caption; ENU = 'Volume', ITA = 'Volume')
        label(YourReference_Caption; ENU = 'Your Reference', ITA = 'Vs. Riferimento')
        label(SalesOrderCaption; ENU = 'Sales Order', ITA = 'Ordine di Vendita')
        label(SalesQuoteCaption; ENU = 'Offer Request', ITA = 'Offerta')
        label(OfferTxt; ENU = 'Dear Mr.', ITA = 'Gentile Sig.')
        label(OfferTxt2; ENU = 'Thank you for your interest in our products and services', ITA = 'La ringraziamo per il suo interesse nei nostri prodotti e servizi')
        label(OfferTxt3; ENU = 'We hereby submit the following offer to you:', ITA = 'Con la presente Le sottoponiamo la seguente offerta:')
        label(Subtitle; ENU = 'QUOTE SPECIFICATIONS', ITA = 'SPECIFICHE OFFERTA')
        label(SubtitleOrder; ENU = 'ORDER SPECIFICATIONS', ITA = 'SPECIFICHE ORDINE')
        label(Stamp; ENU = 'Stamp', ITA = 'Bollo')
        label(CollectionExpenses; ENU = 'Collection Expenses', ITA = 'Spese incasso')
        label(PresumedShipDate; ENU = 'Presumed Shipment Date', ITA = 'SPEDIZIONE PRESUNTA')
        label(OurQuoteNo; ENU = 'Our Offer', ITA = 'NS. OFFERTA')
        label(CustomerNo; ENU = 'CUSTOMER NO.', ITA = 'CODICE CLIENTE')
        label(VatNo; ENU = 'VAT NUMBER', ITA = 'PARTITA IVA')
        label(SupportBanl; ENU = 'SUPPORT BANK', ITA = 'BANCA D''APPOGGIO')
        label(ZoneLbl; ENU = 'ZONE', ITA = 'ZONA')
        //label(ShipMeth; ENU = 'Shipment Method', ITA = 'Porto')//Porto
        label(ShipMeth; ENU = 'Shipment Method', ITA = 'Resa')//Porto
        label(IBANLbl; ENU = 'IBAN', ITA = 'IBAN')
        label(OrderTxt2; ENU = 'Thank you for your purchase order. We hereby confirm this', ITA = 'La ringraziamo per l''ordine di acquisto effettuato. Con la presente confermiamo quanto')
        label(OrderTxt3; ENU = 'previously discussed during the offer. Below are the order details:', ITA = 'precedentemente discusso in sede di offerta. Di seguito i dettagli dell''ordine:')
        label(AddressTxt; ENU = 'Dear', ITA = 'Spett.le')
        label(DateTxt; ENU = 'Date', ITA = 'Data')
        label(OfferNo; ENU = 'Our offer No.', ITA = 'Ns. Offerta')
        label(FooterOrderTxt; ENU = 'Order No.', ITA = 'Num. Ordine')
        label(DescTxt; ENU = 'Description', ITA = 'Descrizione')
        label(UMTxt; ENU = 'U.M.', ITA = 'U.M.')
        label(QtyTxt; ENU = 'Q.ty', ITA = 'Q.tà')
        label(UnitCostTxt; ENU = 'Unit Cost €', ITA = 'Prezzo unitario €')
        label(DiscountTxt; ENU = 'Discount %', ITA = 'Sconto %')
        label(AmountTxt; ENU = 'Amount', ITA = 'Imponibile')
        label(VATTxt; ENU = 'VAT', ITA = 'IVA')
        label(ShippingAddressTxt; ENU = 'Shipping Address', ITA = 'Indirizzo di spedizione')
        label(lbl1; ENU = 'For acceptance', ITA = 'Per Accettazione')
        label(lbl2; ENU = '(Place)', ITA = '(Posto)')
        label(lbl3; ENU = '(Date)', ITA = '(Data)')
        label(lbl4; ENU = '(Customer stamp and signature)', ITA = 'Timbro e firma del cliente')
        label(PageLbl; ENU = 'Page', ITA = 'Pagina')
        label(ExtLbl1; ENU = 'NOTES', ITA = 'ANNOTAZIONI')
        label(CIGCaption; ENU = 'CIG', ITA = 'CIG')
        label(CUPCaption; ENU = 'CUP', ITA = 'CUP')
        //label(YourBankAccountRef_Caption; ENU = 'Our bank references', ITA = 'Ns. Banca d''appoggio')
        //label(BankReference_Caption; ENU = 'Your bank references', ITA = 'Vs. Banca d''appoggio')
        label(BankReference_Caption; ENU = 'Your Bank References', ITA = 'Vs. Riferimenti Bancari')
        label(YourBankAccountRef_Caption; ENU = 'Our Bank References', ITA = 'Ns. Riferimenti Bancari')
        label(CustomerBankReference_Caption; ENU = 'Customer Bank', ITA = 'Banca Cliente')
        label(ABI_Caption; ENU = 'ABI', ITA = 'ABI')
        label(CAB_Caption; ENU = 'CAB', ITA = 'CAB')
        label(Valuta_Caption; ENU = 'Currency', ITA = 'Valuta')
        label(IBAN_Caption; ENU = 'IBAN', ITA = 'IBAN')
        label(AmountVAT_caption; ENU = 'VAT Amount', ITA = 'Importo IVA')
        label(DtRichSped_caption; ENU = 'Requested delivery date', ITA = 'Data consegna richiesta')
        label(DtPrevSped_caption; ENU = 'Promised delivery date', ITA = 'Data consegna promessa')
        label(Zona_caption; ENU = 'Zone', ITA = 'Zona')
        label(RedattoDa_caption; ENU = 'Compiled by', ITA = 'Redatto da')
        label(ApprovatoDa_caption; ENU = 'Approved by', ITA = 'Approvato da')
        label(LuogoData_caption; ENU = 'Place and Date', ITA = 'Luogo e Data')
        label(TimbroFirma_caption; ENU = 'Stamp and signature', ITA = 'Timbro e firma')
        label(Om_caption; ENU = 'Om(*)', ITA = 'Om(*)')
        label(Validita_caption; ENU = 'Validity', ITA = 'Validità')
        label(Note_caption; ENU = 'NOTES:', ITA = 'NOTE:')
        label(Note2_caption; ENU = '(*) SM = Discount on Goods; ID = Company VAT; IC = Customer VAT; SO = Replacement', ITA = '(*) SM = Sconto in Merce; ID = Iva Carico Ditta; IC = Iva Carico Cliente; SO = Sostituzione')
        //label(Note3_caption; ENU = 'For anything not expressly stated, the general conditions of sale of Amelia 3 srl apply', ITA = 'Per quanto non espressamente dichiarato valgono le condizioni generali di vendita Amelia 3 srl')
        label(Note3_caption; ENU = '', ITA = '')
        label(CompanyPIva_caption; ENU = 'P.iva e C.F.', ITA = 'P.iva e C.F.')
        label(CompanyRea_caption; ENU = 'Iscr. cciaa Terni n. rea', ITA = 'Iscr. cciaa Terni n. rea')
        label(IBANCompany_caption; ENU = 'IBAN', ITA = 'IBAN')
        label(Giornochiusura_caption; ENU = 'Closing day', ITA = 'Giorno chiusura')
    }

    trigger OnInitReport()
    var

    begin
        CompanyInfo.get;
        CompanyInfo.CalcFields(Picture);

        RigaCapitaleSociale := CapSocAz_CaptionLbl + ' 10.400,00 ' + InteramenteVersatoLbl;
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

        LineLoop2.Reset();
        if LineLoop2.IsTemporary then
            LineLoop2.DeleteAll();

        AdvancedReportingMngt.PrepareBuffer(DocVariantToPrint, ReportSetupCode, HeaderLoop, LineLoop2, CurrReport.ObjectId(false));
        PrepareLineLoopWithTrackingSpec();

        OnBeforePrintingReport(HeaderLoop, LineLoop, NoOfCopies, LogInteraction, PrintVAT, StopExecution);
        if StopExecution then
            CurrReport.Quit();

        ReportSetup.Get(HeaderLoop."EOS Report Setup Code");
        AdvRptDebug.AddEventLog('OnPreReport', 'Stop', '');
    end;

    trigger OnPostReport()
    var
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

    local procedure SetRecRefForDebugMode(TableID: Integer; DocumentType: Integer; DocumentNo: Code[20])
    var
    begin
        // >>> KF DEBUG-MODE
        case TableID of
            36:
                begin
                    // RecRef.Close();
                    // RecRef.Open(36);
                    // RecRef.Copy(FakeSalesHeader);
                end;
        end;
        // <<< KF DEBUG-MODE
    end;

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
            AdvancedReportingMngt.PrepareBuffer(DocVariantToPrint, ReportSetupCode, HeaderLoop, LineLoop2, CurrReport.ObjectId(false));
            PrepareLineLoopWithTrackingSpec();
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
        end
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
        end
    end;

    local procedure PrepareLineLoopWithTrackingSpec()
    var
        PrintsManagement: Codeunit "UFO03 Prints Management";
        TmpTrackSpec: Record "Tracking Specification" temporary;
        LineLoopComodo: Record "EOS Report Buffer Line" temporary;
        NextLineNo: Integer;
    begin
        // LineLoop.Reset();
        // LineLoop.SetCurrentKey("EOS Line type");
        // LineLoop.SetRange("EOS Line type", LineLoop."EOS Line type"::EOSTrackingLine);
        // if not LineLoop.IsEmpty then
        //     exit;


        NextLineNo := 0;
        LineLoop2.Reset();
        if LineLoop2.FindSet() then
            repeat
                NextLineNo += 10000;
                LineLoop := LineLoop2;
                LineLoop."EOS Line No." := NextLineNo;
                LineLoop.Insert(true);

                if LineLoop."EOS Line type" = LineLoop."EOS Line type"::EOSDocumentLine then begin
                    TmpTrackSpec.Reset();
                    if TmpTrackSpec.IsTemporary then
                        TmpTrackSpec.DeleteAll();

                    PrintsManagement.CollectTrackingFromTrackingSpec(TmpTrackSpec, LineLoop."EOS Source ID", LineLoop."EOS Source Table ID", Lineloop."EOS Source Subtype", LineLoop."EOS Source Line No.");
                    PrintsManagement.CreateTrackingSpecOnLineLoop(TmpTrackSpec, LineLoop, LineLoop2, HeaderLoop."EOS Entry ID", NextLineNo);
                end;
            until LineLoop2.Next() = 0;


        // LineLoop.Reset();
        // if LineLoop.FindSet() then
        //     repeat
        //         LineLoopComodo := LineLoop;
        //         LineLoopComodo.Insert();
        //     until LineLoop.Next() = 0;

        // LineLoop.Reset();
        // LineLoop.SetRange("EOS Line type", LineLoop."EOS Line type"::EOSDocumentLine);
        // if LineLoop.FindSet() then
        //     repeat
        //         LineLoopComodo.Reset();
        //         LineLoopComodo.FindLast();
        //         if LineLoop."EOS Line No." = LineLoopComodo."EOS Line No." then
        //             NextLineNo := LineLoop."EOS Line No." + 10000
        //         else begin
        //             LineLoopComodo.SetCurrentKey("EOS Source Line No.");
        //             LineLoopComodo.SetRange("EOS Source Line No.", LineLoop."EOS Source Line No.");
        //             LineLoopComodo.SetFilter("EOS Line No.", '>%1', LineLoop."EOS Line No.");
        //             if not LineLoopComodo.FindFirst() then begin
        //                 LineLoopComodo.SetRange("EOS Source Line No.");
        //                 LineLoopComodo.FindFirst();
        //             end;
        //             NextLineNo := (LineLoop."EOS Line No." + LineLoopComodo."EOS Line No.") / 2;
        //         end;

        //         PrintsManagement.CollectTrackingFromTrackingSpec(TmpTrackSpec, LineLoop."EOS Source ID", LineLoop."EOS Source Table ID", LineLoop."EOS Source Subtype", LineLoop."EOS Source Line No.");
        //     until LineLoop.Next() = 0;
    end;

    var
        BuyFromContact: Record Contact;
        Employee: Record Employee;
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
        UnknowDocumentToPrintErr: TextConst ENU = 'Report %1 (%2): unable to recognize document to print', ITA = 'Report %1 (%2): impossibile stampare il documento';
        Tel: TextConst ENU = 'Tel.  %1', ITA = 'Tel.  %1';
        Cell: TextConst ENU = 'Cell.  %1', ITA = 'Cell.  %1';
        Email: TextConst ENU = 'Email.  %1', ITA = 'Email.  %1';
        ABILbl: TextConst ENU = 'ABI %1', ITA = 'ABI %1';
        CABLbl: TextConst ENU = 'CAB %1', ITA = 'CAB %1';
        IBANLbl: TextConst ENU = 'IBAN %1', ITA = 'IBAN %1';
        CIGLbl: TextConst ENU = 'CIG %1', ITA = 'CIG %1';
        CUPLbl: TextConst ENU = 'CUP %1', ITA = 'CUP %1';
        CustomerABI: code[5];
        CustomerCAB: Code[5];
        customerIBAN: Code[50];
        ShipToAddressTel: text[30];
        ShipToAddressCel: text[30];
        ShipToAddressMail: Text[80];
        CustomerBankName: Text;
        CustomerVatNo: Text;
        CIG: code[15];
        CUP: code[15];
        Showvariant: boolean;
        ItemVariantDesc: text[100];
        LayoutFormulaPratoBool: Boolean; //mpd+ 
        Debug: Boolean;
        ReportTitleOff: TextConst ENU = 'QUOTE', ITA = 'OFFERTA';
        ReportTitleOrd: TextConst ENU = 'ORDER CONFIRMATION', ITA = 'CONFERMA ORDINE';
        ReportTitleNew: Text;
        ABICode: Code[5];
        CABCode: Code[5];
        IBANCode: Code[50];
        BankName: Text[100];
        QuoteNo: Code[20];
        RequestedDeliveryDate: Date;
        PromisedDeliveryDate: Date;
        ApprovedBy: Code[50];
        TipoDocumento: Text;
        IsCustomerBank: Boolean;
        PrintsManagement: Codeunit "UFO03 Prints Management";
        DataValidita: Date;
        RedattoDa: Code[50];
        PercSconto: Text;
        ShipmentMethod: Record "Shipment Method";
        ShipmentMethodDesc: Text;
        OrderDate: Date;
        TipoSped: Text;
        OrderHeaderNotes: Text;
        LineLoop2: Record "EOS Report Buffer Line" temporary;
        NascondiPrezzi: Boolean;
        YourReference: Text[70];
        CompanyInfo: Record "Company Information";
        RigaCapitaleSociale: Text;
        CapSocAz_CaptionLbl: TextConst ENU = 'Share capital', ITA = 'Cap. Soc.';
        InteramenteVersatoLbl: TextConst ENU = 'fully paid', ITA = 'inter. vers.';
        GiornoChiusura: Text;

}


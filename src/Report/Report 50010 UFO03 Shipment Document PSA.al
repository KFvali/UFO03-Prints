report 50010 "UFO03 Shipment Document PSA"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'R50029_TEST.rdlc';

    CaptionML = ENU = 'Shipment Document PSA', ITA = 'Documento di Trasporto PSA';
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
                column(CopyNo; Number) { }
                column(DocumentNo; HeaderLoop."EOS No.") { }
                column(PostingDate; HeaderLoop."EOS Posting Date") { }
                column(DocumentDate; SalesShipmentHeader."Document Date") { }
                column(Salesperson; Salesperson.Name) { }
                column(Operator; Employee.FullName()) { }
                column(SellToCustNo; HeaderLoop."EOS Sell-to/Buy-From No.") { }
                column(BillToNo; HeaderLoop."EOS Bill-to/Pay-to No.") { }
                column(ShipToCode; HeaderLoop."EOS Ship-to Code") { }
                column(CustomerContact; SellToContact.Name) { }
                column(CustomerEMail; SellToContact."E-Mail") { }
                column(PaymentTerms; HeaderLoop.PaymentTerms_GetDescInLanguage()) { }
                column(PaymentMethod; HeaderLoop.PaymentMethod_GetDescInLanguage()) { }
                column(Reason; HeaderLoop.ReasonCode_GetDescInLanguage()) { }
                column(VATRegNo; HeaderLoop."EOS VAT Registration No.") { }
                column(FiscalCode; HeaderLoop."EOS Fiscal Code") { }
                column(WorkDate; WORKDATE) { }
                column(AddressPosition; Format(ReportSetup."EOS Address Position", 0, 9)) { }
                column(CompanyInfoPicture; CompanyInfo.Picture) { }
                column(ESCMID_ID_TXT; ESCMID_ID) { }
                column(SSH_No; ShipmentNo) { }
                column(TempBlobBMP_Bill; BarcodeString1) { }
                column(TempBlobBMP_SSH_NO; BarcodeString2) { }
                column(Dati_Destinatario; DatiDestinatario) { }
                column(Luogo_Destinatario; LuogoDestinatario) { }
                column(Consegna_Porto; ConsegnaPorto) { }
                column(Punto_riferimento; PuntoRiferimento) { }
                column(Codice_Stab_Cli; CodiceStabCli) { }
                column(NoPackages; NoOfParcels) { }
                column(Shpt_Reason_Code; ShipmentReason) { }
                column(Shpt_reason_Code_Caption; ShipmentReasonCaption) { }
                column(ShippingAgent; ShippingAgent) { }
                column(Sender; Sender) { }
                column(Recipient; Recipient) { }
                column(DayGG; DayGG) { }
                column(MonthMM; MonthMM) { }
                column(YearAAAA; YearAAAA) { }
                column(Hour; Hour) { }
                column(Minutes; Minutes) { }
                column(TempBlobBMP_QR_CODE; BarcodeString3) { }
                column(OrderNo; SalesShipmentHeader."Order No.") { }
                column(OrderDate; SalesShipmentHeader."Order Date") { }
                column(UserFullName; User."Full Name") { }
                column(ReasonCode; HeaderLoop."EOS Reason Code") { }
                column(ReasonCodeSpedizione; SalesShipmentHeader."Reason Code") { }
                column(HeadDispatchOrderNo; ESCMDispatchOrder."No.") { }
                column(DatiDestNome; DatiDestNome) { }
                column(DatiDestIndirizzo; DatiDestIndirizzo) { }
                column(DatiDestPostCode; DatiDestPostCode) { }
                column(DatiDestCity; DatiDestCity) { }
                column(DatiDestCounty; DatiDestCounty) { }
                column(DatiDestCountry; DatiDestCountry) { }
                column(LuogoDestNome; LuogoDestNome) { }
                column(LuogoDestIndirizzo; LuogoDestIndirizzo) { }
                column(LuogoDestPostCode; LuogoDestPostCode) { }
                column(LuogoDestCity; LuogoDestCity) { }
                column(LuogoDestCounty; LuogoDestCounty) { }
                column(LuogoDestCountry; LuogoDestCountry) { }
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
                    //column(Line_LineNo; LineLoop."EOS Line No.") { }
                    column(Line_ItemNo; LineLoop."EOS No.") { }
                    column(Line_Description; LineLoop."EOS Description") { }
                    column(showvariant; showvariant) { }
                    column(Line_ItemVariantNo; LineLoop."EOS Variant Code") { }
                    column(Line_ItemVariantDesc; ItemVariantDesc) { }
                    column(Line_RegNo; PhytoItemRegNo) { }
                    column(Line_Description2; LineLoop."EOS Description 2") { }
                    column(Line_Quantity; LineLoop."EOS Quantity") { DecimalPlaces = 3; }
                    column(Line_UoMCode; CopyStr(LineLoop.GetUdMTraduction(HeaderLoop), 1, 4)) { }
                    //column(Line_LineDiscountPerc; LineLoop."EOS Discount Text") { } 
                    column(Line_LineDiscountPerc; LineLoop."EOS Line Discount %") { }
                    //column(Line_UnitPrice; LineLoop."EOS Unit Price") { DecimalPlaces = 5; }
                    column(Line_UnitPrice; UnitPrice) { DecimalPlaces = 5; }
                    column(Line_Amount; LineLoop."EOS Amount" + LineLoop."EOS Inv. Discount Amount") { }
                    //column(Line_VATIdentifier; LineLoop."EOS VAT Identifier") { }
                    column(Line_VATIdentifier; VATIdentifier) { }
                    column(Line_ShipmentDate; LineLoop."EOS Shipment Date") { }
                    column(Line_Type_Desc; Format(LineLoop."EOS Type")) { }
                    //column(Line_OrderQuantity; LineLoop."EOS Source Line Quantity") { }
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
                    column(CstmLneTxt18D; LineLoop.GetCustomFieldTextValue('CustomText18Dest')) { }
                    column(CstmLneTxt18M; LineLoop.GetCustomFieldTextValue('CustomText18Mit')) { }
                    column(CstmLneTxt18V; LineLoop.GetCustomFieldTextValue('CustomText18Vet')) { }
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
                    dataitem(DispatchOrderPackage; "YAV-DIS Dispatch Order Package")
                    {
                        DataItemLinkReference = LineLoop;
                        DataItemLink = "Document No." = field("EOS Document No."), "Document Line No." = field("EOS Line No.");
                        DataItemTableView = sorting("Line No.");
                        UseTemporary = true;
                        column(Line_LineNo; Counter) { }
                        column(Line_OrderQuantity; SalesOrderLine.Quantity) { }
                        // --> 20260210
                        //column(Line_ItemDesc; RBLine."Item Description") { }
                        //column(Line_ESCMFillingQuantity; SalesShipmentLine."ESCM Filling Quantity") { }
                        //column(Line_ESCMPackageCode; SalesShipmentLine."ESCM Package Code") { }
                        column(Line_Qty_ESCM; Qty_ESCM) { }
                        column(DOP_LineNo; "Line No.") { }
                        column(DOP_FillingQty; "Filling Quantity") { }
                        column(DOP_ItemNo; "Item No.") { }
                        column(DOP_ItemDescription; "Item Description") { }
                        column(DOP_LineCounter; CounterDispOrd) { }
                        column(DOP_UoM; "Unit of Measure Code") { }
                        column(DOP_TotalQty; TotalQty) { }
                        column(DOP_PackageCode; "Package Type Code") { }
                        column(DOP_ItemDesc; ESCMPackage.Description) { }
                        column(DOP_Qty; Qty_ESCM2) { }
                        column(DOP_Helper; "Helper Packages") { }
                        column(DOP_PartnerItemNo; "Partner Item No.") { }
                        column(ItemVisibility; ItemVisibility) { }
                        //column(DOP_LabelNo; "First Goods Label No.") { }
                        column(DOP_DeliveryCallNo; DeliveryCallNo) { }
                        column(DOP_DocEsterno; NoDocEsterno) { }
                        column(DOP_PalletLabelNo; PalletLabelNoSenzaZeri) { }
                        column(DOP_ExpirationDate; DataScadenza) { }
                        column(DOP_LotNo; LotNo) { }
                        column(FirstLabelNo; FirstLabelNoSenzaZeri) { }
                        column(LastLabelNo; LastLabelNoSenzaZeri) { }
                        column(PackageCodeNonPallet; PackageCodeNonPallet) { }

                        trigger OnPreDataItem()
                        var

                        begin
                            DispatchOrderPackage.SetRange("Dispatch Order Type", ESCMDispatchOrderPackage."Dispatch Order Type");
                            DispatchOrderPackage.SetRange("Dispatch Order No.", ESCMDispatchOrderPackage."Dispatch Order No.");
                            DispatchOrderPackage.SetRange("Document Type", ESCMDispatchOrderPackage."Document Type");
                            DispatchOrderPackage.SetRange("Document No.", ESCMDispatchOrderPackage."Document No.");
                            DispatchOrderPackage.SetRange("Document Line No.", ESCMDispatchOrderPackage."Document Line No.");
                        end;

                        trigger OnAfterGetRecord()
                        var
                            c: Codeunit "YAV-DIS Label Mgt.";
                            lESCMDispatchOrderPackage: Record "YAV-DIS Dispatch Order Package";
                            lESCMDispatchOrderPackage2: Record "YAV-DIS Dispatch Order Package";
                        begin
                            CLEAR(TotalQty);
                            CLEAR(Qty_ESCM);
                            CLEAR(ItemVisibility);
                            CLEAR(NoOrdVend);
                            CLEAR(NoOrdVendProg);
                            CLEAR(DataScadenza);
                            CLEAR(LotNo);
                            CLEAR(PalletLabelNo);
                            CLEAR(FirstLabelNo);
                            CLEAR(FirstLabelNoSenzaZeri);
                            CLEAR(LastLabelNo);
                            CLEAR(LastLabelNoSenzaZeri);
                            CLEAR(PalletLabelNoSenzaZeri);

                            IF ((DispatchOrderPackage."Filling Quantity" = 0) AND
                              (DispatchOrderPackage."Package Function" = DispatchOrderPackage."Package Function"::"Shipping Unit")) OR
                              (DispatchOrderPackage."Helper Packages")
                            THEN
                                ItemVisibility := FALSE
                            ELSE
                                ItemVisibility := TRUE;

                            if ((DispatchOrderPackage."Filling Quantity" = 0) and
                              (DispatchOrderPackage."Package Function" = DispatchOrderPackage."Package Function"::"Shipping Unit")) or
                              (DispatchOrderPackage."Helper Packages") then
                                CurrReport.SKIP;

                            CounterDispOrd += 1;

                            if not ESCMPackage.get(DispatchOrderPackage."Package Type Code") then
                                clear(ESCMPackage);

                            Qty_ESCM := DispatchOrderPackage.Quantity;
                            TotalQty := DispatchOrderPackage."Filling Quantity" * Qty_ESCM;

                            CLEAR(Qty_ESCM2);
                            IF DispatchOrderPackage."Carrier Package Link Code" <> '' THEN BEGIN
                                TMPESCMDispatchOrderPackage.INIT;
                                TMPESCMDispatchOrderPackage := DispatchOrderPackage;
                                TMPESCMDispatchOrderPackage.INSERT;

                                TMPESCMDispatchOrderPackage.RESET;
                                TMPESCMDispatchOrderPackage.SETRANGE("Carrier Package Link Code", DispatchOrderPackage."Carrier Package Link Code");
                                IF TMPESCMDispatchOrderPackage.COUNT = 1 THEN
                                    Qty_ESCM2 := Qty_ESCM
                                ELSE
                                    Qty_ESCM2 := 0;
                            END ELSE
                                Qty_ESCM2 := Qty_ESCM;

                            // ESCMLabel.Reset();
                            // ESCMLabel.SetRange("Source Record ID", DispatchOrderPackage.RecordID);
                            // if ESCMLabel.FindFirst() then begin
                            //     LotNo := ESCMLabel."Lot No.";
                            //     DataScadenza := FORMAT(ESCMLabel."Expiration date", 0, '<Day,2>/<Month,2>/<Year4>');
                            //     ESCMLabel.SETRANGE("Dispatch Order Pack. Line No.", DispatchOrderPackage."Line No.");
                            //     IF ESCMLabel.FINDFIRST THEN
                            //         FirstLabelNo := ESCMLabel.Code;
                            //     IF ESCMLabel.FINDLAST THEN
                            //         LastLabelNo := ESCMLabel.Code;
                            // END;

                            FirstLabelNoSenzaZeri := DelChr(FirstLabelNo, '<', '0');
                            LastLabelNoSenzaZeri := DelChr(LastLabelNo, '<', '0');

                            SalesShipmentLine.SetFilter("Document No.", DispatchOrderPackage."Document No.");
                            SalesShipmentLine.SetRange("Line No.", DispatchOrderPackage."Document Line No.");
                            if SalesShipmentLine.findfirst() then begin
                                NoOrdVend := SalesShipmentLine."Order No.";
                                NoOrdVendProg := SalesShipmentLine."Blanket Order No.";
                                DeliveryCallNo := SalesShipmentLine."YAV-AUT Call-Off No.";
                                // --> 20260210
                                //PackageCodeNonPallet := SalesShipmentLine."Package Code";
                                if NoOrdVendProg <> '' then
                                    SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Blanket Order");
                                SalesHeader.setfilter("No.", NoOrdVendProg);
                                if SalesHeader.FindFirst() then begin
                                    NoDocEsterno := SalesHeader."External Document No.";
                                end else if NoOrdVend <> '' then
                                        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                                SalesHeader.setfilter("No.", NoOrdVend);
                                if SalesHeader.FindFirst() then begin
                                    NoDocEsterno := SalesHeader."External Document No.";
                                end;
                            end;

                            lESCMDispatchOrderPackage.SETRANGE("Dispatch Order Type", DispatchOrderPackage."Dispatch Order Type");
                            lESCMDispatchOrderPackage.SETRANGE("Dispatch Order No.", DispatchOrderPackage."Dispatch Order No.");
                            lESCMDispatchOrderPackage.SETRANGE("Document Type", DispatchOrderPackage."Document Type");
                            lESCMDispatchOrderPackage.SETRANGE("Document No.", DispatchOrderPackage."Document No.");
                            lESCMDispatchOrderPackage.SETRANGE("Document Line No.", DispatchOrderPackage."Document Line No.");
                            lESCMDispatchOrderPackage.SETRANGE("Line No.", DispatchOrderPackage."Line No.");
                            lESCMDispatchOrderPackage.SETRANGE("Package Function", DispatchOrderPackage."Package Function"::Element);
                            IF lESCMDispatchOrderPackage.FINDFIRST THEN BEGIN
                                IF lESCMDispatchOrderPackage."Belongs to Line No." <> 0 THEN BEGIN
                                    lESCMDispatchOrderPackage.SETRANGE("Dispatch Order Type", lESCMDispatchOrderPackage."Dispatch Order Type");
                                    lESCMDispatchOrderPackage.SETRANGE("Dispatch Order No.", lESCMDispatchOrderPackage."Dispatch Order No.");
                                    lESCMDispatchOrderPackage2.SETRANGE("Document Type", lESCMDispatchOrderPackage."Document Type");
                                    lESCMDispatchOrderPackage.SETRANGE("Document No.", lESCMDispatchOrderPackage."Document No.");
                                    lESCMDispatchOrderPackage2.SETRANGE("Line No.", lESCMDispatchOrderPackage."Belongs to Line No.");
                                    IF lESCMDispatchOrderPackage2.FINDFIRST THEN BEGIN
                                        lESCMDispatchOrderPackage2.CALCFIELDS("First Goods Label No.");
                                        PalletLabelNo := lESCMDispatchOrderPackage2."First Goods Label No.";
                                        PalletLabelNoSenzaZeri := DELCHR(PalletLabelNo, '<', '0');
                                    END;
                                END;
                            END;
                        end;

                    }

                    trigger OnAfterGetRecord()
                    var
                        SellToCust: Record "Customer";
                        ShiptoAddress: Record "Ship-to Address";
                        OurAccountNo: Text[20];
                    begin
                        // RecordNo += 1;
                        // IF RecordNo > RecordsPerPage THEN BEGIN
                        //     PageNo += 1;
                        //     PageNoReal += 1;
                        //     RecordNo := 1;
                        // END;

                        IF LineLoop."Eos Quantity" = 0 THEN
                            CurrReport.SKIP;

                        IF NOT SalesOrderLine.GET(SalesOrderLine."Document Type"::Order, LineLoop."EOS Order No.", LineLoop."EOS Order Line No.") THEN
                            CLEAR(SalesOrderLine);

                        IF LineLoop."EOS Line Type" = LineLoop."EOS Line Type"::EOSTrackingLine THEN BEGIN
                            LineLoop."EOS Description" := '';
                            IF (LineLoop."EOS Lot No." <> '') AND (LineLoop."EOS Serial No." = '') THEN
                                LineLoop."EOS Description" := COPYSTR(STRSUBSTNO(Text001, LineLoop."EOS Lot No."), 1, MAXSTRLEN(LineLoop."EOS Description"));
                            IF (LineLoop."EOS Serial No." <> '') AND (LineLoop."EOS Lot No." = '') THEN
                                LineLoop."EOS Description" := COPYSTR(STRSUBSTNO(Text002, LineLoop."EOS Serial No."), 1, MAXSTRLEN(LineLoop."EOS Description"));
                            IF (LineLoop."EOS Serial No." <> '') AND (LineLoop."EOS Lot No." <> '') THEN
                                LineLoop."EOS Description" := COPYSTR(STRSUBSTNO(Text003, LineLoop."EOS Lot No.", LineLoop."EOS Serial No."), 1, MAXSTRLEN(LineLoop."EOS Description"));
                        END;

                        CLEAR(SalesShipmentLine);
                        CLEAR(Item);
                        IF SalesShipmentLine.GET(LineLoop."EOS Document No.", LineLoop."EOS Source Line No.") THEN;

                        // IF LineLoop."EOS Type" = LineLoop."EOS Type"::Item THEN
                        //     IF Item.GET(SalesShipmentLine."ESCM Package Code") THEN;

                        CLEAR(Qty_ESCM);
                        CLEAR(ESCMDispatchOrderPackage);
                        ESCMDispatchOrderPackage.RESET;
                        ESCMDispatchOrderPackage.SETRANGE("Dispatch Order Type", ESCMDispatchOrder.Type);
                        ESCMDispatchOrderPackage.SETRANGE("Dispatch Order No.", ESCMDispatchOrder."No.");
                        ESCMDispatchOrderPackage.SETRANGE("Document Type", ESCMDispatchOrderPackage."Document Type"::"Sales Shipment");
                        ESCMDispatchOrderPackage.SETRANGE("Document No.", SalesShipmentLine."Document No.");
                        ESCMDispatchOrderPackage.SETRANGE("Document Line No.", SalesShipmentLine."Line No.");
                        IF ESCMDispatchOrderPackage.FINDFIRST THEN
                            Qty_ESCM := ESCMDispatchOrderPackage.Quantity
                        // ELSE IF SalesShipmentLine."ESCM Filling Quantity" <> 0 THEN
                        //     Qty_ESCM := ROUND(LineLoop."EOS Quantity" / SalesShipmentLine."ESCM Filling Quantity", 1, '=');
                        ;

                        Counter += 1;
                    end;

                }
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
                //column(VATLineBaseTotal; VATLineBaseTotal) { }
                column(VATLineBaseTotal; ROUND(VATLineBaseTotal, 0.01, '=')) { }
                column(VATLineAmountTotal; VATLineAmountTotal) { }
                column(VATLineAmountInclVATTotal; VATLineAmountInclVATTotal) { }
                column(PrintVat; PrintVAT) { }

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
                SellToCust: Record "Customer";
                ShiptoAddress: Record "Ship-to Address";
                OurAccountNo: Text[20];
                BarcodeFontProvider: Interface "Barcode Font Provider";
                BarcodeSymbology: Enum "Barcode Symbology";
                ConfPersonalizationMgt: Codeunit "Conf./Personalization Mgt.";
                UserSettings: Record "User Settings";

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

                if not Location.GET(HeaderLoop."EOS Location Code") THEN
                    Clear(Location);

                if not ReasonCode.GET(HeaderLoop."EOS Reason Code") THEN
                    Clear(ReasonCode);

                if not ShptMethod.GET(HeaderLoop."EOS Shipment Method Code") THEN
                    Clear(ShptMethod);

                if not PaymentMethod.GET(HeaderLoop."EOS Payment Method Code") THEN
                    Clear(PaymentMethod);

                if not PaymentTerms.GET(HeaderLoop."EOS Payment Terms Code") THEN
                    Clear(PaymentTerms);

                if ImagesSent then begin
                    Clear(HeaderLoop."EOS Header Image");
                    Clear(HeaderLoop."EOS Footer Image");
                end else
                    ImagesSent := true;

                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarcodeSymbology := Enum::"Barcode Symbology"::Code39;

                // IF NOT GoodsAppearance.GET(DocShpInfo."Goods Appearance") THEN
                //     Clear(GoodsAppearance);

                IF ShippingAgents.GET(HeaderLoop."EOS Shipping Agent Code") THEN
                    AgentAddress := ShippingAgents.Address;

                IF NOT CurrReport.Preview THEN
                    HeaderLoop.LogInteraction();

                ESCMID_ID := '';
                DatiDestinatario := '';
                LuogoDestinatario := '';
                ConsegnaPorto := '';
                CodiceStabCli := '';
                IF SalesShipmentHeader.GET(HeaderLoop."EOS No.") THEN;

                Clear(DatiDestNome);
                Clear(DatiDestIndirizzo);
                Clear(DatiDestPostCode);
                Clear(DatiDestCity);
                Clear(DatiDestCounty);
                Clear(DatiDestCountry);
                Clear(LuogoDestNome);
                Clear(LuogoDestIndirizzo);
                Clear(LuogoDestPostCode);
                Clear(LuogoDestCity);
                Clear(LuogoDestCounty);
                Clear(LuogoDestCountry);

                LuogoDestNome := SalesShipmentHeader."Ship-to Name" + ' ' + SalesShipmentHeader."Ship-to Name 2";
                LuogoDestIndirizzo := SalesShipmentHeader."Ship-to Address" + ' ' + SalesShipmentHeader."Ship-to Address 2";
                LuogoDestPostCode := SalesShipmentHeader."Ship-to Post Code";
                LuogoDestCity := SalesShipmentHeader."Ship-to City";
                LuogoDestCounty := SalesShipmentHeader."Ship-to County";
                LuogoDestCountry := SalesShipmentHeader."Ship-to Country/Region Code";

                IF ShipmentMethod.GET(SalesShipmentHeader."Shipment Method Code") THEN
                    ConsegnaPorto := ShipmentMethod.Description;

                // IF (SalesShipmentHeader."ESCM Unloading Point" <> '') THEN BEGIN
                //     PuntoRiferimento := COPYSTR(SalesShipmentHeader."ESCM Unloading Point", 1, 5) + '-' +
                // COPYSTR(SalesShipmentHeader."ESCM Unloading Point", (STRLEN(SalesShipmentHeader."ESCM Unloading Point") - 1), 2);
                //     UnloadingPoint := SalesShipmentHeader."ESCM Unloading Point";
                //     UnloadingPlant := SalesShipmentHeader."ESCM Unloading Plant";
                // END;

                CodiceStabCli := SalesShipmentHeader."Ship-to Code";

                IF SalesShipmentHeader."Ship-to Code" <> '' THEN BEGIN
                    // IF ShiptoAddress.GET(SalesShipmentHeader."Sell-to Customer No.", SalesShipmentHeader."Ship-to Code") THEN
                    // IF ShiptoAddress."Our Account No." <> '' THEN
                    //     OurAccountNo := ShiptoAddress."Our Account No.";
                END;
                // IF OurAccountNo <> '' THEN
                //     // GetBarcode(ShiptoAddress."Our Account No.", 1, TempBlobBMP[1]);
                //      ESCMID_ID := ShiptoAddress."Our Account No."
                // ELSE BEGIN
                //     SellToCust.GET(SalesShipmentHeader."Sell-to Customer No.");
                //     SellToCust.TESTFIELD("Our Account No.");
                //     //GetBarcode(SellToCust."Our Account No.", 1, TempBlobBMP[1]);
                //     ESCMID_ID := SellToCust."Our Account No.";
                // END;

                BarcodeString1 := BarcodeFontProvider.EncodeFont(ESCMID_ID, BarcodeSymbology);

                // IF SalesShipmentHeader."ESCM Shipment No." = '' THEN
                //     ShipmentNo := SalesShipmentHeader."No."
                // ELSE
                //     ShipmentNo := SalesShipmentHeader."ESCM Shipment No.";

                //GetBarcode(ShipmentNo, 1, TempBlobBMP[2]);
                BarcodeString2 := BarcodeFontProvider.EncodeFont(ShipmentNo, BarcodeSymbology);

                User.SetRange("User Name", SalesShipmentHeader."User ID");
                IF User.FindFirst() THEN;

                Clear(ShippingAgent);
                Clear(Sender);
                Clear(Recipient);
                Clear(QRCodeString);
                Clear(YearAAAA);
                Clear(MonthMM);
                Clear(DayGG);
                Clear(Hour);
                Clear(Minutes);
                Clear(TimeZoneString);
                Clear(TimeZone);
                Clear(QRCodeYear);
                Clear(QRCodeMonth);
                Clear(QRCodeDay);
                Clear(QRCodeDKParameter);
                Clear(QRCodeTP);
                Clear(QRCodeNM);

                Clear(PortLand);

                // Clear(NetWeight);
                // Clear(GrossWeight);
                // Clear(NoOfParcels);

                Clear(ESCMDispatchOrder);
                // SalesShipmentHeader.CalcFields("ESCM Dispatch Order No.");
                // IF SalesShipmentHeader."ESCM Dispatch Order No." <> '' THEN
                //     IF NOT ESCMDispatchOrder.GET(ESCMDispatchOrder.Type::Outbound, SalesShipmentHeader."ESCM Dispatch Order No.") THEN
                //         Clear(ESCMDispatchOrder);

                DatiDestNome := ESCMDispatchOrder."Our Name" + ' ' + ESCMDispatchOrder."Our Name 2";
                DatiDestIndirizzo := ESCMDispatchOrder."Our Address" + ' ' + ESCMDispatchOrder."Our Address 2";
                DatiDestPostCode := ESCMDispatchOrder."Our Post Code";
                DatiDestCity := ESCMDispatchOrder."Our City";
                DatiDestCounty := ESCMDispatchOrder."Our County";
                DatiDestCountry := ESCMDispatchOrder."Our Country/Region Code";

                // IF ESCMDispatchOrder."Transportation Means Reg. No." <> '' THEN
                //     TargaMezzo := ESCMDispatchOrder."Transportation Means Reg. No."
                // ELSE
                //     TargaMezzo := DocShpInfo."Additional Information";

                // IF ESCMDispatchOrder."Shipping Agent Person Name" <> '' THEN
                //     NomeAutista := ESCMDispatchOrder."Shipping Agent Person Name"
                // ELSE
                //     NomeAutista := DocShpInfo."Additional Notes";

                IF ESCMDispatchOrder."Planned Delivery Datetime" <> 0DT THEN
                    PlannedDeliveryDatetime := FORMAT(ESCMDispatchOrder."Planned Delivery Datetime", 0, '<Day,2>/<Month,2>/<Year4> <Hours24,2>.<Minutes,2>');
                IF ESCMDispatchOrder."Exact Shipment Datetime" <> 0DT THEN
                    ExactDeliveryDateTime := FORMAT(ESCMDispatchOrder."Exact Shipment Datetime", 0, '<Day,2>/<Month,2>/<Year4> <Hours24,2>.<Minutes,2>');

                // ESCMDispatchOrderLine.Reset;
                // ESCMDispatchOrderLine.SetRange("Dispatch Order Type", ESCMDispatchOrder.Type);
                // ESCMDispatchOrderLine.SetRange("Dispatch Order No.", ESCMDispatchOrder."No.");
                // ESCMDispatchOrderLine.SetRange("Document No.", SalesShipmentHeader."No.");
                // ESCMDispatchOrderLine.SetRange("Document Type", ESCMDispatchOrderLine."Document Type"::"Sales Shipment");
                // IF ESCMDispatchOrderLine.FindFirst() THEN BEGIN

                //     IF DocShpInfo."Net Weight" <> 0 THEN
                //         NetWeight := DocShpInfo."Net Weight"
                //     ELSE
                //         NetWeight := ESCMDispatchOrderLine."Total Net Weight";

                //     IF DocShpInfo."Gross Weight" <> 0 THEN
                //         GrossWeight := DocShpInfo."Gross Weight"
                //     ELSE
                //         GrossWeight := ESCMDispatchOrderLine."Total Gross Weight";

                //     IF DocShpInfo."No. of Parcels" <> 0 THEN
                //         NoOfParcels := DocShpInfo."No. of Parcels"
                //     ELSE
                //         NoOfParcels := ESCMDispatchOrderLine."No. of Packages";
                // END;

                // IF DocShpInfo."Shipment Starting Date" <> 0D THEN
                //     YearAAAA := COPYSTR(FORMAT(DATE2DMY(DocShpInfo."Shipment Starting Date", 3)), 3, 2)
                // ELSE
                YearAAAA := COPYSTR(FORMAT(DATE2DMY(SalesShipmentHeader."Shipment Date", 3)), 3, 2);

                // IF DocShpInfo."Shipment Starting Date" <> 0D THEN BEGIN
                //     IF STRLEN(FORMAT(DATE2DMY(DocShpInfo."Shipment Starting Date", 2))) = 1 THEN
                //         MonthMM := '0' + FORMAT(DATE2DMY(DocShpInfo."Shipment Starting Date", 2))
                //     ELSE
                //         MonthMM := FORMAT(DATE2DMY(DocShpInfo."Shipment Starting Date", 2));
                //     IF STRLEN(FORMAT(DATE2DMY(DocShpInfo."Shipment Starting Date", 1))) = 1 THEN
                //         DayGG := '0' + FORMAT(DATE2DMY(DocShpInfo."Shipment Starting Date", 1))
                //     ELSE
                //         DayGG := FORMAT(DATE2DMY(DocShpInfo."Shipment Starting Date", 1));
                // END ELSE BEGIN

                IF STRLEN(FORMAT(DATE2DMY(SalesShipmentHeader."Shipment Date", 2))) = 1 THEN
                    MonthMM := '0' + FORMAT(DATE2DMY(SalesShipmentHeader."Shipment Date", 2))
                ELSE
                    MonthMM := FORMAT(DATE2DMY(SalesShipmentHeader."Shipment Date", 2));
                IF STRLEN(FORMAT(DATE2DMY(SalesShipmentHeader."Shipment Date", 1))) = 1 THEN
                    DayGG := '0' + FORMAT(DATE2DMY(SalesShipmentHeader."Shipment Date", 1))
                ELSE
                    DayGG := FORMAT(DATE2DMY(SalesShipmentHeader."Shipment Date", 1));
                //END;

                if ESCMDispatchOrder."No." <> '' then begin
                    if ESCMTransportationMeans.get(ESCMDispatchOrder."Transportation Means Code") then;

                    if DispatchShipmentMethod.get(ESCMDispatchOrder."Shipment Method Code") then
                        PortLand := DispatchShipmentMethod.Description;
                END ELSE BEGIN
                    IF DispatchShipmentMethod.GET(SalesShipmentHeader."Shipment Method Code") THEN
                        PortLand := DispatchShipmentMethod.Description;
                END;

                // IF DocShpInfo."Shipment by" = DocShpInfo."Shipment by"::"Shipping Agent" THEN
                //     ShippingAgent := 'X';
                // IF DocShpInfo."Shipment by" = DocShpInfo."Shipment by"::Sender THEN
                //     Sender := 'X';
                // IF DocShpInfo."Shipment by" = DocShpInfo."Shipment by"::Recipient THEN
                //     Recipient := 'X';

                UserSettings.Reset();
                if UserSettings.get(User."User Security ID") then
                    IF TimeZone.get(UserSettings."Time Zone") THEN
                        TimeZoneString := COPYSTR(TimeZone."Display Name", 2, 6);

                // IF SalesShipmentHeader."ESCM Unloading Point" <> '' THEN
                //     QRCodeDKParameter := COPYSTR(SalesShipmentHeader."ESCM Unloading Point", STRLEN(SalesShipmentHeader."ESCM Unloading Point") - 1, 2);

                // IF (DocShpInfo."Shipment by" = DocShpInfo."Shipment by"::Recipient) OR (HeaderLoop."EOS Shipping Agent Code" = '10401') THEN
                //     QRCodeTP := 'STD'
                // ELSE
                //     QRCodeTP := 'RCY';

                // IF SalesShipmentHeader."ESCM Shipment No." = '' THEN
                //     QRCodeNM := SalesShipmentHeader."No."
                // ELSE
                //     QRCodeNM := SalesShipmentHeader."ESCM Shipment No.";

                QRCodeDay := DayGG;
                QRCodeMonth := MonthMM;
                QRCodeYear := FORMAT(DATE2DMY(SalesShipmentHeader."Shipment Date", 3));
                Hour := COPYSTR(FORMAT(TIME), 1, 2);
                Minutes := COPYSTR(FORMAT(TIME), 4, 2);

                // IF FORMAT(DocShpInfo."Shipment Starting Time") <> '' THEN BEGIN
                //     Hour := COPYSTR(FORMAT(DocShpInfo."Shipment Starting Time"), 1, 2);
                //     Minutes := COPYSTR(FORMAT(DocShpInfo."Shipment Starting Time"), 4, 2);
                // END;

                QRCodeString := '{"se":"' + ESCMID_ID + '","de":"' //+ SalesShipmentHeader."ESCM Unloading Plant" 
                //+ '","cs":"' + SalesShipmentHeader."ESCM Unloading Plant"
                + '","pc":"' //+ SalesShipmentHeader."ESCM Unloading Plant" 
                + '","nm":"' + QRCodeNM + '","tp":"' + QRCodeTP + '","dt":"'
                + QRCodeYear + QRCodeMonth + QRCodeDay + Hour + Minutes + '","tz":"' + TimeZoneString + '","dk":"' + QRCodeDKParameter + '"}';

                BarcodeString3 := BarcodeFontProvider.EncodeFont(QRCodeString, BarcodeSymbology);
                // GetBarcode(QRCodeString, 4, TempBlobBMP[3]);

                // ShipmentReason := COPYSTR(FORMAT(DocShpInfo."Reason Code"), 1, 3);
                // ShipmentReasonCaption := COPYSTR(FORMAT(DocShpInfo."Reason Code"), 6, STRLEN(FORMAT(DocShpInfo."Reason Code"))); //starting from index 6 to avoid '-' and whitespaces;

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
                    field(HidePrices; NascondiPrezzi)
                    {
                        CaptionML = ENU = 'Hide prices', ITA = 'Nascondi prezzi';
                        ApplicationArea = All;
                    }
                }
            }
        }


    }

    trigger OnInitReport()
    var

    begin
        CompanyInfo.get;
        CompanyInfo.CalcFields(Picture);

        RigaCapitaleSociale := CapSocAz_CaptionLbl + ' 10.400,00 ' + InteramenteVersatoLbl;

        // --> tentativo per immagine di sfondo
        if EOSAdvReportingImages.get('CARTAINT') then
            if EOSAdvReportingImages."EOS Image".HasValue then begin
                TenandMediaHeaderImage.get(EOSAdvReportingImages."EOS Image".MediaId);
                TenandMediaHeaderImage.CalcFields(Content);
            end;

    end;

    trigger OnPreReport()
    var
        AdvancedReportingMngt: Codeunit "EOS Advanced Reporting Mngt";
        AdvRptDebug: Codeunit "EOS AdvRpt Debug";
        PrintsManagement: Codeunit "Prints Management";
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
        ReportID: Integer;
        AdvRptDebug: Codeunit "EOS AdvRpt Debug";
    begin
        AdvRptDebug.AddEventLog('OnPostReport', 'Stop', '');
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
        PrintsManagement: Codeunit "Prints Management";
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
        PrintsManagement: Codeunit "Prints Management";
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

    local procedure GetLineDiscount(RecRef3: RecordRef)
    // ---> preso da Renzini
    var
        FieldRef: FieldRef;
    begin
        // Clear(DocumentLineDiscount);
        // Clear(DocumentLineDiscountValue);
        // If NOT (RecRef3.Number in [37, 113]) then Error('Tabella %1 non gestita', RecRef3.Number);
        // FieldRef := RecRef3.Field(18123705); // <-- numero del campo "EOS Discount Set ID" per tutte le tabelle da stampare
        // DiscountSetEntry.Reset();
        // DiscountSetEntry.SetCurrentKey("Set ID");
        // DiscountSetEntry.SetFilter("Set ID", '%1', FieldRef.Value);
        // IF DiscountSetEntry.FindFirst() THEN
        //     REPEAT
        //         DocumentLineDiscount := DocumentLineDiscount + '+' + FORMAT(DiscountSetEntry.Value);
        //         DocumentLineDiscountValue += DiscountSetEntry."Discount Amount";
        //     UNTIL DiscountSetEntry.NEXT = 0;
        // DocumentLineDiscount := DELSTR(DocumentLineDiscount, 1, 1);
    end;

    var
        OurBankRef: Text[50];
        OurBankRef1: Text[50];
        BuyFromContact: Record Contact;
        Employee: Record Employee;
        TempBlob: Codeunit "Temp Blob";
        //FooterImage: Record TempBlob temporary;
        //HeaderImage: Record TempBlob temporary;
        ReportSetup: Record "EOS Report Setup";
        Salesperson: Record "Salesperson/Purchaser";
        SellToContact: Record Contact;
        // CustomSetup: record "MMA04 Custom Setup"; //iad+ 220421
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
        PrintsManagement: Codeunit "Prints Management";
        LastOrderNo: Code[20];
        Debug: Boolean;
        // RecRef: RecordRef; // recref del debug
        // ReportDebug: Codeunit "MMA03 Report Debug";
        VATIdentifier: Code[20];
        ShipmentMethod: Record "Shipment Method";
        ShipmentMethodDesc: Text;
        ShowTextLicense: Boolean;
        CompanyInfo: Record "Company Information";
        RigaCapitaleSociale: Text;
        CapSocAz_CaptionLbl: TextConst ENU = 'Share capital', ITA = 'Cap. Soc.';
        InteramenteVersatoLbl: TextConst ENU = 'fully paid', ITA = 'inter. vers.';
        NsOrdine: Code[20];
        DataOrdine: date;
        NascondiPrezzi: Boolean;
        SalesShipmentLine: Record "Sales Shipment Line";
        RecRef3: RecordRef;
        SecQuantity: Decimal;
        SecQuantityToPrint: Decimal;
        UnitPrice: Decimal;
        LineDiscount: Decimal;
        LineAmount: Decimal;
        LineQuantity: Decimal;
        LineQuantityToPrint: Decimal;
        SommaImponibilePerDDT: Decimal;
        InvoiceDiscount: Text;
        InvoiceDiscountValue: Decimal;
        InvoiceDiscountInt: Integer;
        DocumentLineDiscount: Text;
        DocumentLineDiscountValue: Decimal;
        NrColliSecchi: Integer;
        NrColliFreschi: Integer;
        NrColliSurgelati: Integer;
        LineUM: Code[10];
        //DiscountSetEntry: Record "EOS037 Discount Set Entry";
        GiornoChiusura: text;
        EOSAdvReportingImages: Record "EOS Adv Reporting Images";
        TenandMediaHeaderImage: Record "Tenant Media";
        Location: Record "Location";
        ShptMethod: Record "Shipment Method";
        GoodsAppearance: Record "Goods Appearance";
        ReasonCode: Record "Reason Code";
        PaymentTerms: Record "Payment Terms";
        PaymentMethod: Record "Payment Method";
        SalesShipmentHeader: Record "Sales shipment header";
        DatiDestNome: text;
        DatiDestIndirizzo: text;
        DatiDestPostCode: text;
        DatiDestCity: text;
        DatiDestCounty: text;
        DatiDestCountry: text;
        LuogoDestNome: text;
        LuogoDestIndirizzo: text;
        LuogoDestPostCode: text;
        LuogoDestCity: text;
        LuogoDestCounty: text;
        LuogoDestCountry: text;
        CodiceStabCli: Code[20];
        ShipmentNo: Code[20];
        ShippingAgents: Record "Shipping Agent";
        ESCMID_ID: text;
        DatiDestinatario: text;
        LuogoDestinatario: text;
        ConsegnaPorto: text;
        ShippingAgent: Code[20];
        Sender: text;
        Recipient: text;
        QRCodeString: text;
        YearAAAA: text;
        MonthMM: text;
        DayGG: text;
        Hour: text;
        Minutes: text;
        TimeZoneString: text;
        TimeZone: Record "Time Zone";
        QRCodeYear: text;
        QRCodeMonth: text;
        QRCodeDay: text;
        QRCodeDKParameter: text;
        QRCodeTP: text;
        QRCodeNM: text;
        PortLand: text;
        NetWeight: text;
        GrossWeight: text;
        NoOfParcels: text;
        AgentAddress: text;
        PuntoRiferimento: text;
        BarcodeString1: Text[250];
        BarcodeString2: Text[250];
        BarcodeString3: Text[250];
        ShipmentReason: text;
        ShipmentReasonCaption: text;
        User: Record User;
        DispatchShipmentMethod: Record "Shipment Method";
        Counter: Integer;
        SalesOrderLine: record "Sales Line";
        Text001: TextConst ITA = 'Nr. lotto %1', ENU = 'Lot No. %1';
        Text002: TextConst ITA = 'Nr. seriale %1', ENU = 'Serial No. %1';
        Text003: TextConst ITA = 'Nr. lotto %1, nr. seriale %2', ENU = 'Lot no. %1, serial no. %2';
        Item: Record Item;
        Qty_ESCM: integer;
        ESCMDispatchOrder: Record "YAV-DIS Dispatch Order";
        ESCMDispatchOrderLine: Record "YAV-DIS Dispatch Order Line";
        ESCMDispatchOrderPackage: record "YAV-DIS Dispatch Order Package";
        ESCMTransportationMeans: record "YAV-DIS Transportation Means";
        ESCMSetup: record "YAV-DIS Setup";
        PlannedDeliveryDatetime: text;
        ExactDeliveryDateTime: text;
        SalesHeader: Record "Sales Header";
        NoDocEsterno: Code[35];
        PalletLabelNo: Code[20];
        ESCMLabel: Record "YAV-LIB Label";
        LotNo: Code[10];
        DataScadenza: Text;
        LabelNo: Code[20];
        FirstLabelNo: Code[20];
        LastLabelNo: Code[20];
        FirstLabelNoSenzaZeri: Code[20];
        LastLabelNoSenzaZeri: Code[20];
        PalletLabelNoSenzaZeri: Code[20];
        UnloadingPoint: Text;
        UnloadingPlant: Text;
        PackageCodeNonPallet: Code[20];
        TMPESCMDispatchOrderPackage: Record "YAV-DIS Dispatch Order Package";
        NoOrdVend: Code[20];
        NoOrdVendProg: Code[20];
        Qty_ESCM2: Integer;
        ItemVisibility: Boolean;
        ESCMPackage: Record "YAV-DIS Package";
        TotalQty: Decimal;
        DeliveryCallNo: Text;
        CounterDispOrd: Integer;
        ESCMLabelEntry: Record "YAV-LIB Label Entry";
}

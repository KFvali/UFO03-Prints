report 50007 "UFO03 Work Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'UFO03 Work Order.rdlc';
    CaptionML = ENU = 'Work order', ITA = 'Ordine di lavoro';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.";
            RequestFilterHeading = 'Sales Order';
            dataitem(PageLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(No1_SalesHeader; "Sales Header"."No.") { }
                column(ShipmentDate_SalesHeader; Format("Sales Header"."Shipment Date")) { }
                column(CompanyName; COMPANYPROPERTY.DisplayName) { }
                column(CustAddr1; CustAddr[1]) { }
                column(CustAddr2; CustAddr[2]) { }
                column(CustAddr3; CustAddr[3]) { }
                column(CustAddr4; CustAddr[4]) { }
                column(CustAddr5; CustAddr[5]) { }
                column(CustAddr6; CustAddr[6]) { }
                column(CustAddr7; CustAddr[7]) { }
                column(CustAddr8; CustAddr[8]) { }
                column(ShipmentDateCaption; ShipmentDateCaptionLbl) { }
                column(SalesOrderNoCaption; SalesOrderNoCaptionLbl) { }
                column(PageNoCaption; PageNoCaptionLbl) { }
                column(WorkOrderCaption; WorkOrderCaptionLbl) { }
                column(DataODV; Format("Sales Header"."Order Date")) { }
                column(DtSpedRich; Format("Sales Header"."Requested Delivery Date")) { }
                column(RedattoDa; ApprovedBy) { }
                column(CustomerNo; "Sales Header"."Sell-to Customer No.") { }
                column(ShipToAddress; GetShipToFormattedAddress()) { }
                column(BillToAddress; GetBillToFormattedAddress()) { }
                column(ContactToAddress; GetContactToFormattedAddress()) { }
                column(CompanyPicture; CompanyInfo.Picture) { }
                column(AdditionalInfo; AdditionalInfo) { }
                column(AdditionalInstr; AdditionalInstr) { }
                column(AdditionalNotes; AdditionalNotes) { }

                dataitem("Sales Line"; "Sales Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = SORTING("Document Type", "Document No.", "Line No."); //where("MMA04 To Prepare - Inventory" = const(true));
                    column(No_SalesLine; "No.") { IncludeCaption = true; }
                    column(Description_SalesLine; Description) { IncludeCaption = true; }
                    column(VarianteNo_SalesLine; "Variant Code") { IncludeCaption = true; }
                    column(VarianteDescription_SalesLine; ItemVariantDesc) { }
                    column(ItemVariantDescLbl; ItemVariantDescLbl) { }
                    column(Quantity_SalesLine; Quantity) { IncludeCaption = true; }
                    column(UnitofMeasure_SalesLine; "Unit of Measure Code") { IncludeCaption = true; }
                    column(Type_SalesLine; Type) { IncludeCaption = true; }
                    column(QtyworkPostSalesOrderCptn; QtyworkPostSalesOrderCptnLbl) { }
                    column(QuantityUsedCaption; QuantityUsedCaptionLbl) { }
                    column(UnitofMeasureCaption; UnitofMeasureCaptionLbl) { }
                    // column(DateTimePrintWorkOrder; "MMA04 D/T Print Work Order") { }
                    // column(ToPrepareInventory; "MMA04 To Prepare - Inventory") { }
                    // column(Prepared; "MMA04 Prepared") { }
                    column(PreparedTxt; preparedTxt) { }
                    column(ShipmentDate; format("Shipment Date")) { }
                    column("QtytoShip"; "Qty. to Ship") { }
                    column(OutstandingQuantity; "Outstanding Quantity") { }
                    column(QtyToBePrepared; QtyToBePrepared) { }
                    //column(WorkOrderPrintdate; StrSubstNo(WorkOrderPrintdateLbl, "MMA04 D/T Print Work Order")) { }
                    column(NrRiga; "Sales Line"."Line No.") { }
                    //column(LotNo; GetLotNo("Sales Line")) { }

                    dataitem("Tmp Name/Value Buffer"; "Name/Value Buffer")
                    {
                        UseTemporary = true;

                        column(Lot_No; "Tmp Name/Value Buffer".Value) { }
                        column(Lot_Qty; LotQty) { }
                        column(Lot_QtyToHandle; LotQtyToHandle) { }

                        trigger OnPreDataItem()
                        var
                        begin
                            "Tmp Name/Value Buffer".Reset();
                            if "Tmp Name/Value Buffer".IsTemporary then
                                "Tmp Name/Value Buffer".DeleteAll();

                            CreateTrackingLines();
                        end;

                        trigger OnAfterGetRecord()
                        var
                            Content: text;
                            JObject: JsonObject;
                            IStream: InStream;
                        begin
                            LotQty := 0;
                            LotQtyToHandle := 0;

                            if "Tmp Name/Value Buffer".Name <> format("Sales Line".RecordId) then
                                exit;

                            "Tmp Name/Value Buffer".CalcFields("Value BLOB");
                            "Tmp Name/Value Buffer"."Value BLOB".CreateInStream(IStream);
                            IStream.Read(Content);
                            JObject.ReadFrom(Content);

                            LotQty := ReadJSonDecimalsForTracking(JObject, JQtyLabel);
                            LotQtyToHandle := ReadJSonDecimalsForTracking(JObject, JQtyToHandleLabel);
                        end;
                    }

                    trigger OnAfterGetRecord()
                    var
                        ItemVariant: Record "Item Variant";
                        showvariant: Boolean;
                    begin
                        ItemVariantDesc := '';
                        if itemVariant.get("No.", "Variant Code")
                        //and ("Quantity" <> 0)
                        then begin
                            //showvariant := true;
                            if itemvariant.Description <> '' then
                                ItemVariantDesc := itemvariant.Description
                            else
                                ItemVariantDesc := '';
                        end;
                        QtyToBePrepared := "Sales Line"."Outstanding Quantity" - "Sales Line"."Qty. to Ship";
                        PreparedTxt := '[   ]';
                    end;
                }
                dataitem("Sales Comment Line"; "Sales Comment Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "No." = FIELD("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = WHERE("Document Line No." = CONST(0));
                    column(Date_SalesCommentLine; Format(Date)) { }
                    column(Code_SalesCommentLine; Code) { IncludeCaption = true; }
                    column(Comment_SalesCommentLine; Comment) { IncludeCaption = true; }
                    column(CommentsCaption; CommentsCaptionLbl) { }
                    column(SalesCommentLineDtCptn; SalesCommentLineDtCptnLbl) { }
                }
                dataitem("Extra Lines"; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(NoCaption; NoCaptionLbl) { }
                    column(DescriptionCaption; DescriptionCaptionLbl) { }
                    column(QuantityCaption; QuantityCaptionLbl) { }
                    column(UnitofMeasureCaptionControl33; UnitofMeasureCaptionControl33Lbl) { }
                    column(DateCaption; DateCaptionLbl) { }
                    column(workPostdItemorResJnlCptn; workPostdItemorResJnlCptnLbl) { }
                    column(TypeCaption; TypeCaptionLbl) { }
                }
            }

            trigger OnAfterGetRecord()
            var
                User: Record User;
                DocShippingInfo: Record "EOS066 Document Shipping Info";
                SetupUtente: Record "User Setup";
            begin
                FormatAddr.SalesHeaderBillTo(CustAddr, "Sales Header");

                // user.Reset();
                // User.SetCurrentKey("User Name");

                // if "Sales Header"."MMA04 Approved By" <> '' then begin
                //     User.SetCurrentKey("User Name");
                //     User.SetFilter("User Name", "Sales Header"."Assigned User ID");
                //     if User.FindSet() then
                //         ApprovedBy := User."Full Name"
                //     else
                //         Clear(ApprovedBy);
                // end;

                ApprovedBy := '';

                // if "Sales Header"."Assigned User ID" <> '' then begin
                //     if SetupUtente.Get("Sales Header"."Assigned User ID") then
                //         ApprovedBy := SetupUtente."MMA04 Shorted Name"
                //     else
                //         Clear(ApprovedBy);
                // end;

                if not DocShippingInfo.Get("Sales Header".SystemId) then;

                if DocShippingInfo."Additional Notes" <> '' then
                    AdditionalNotes := StrSubstNo('%1 %2', AdditionalNotesLbl, DocShippingInfo."Additional Notes")
                else
                    Clear(AdditionalNotes);

                if DocShippingInfo."Additional Instructions" <> '' then
                    AdditionalInstr := StrSubstNo('%1 %2', AdditionalIstrLbl, DocShippingInfo."Additional Instructions")
                else
                    Clear(AdditionalInstr);

                if DocShippingInfo."Additional information" <> '' then
                    AdditionalInfo := StrSubstNo('%1 %2', AdditionalInfoLbl, DocShippingInfo."Additional information")
                else
                    Clear(AdditionalInfo);

            end;
        }
    }

    labels
    {
        label(QtyToBePrepredLbl; ENU = 'Qty to be prepared', ITA = 'Qtà da preparare')
        label(QtyToShipLbl; ENU = 'Qty to Ship', ITA = 'Qtà da spedire')
        label(RemainingQtyToShipLbl; ENU = 'Remaining Qty', ITA = 'Qtà rimanente')
        label(PreparedTxtLbl; ENU = 'Prepared', ITA = 'Preparato')
        label(toprepareLnl; ENU = 'To prepare', ITA = 'Da preparare')
        label(ShipmentDat; ENU = 'Shipment Date', ITA = 'Data spedizione')
        label(LottoLbl; ENU = 'Lot no.', ITA = 'Lotto')
        label(NrRigaLbl; ENU = 'Line no.', ITA = 'Nr. riga')
        label(SpttleLbl; ENU = 'Dear', ITA = 'Spett.le')
        label(LuogoDestLbl; ENU = 'Place of destination', ITA = 'Luogo di destinazione merce')
        label(NumeroODVLbl; ENU = 'ODV no.', ITA = 'Numero ODV')
        label(DataODVLbl; ENU = 'ODV date', ITA = 'Data ODV')
        label(DtSpedRichLbl; ENU = 'Requested delivery date', ITA = 'Data Spedizione Richiesta')
        label(RedattoDaLbl; ENU = 'Compiled by', ITA = 'Redatto da')
        label(CodClienteLbl; ENU = 'Customer No.', ITA = 'Cod. Cliente')
        label(PaginaLbl; ENU = 'Page', ITA = 'Pagina')
        label(ReportTitleLbl; ENU = 'WORK ORDER', ITA = 'ORDINE DI LAVORO')
        label(UMLbl; ENU = 'UOM', ITA = 'UM')
        label(QtyToPrepareLbl; ENU = 'Qty to prepare', ITA = 'Qtà da preparare')
        label(ContactToAddress_Caption; ENU = 'Contact address', ITA = 'Contatto')
    }

    #region TRIGGERS

    trigger OnInitReport()
    var

    begin
        CompanyInfo.Get;
        CompanyInfo.Calcfields(Picture);
    end;

    #endregion TRIGGERS

    #region LOCALS

    local procedure GetBillToFormattedAddress(): Text
    var
        PrintsManagement: Codeunit "AM303 Prints Managment";
    //PostCode: record "Post Code";
    begin
        // PostCode.Reset();
        // if PostCode.Get("Sales Header"."Bill-to Post Code", "Sales Header"."Bill-to City") then;

        exit(PrintsManagement.GetAddressInfo("Sales Header"."Bill-to Name", "Sales Header"."Bill-to Name 2", "Sales Header"."Bill-to Address", "Sales Header"."Bill-to Address 2", "Sales Header"."Bill-to Country/Region Code", "Sales Header"."Bill-to Post Code", "Sales Header"."Bill-to City", "Sales Header"."Bill-to County", '', ''));
    end;

    local procedure GetShipToFormattedAddress(): Text
    var
        PrintsManagement: Codeunit "AM303 Prints Managment";
    //PostCode: Record "Post Code";
    begin
        // PostCode.Reset();
        // if PostCode.Get("Sales Header"."Ship-to Post Code", "Sales Header"."Ship-to City") then;

        exit(PrintsManagement.GetAddressInfo("Sales Header"."Ship-to Name", "Sales Header"."Ship-to Name 2", "Sales Header"."Ship-to Address", "Sales Header"."Ship-to Address 2", "Sales Header"."Ship-to Country/Region Code", "Sales Header"."Ship-to Post Code", "Sales Header"."Ship-to City", "Sales Header"."Ship-to County", '', ''));
    end;

    local procedure GetContactToFormattedAddress(): Text
    var
        PrintsManagement: Codeunit "AM303 Prints Managment";
        //PostCode: Record "Post Code";
        Contact: Record Contact;
        TelLbl: TextConst ENU = 'Phone No.: %1', ITA = 'Tel: %1';
        PhoneNo: text;
    begin
        Contact.Reset();
        if Contact.get("Sales Header"."Sell-to Contact No.") then;

        // PostCode.Reset();
        // if PostCode.Get(Contact."Post Code", Contact.City) then;

        if Contact."Phone No." <> '' then
            PhoneNo := StrSubstNo(TelLbl, Contact."Phone No.")
        else
            Clear(PhoneNo);

        exit(PrintsManagement.GetAddressInfo(Contact.Name, Contact."Name 2", Contact.Address, Contact."Address 2", Contact."Country/Region Code", Contact."Post Code", Contact.City, Contact.County, PhoneNo, ''));
    end;

    #region TRACKING

    local procedure CreateTrackingLines()
    var
        PrintsManagement: Codeunit "AM303 Prints Managment";
        TmpTrackingSpecification: Record "Tracking Specification" temporary;
        TmpReservationEntry: Record "Reservation Entry" temporary;
        ReservationEntry: Record "Reservation Entry";
        Content: Text;
        NewID: Integer;
        OStream: OutStream;
        LotTextString: TextConst ENU = 'Lot No.: %1', ITA = 'Nr. Lotto: %1';
    begin
        PrintsManagement.CollectTrackingFromTrackingSpec(TmpTrackingSpecification, "Sales Line"."Document No.", Database::"Sales Line", "Sales Line"."Document Type".AsInteger(), "Sales Line"."Line No.");
        FilterReservationEntry(ReservationEntry);
        GroupReservationByLot(ReservationEntry, TmpReservationEntry);
        NewID := 0;

        TmpTrackingSpecification.Reset();
        if TmpTrackingSpecification.FindSet() then
            repeat
                NewID += 1;
                "Tmp Name/Value Buffer".Init();
                "Tmp Name/Value Buffer".ID := NewID;
                "Tmp Name/Value Buffer".Name := Format("Sales Line".RecordId);
                "Tmp Name/Value Buffer".Value := Strsubstno(LotTextString, TmpTrackingSpecification."Lot No.");

                Content := CreateTrackingJSon(TmpTrackingSpecification."Quantity (Base)", 0);
                "Tmp Name/Value Buffer"."Value BLOB".CreateOutStream(OStream);
                OStream.WriteText(Content);
                "Tmp Name/Value Buffer".Insert();
            until TmpTrackingSpecification.Next() = 0;

        TmpReservationEntry.Reset();
        if TmpReservationEntry.FindSet() then
            repeat
                NewID += 1;
                "Tmp Name/Value Buffer".Init();
                "Tmp Name/Value Buffer".ID := NewID;
                "Tmp Name/Value Buffer".Name := Format("Sales Line".RecordId);
                "Tmp Name/Value Buffer".Value := Strsubstno(LotTextString, TmpReservationEntry."Lot No.");

                Content := CreateTrackingJSon(TmpReservationEntry."Quantity (Base)" * (-1), TmpReservationEntry."Qty. to Handle (Base)" * (-1));
                "Tmp Name/Value Buffer"."Value BLOB".CreateOutStream(OStream);
                OStream.WriteText(Content);
                "Tmp Name/Value Buffer".Insert();
            until TmpReservationEntry.Next() = 0;
    end;

    local procedure CreateTrackingJSon(pQty: Decimal; pQtyToHandle: Decimal) Content: Text;
    var
        JObject: JsonObject;
    begin
        JObject.Add(JQtyLabel, pQty);
        JObject.Add(JQtyToHandleLabel, pQtyToHandle);
        JObject.WriteTo(Content);
    end;

    local procedure FilterReservationEntry(var pReservationEntry: Record "Reservation Entry")
    var
    begin
        pReservationEntry.Reset();
        pReservationEntry.SetCurrentKey("Source Type", "Source Subtype", "Source ID", "Source Ref. No.",
                                        "Item No.", "Variant Code", "Reservation Status");
        pReservationEntry.SetRange("Source Type", Database::"Sales Line");
        pReservationEntry.SetRange("Source Subtype", "Sales Line"."Document Type");
        pReservationEntry.SetRange("Source ID", "Sales Line"."Document No.");
        pReservationEntry.SetRange("Source Ref. No.", "Sales Line"."Line No.");
        pReservationEntry.SetRange("Item No.", "Sales Line"."No.");
        pReservationEntry.SetRange("Variant Code", "Sales Line"."Variant Code");
        pReservationEntry.SetRange("Reservation Status", pReservationEntry."Reservation Status"::Surplus);
        pReservationEntry.SetFilter("Lot No.", '<>%1', '');
    end;

    local procedure GroupReservationByLot(var pReservationEntry: Record "Reservation Entry"; var pTmpReservationEntry: Record "Reservation Entry")
    var
        NewEntryNo: Integer;
    begin
        pTmpReservationEntry.Reset();
        if pTmpReservationEntry.IsTemporary then
            pTmpReservationEntry.DeleteAll();

        NewEntryNo := 0;

        pReservationEntry.SetCurrentKey("Lot No.");
        if pReservationEntry.FindSet() then
            repeat
                NewEntryNo += 1;
                pReservationEntry.SetRange("Lot No.", pReservationEntry."Lot No.");
                pReservationEntry.CalcSums("Quantity (Base)", "Qty. to Handle (Base)");

                pTmpReservationEntry.Init();
                pTmpReservationEntry."Entry No." := NewEntryNo;
                pTmpReservationEntry."Item No." := pReservationEntry."Item No.";
                pTmpReservationEntry."Lot No." := pReservationEntry."Lot No.";
                pTmpReservationEntry."Quantity (Base)" := pReservationEntry."Quantity (Base)";
                pTmpReservationEntry."Qty. to Handle (Base)" := pReservationEntry."Qty. to Handle (Base)";
                pTmpReservationEntry.Insert();

                pReservationEntry.FindLast();
                pReservationEntry.SetRange("Lot No.");
            until pReservationEntry.Next() = 0;
    end;

    local procedure ReadJSonDecimalsForTracking(pJObject: JsonObject; pJKey: Text) pDecValue: Decimal
    var
        JToken: JsonToken;
        JValue: JsonValue;
    begin
        Clear(JToken);
        Clear(pDecValue);

        pJObject.Get(pJKey, JToken);
        if JToken.IsValue then begin
            JValue := JToken.AsValue();
            pDecValue := JValue.AsDecimal();
        end;
    end;

    #endregion TRACKING

    #endregion LOCALS

    var
        FormatAddr: Codeunit "Format Address";
        CustAddr: array[8] of Text[100];
        ItemVariantDesc: text[100];
        PreparedTxt: text[10];
        QtyToBePrepared: Decimal;
        ShipmentDateCaptionLbl: TextConst ENU = 'Shipment Date', ITA = 'Data spedizione';
        SalesOrderNoCaptionLbl: TextConst ENU = 'Sales Order No.', ITA = 'Nr. ordine vendita';
        PageNoCaptionLbl: TextConst ENU = 'Page', ITA = 'Pag.';
        WorkOrderCaptionLbl: TextConst ENU = 'Work Order', ITA = 'Ordine lavoro';
        QtyworkPostSalesOrderCptnLbl: TextConst ENU = 'Quantity used during work (Posted with the Sales Order)', ITA = 'Quantità utilizzata durante la lavorazione (registrata con l''ordine di vendita)';
        QuantityUsedCaptionLbl: TextConst ENU = 'Quantity Used', ITA = 'Quantità usata';
        UnitofMeasureCaptionLbl: TextConst ENU = 'UOM', ITA = 'UM';
        CommentsCaptionLbl: TextConst ENU = 'Comments', ITA = 'Commenti';
        SalesCommentLineDtCptnLbl: TextConst ENU = 'Date', ITA = 'Data';
        NoCaptionLbl: TextConst ENU = 'No.', ITA = 'Nr.';
        DescriptionCaptionLbl: TextConst ENU = 'Description', ITA = 'Descrizione';
        QuantityCaptionLbl: TextConst ENU = 'Quantity', ITA = 'Quantità';
        UnitofMeasureCaptionControl33Lbl: TextConst ENU = 'UOM', ITA = 'UM';
        DateCaptionLbl: TextConst ENU = 'Date', ITA = 'Data';
        workPostdItemorResJnlCptnLbl: Label 'Extra Item/Resource used during work (Posted with Item or Resource Journals)';
        TypeCaptionLbl: TextConst ENU = 'Type', ITA = 'Tipo';
        ItemVariantDescLbl: TextConst ENU = 'Variant Description', ITA = 'Descrizione variante';
        WorkOrderPrintdateLbl: TextConst ENU = 'Work Order Print date %1', ITA = 'Ordine lavoro data stampa %1';
        CompanyInfo: Record "Company Information";
        ApprovedBy: Text;
        AdditionalNotes: Text;
        AdditionalInstr: Text;
        AdditionalInfo: Text;
        AdditionalInfoLbl: TextConst ENU = 'Additional informations:', ITA = 'Informazioni aggiuntive:';
        AdditionalNotesLbl: TextConst ENU = 'Additional notes:', ITA = 'Note aggiuntive:';
        AdditionalIstrLbl: TextConst ENU = 'Additional instructions:', ITA = 'Istruzioni aggiuntive:';


        LotQty: Decimal;
        LotQtyToHandle: Decimal;
        JQtyLabel: Label 'Quantity';
        JQtyToHandleLabel: Label 'Quantity To Handle';
}


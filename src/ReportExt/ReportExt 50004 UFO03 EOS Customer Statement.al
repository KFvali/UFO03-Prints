reportextension 50004 "UFO03 EOS Customer Statement" extends "EOS Customer Statement"
{
    dataset
    {
        add(CustomerPrint)
        {
            column(CustVAT; CustomerVAT) { }
            column(HeaderImage; TenandMediaHeaderImage.Content) { }
            column(FooterImage; TenantMediaFooterImage.Content) { }
            column(CompanyIban; CompanyInfo.IBAN) { }
            column(CustomerFormatAddress; GetCustomerFormattedAddress()) { }
        }

        modify(CustomerPrint)
        {
            trigger OnAfterAfterGetRecord()
            var
            begin
                CompanyInfo.get;

                if CustomerAppo.get(CustomerPrint."No.") then
                    CustomerVAT := CustomerAppo."VAT Registration No.";

                if EOSAdvReportingImagesHeader.get('UFHEADER') then
                    if EOSAdvReportingImagesHeader."EOS Image".HasValue then begin
                        TenandMediaHeaderImage.get(EOSAdvReportingImagesHeader."EOS Image".MediaId);
                        TenandMediaHeaderImage.CalcFields(Content);
                    end;

                if EOSAdvReportingImagesFooter.get('UFFOOTER') then
                    if EOSAdvReportingImagesFooter."EOS Image".HasValue then begin
                        TenantMediaFooterImage.Get(EOSAdvReportingImagesFooter."EOS Image".MediaId);
                        TenantMediaFooterImage.CalcFields(Content);
                    end;
            end;
        }

        add(DueDetail)
        {
            column(WorkDate; Format(WorkDate())) { }
            column(WorkDateNotFormatted; WorkDate) { }
            column(DataScadenza; Format(DataScadenza)) { }
            column(MetodoPagamento; MetodoPagamento) { }
            column(Scaduto; Scaduto) { }
            column(AScadere; AScadere) { }
            column(ImportoTotalePagare; ImportoTotalePagare) { }
        }

        modify(DueDetail)
        {
            trigger OnAfterAfterGetRecord()
            var
                PaymentMethod: Record "Payment Method";

            begin
                Scaduto := 0;
                AScadere := 0;
                MetodoPagamento := '';

                DataScadenza := TempDueAmountsBuffer[1]."EOS Due Date";

                if TempDueAmountsBuffer[1]."EOS Payment Method" <> '' then begin
                    PaymentMethod.Reset();
                    if PaymentMethod.Get(TempDueAmountsBuffer[1]."EOS Payment Method") then
                        MetodoPagamento := PaymentMethod.Description
                    else
                        Clear(MetodoPagamento);
                end;

                ImportoTotalePagare := TempDueAmountsBuffer[1]."EOS Remaining Amount (LCY)";

                if TempDueAmountsBuffer[1]."EOS Due Date" < WorkDate then
                    Scaduto := TempDueAmountsBuffer[1]."EOS Remaining Amount (LCY)"
                else if TempDueAmountsBuffer[1]."EOS Due Date" >= WorkDate then
                    AScadere := TempDueAmountsBuffer[1]."EOS Remaining Amount (LCY)";
            end;
        }

        add(Detail)
        {
            column(PaymentMethodCode; PaymentMethodCode) { }
        }

        modify(Detail)
        {
            trigger OnAfterAfterGetRecord()
            var
                lSalesInvHeader: Record "Sales Invoice Header";
                lSalesCrMemoHeader: Record "Sales Cr.Memo Header";
                lCustLedgerEntry: Record "Cust. Ledger Entry";
            begin
                PaymentMethodCode := '';

                lCustLedgerEntry.reset;
                // lCustLedgerEntry.SetRange("Entry No.", TempReportingBuffer[1]."EOS Entry No.");
                // if lCustLedgerEntry.FindSet() then
                //     PaymentMethodCode := lCustLedgerEntry."Payment Method Code";
                lCustLedgerEntry.SetCurrentKey("Document No.");
                lCustLedgerEntry.SetRange("Document No.", TempReportingBuffer[1]."EOS Document No.");
                if lCustLedgerEntry.FindSet() then
                    PaymentMethodCode := lCustLedgerEntry."Payment Method Code";

                if PaymentMethodCode = '' then begin
                    if lSalesInvHeader.get(TempReportingBuffer[1]."EOS Document No.") then
                        PaymentMethodCode := lSalesInvHeader."Payment Method Code"
                    else if lSalesCrMemoHeader.get(TempReportingBuffer[1]."EOS Document No.") then
                        PaymentMethodCode := lSalesCrMemoHeader."Payment Method Code"
                end;

            end;

        }
    }

    requestpage
    {
        trigger OnOpenPage()
        begin
            OnlyOpenPrmtr := true;
        end;
    }

    rendering
    {
        layout(CustomerStatement)
        {
            Type = RDLC;
            LayoutFile = 'EOS Customer Statement.rdlc';
        }
    }

    labels
    {
        label(DataReg_Caption; ENU = 'Data reg.', ITA = 'Data reg.')
        label(DataDoc_Caption; ENU = 'Data', ITA = 'Data')
        label(NrDoc_Caption; ENU = 'Numero', ITA = 'Numero')
        label(CodMetodoPagamento_Caption; ENU = 'Cod. metodo pagamento', ITA = 'Cod. metodo pagamento')
        label(MetodoPagamento_Caption; ENU = 'Metodo pagamento', ITA = 'Metodo pagamento')
        label(PartitaIVACli_Caption; ENU = 'Partita IVA:', ITA = 'Partita IVA:')
        label(ReportTitle_Caption; ENU = 'Estratto conto cliente al', ITA = 'Estratto conto cliente al')
        label(Scaduto_Caption; ENU = 'Scaduto', ITA = 'Scaduto')
        label(AScadere_Caption; ENU = 'A scadere', ITA = 'A scadere')
        label(ScrittaSopra1_Caption; ENU = 'Egregio Cliente,', ITA = 'Egregio Cliente,')
        label(ScrittaSopra2_Caption; ENU = 'Seguito controllo contabile non ci risulta pervenuto il pagamento delle fatture sotto riportate.', ITA = 'Seguito controllo contabile non ci risulta pervenuto il pagamento delle fatture sotto riportate.')
        label(ScrittaSopra3_Caption; ENU = 'Le chiediamo gentilmente di provvedere al pagamento tramite bonifico bancario alle seguenti coordinate:', ITA = 'Le chiediamo gentilmente di provvedere al pagamento tramite bonifico bancario alle seguenti coordinate:')
        label(ScrittaSopra4_Caption; ENU = 'intestato ad Amelia 3 S.r.l. oppure rimessa diretta all''agente.', ITA = 'intestato ad Amelia 3 S.r.l. oppure rimessa diretta all''agente.')
        label(ScrittaSotto1_Caption; ENU = 'Qualora abbiate già provveduto al pagamento di quanto indicato ritenete nulla la presente.', ITA = 'Qualora abbiate già provveduto al pagamento di quanto indicato ritenete nulla la presente.')
        label(ScrittaSotto2_Caption; ENU = 'Se riscontrate difformità chiediamo di contattarci ai numeri indicati, grazie.', ITA = 'Se riscontrate difformità chiediamo di contattarci ai numeri indicati, grazie.')

    }

    local procedure GetCustomerFormattedAddress(): Text
    var
        PrintsManagement: Codeunit "UFO03 Prints Managment";
        PostCode: Record "Post Code";
    begin
        PostCode.Reset();
        if PostCode.Get(CustomerPrint."Post Code", CustomerPrint.City) then;

        exit(PrintsManagement.GetAddressInfo(CustomerPrint.Name, CustomerPrint."Name 2", CustomerPrint.Address, CustomerPrint."Address 2", CustomerPrint."Country/Region Code", PostCode.Code, CustomerPrint.City, CustomerPrint.County, '', ''));
    end;


    var
        EOSAdvReportingImagesFooter: Record "EOS Adv Reporting Images";
        EOSAdvReportingImagesHeader: Record "EOS Adv Reporting Images";
        TenandMediaHeaderImage: Record "Tenant Media";
        TenantMediaFooterImage: record "Tenant Media";
        CustomerAppo: Record Customer;
        CustomerVAT: Text[20];
        PaymentMethodCode: Code[10];
        Scaduto: Decimal;
        AScadere: Decimal;
        DataScadenza: Date;
        MetodoPagamento: Text;
        ImportoTotalePagare: Decimal;
        CompanyInfo: Record "Company Information";

}
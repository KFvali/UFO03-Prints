reportextension 50003 "UFO03 Customer Sheet Print" extends "Customer Sheet - Print"
{
    dataset
    {
        add("Cust. Ledger Entry")
        {
            column(Stornato; "Cust. Ledger Entry".Reversed) { }
            column(DataScadenza; Format("Cust. Ledger Entry"."Due Date")) { }
            column(CodMetodoPagamento; MetodoPagamento) { }
        }

        modify("Cust. Ledger Entry")
        {
            trigger OnAfterAfterGetRecord()
            var
                lCreditMemoHeader: Record "Sales Cr.Memo Header";
                lInvoiceHeader: Record "Sales Invoice Header";
            begin
                if "Document Type" = "Document Type"::Invoice then begin
                    if lInvoiceHeader.Get("Document No.") then
                        MetodoPagamento := lInvoiceHeader."Payment Method Code"
                end else if "Document Type" = "Document Type"::Invoice then begin
                    if lCreditMemoHeader.Get("Document No.") then
                        MetodoPagamento := lCreditMemoHeader."Payment Method Code"
                end
            end;
        }
    }

    rendering
    {
        layout(CustomerSheetPrint)
        {
            Type = RDLC;
            LayoutFile = 'Customer Sheet Print.rdlc';
        }
    }

    labels
    {
        label(DataDoc_Caption; ENU = 'Data doc.', ITA = 'Data doc.')
        label(DataReg_Caption; ENU = 'Data reg.', ITA = 'Data reg.')
        label(DataScad_Caption; ENU = 'Data scad.', ITA = 'Data scad.')
        label(NrDocEst_Caption; ENU = 'Nr. doc. esterno', ITA = 'Nr. doc. esterno')
        label(Stornato_Caption; ENU = 'St.', ITA = 'St.')
        label(MetodoPagam_Caption; ENU = 'Metodo', ITA = 'Metodo')

    }

    var
        MetodoPagamento: Code[10];

}
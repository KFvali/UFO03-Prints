reportextension 50001 "UFO03 Vendor Sheet Print" extends "Vendor Sheet - Print"
{
    dataset
    {
        add("Vendor Ledger Entry")
        {
            column(Stornato; "Vendor Ledger Entry".Reversed) { }
            column(DataScadenza; Format("Vendor Ledger Entry"."Due Date")) { }
            column(CodMetodoPagamento; MetodoPagamento) { }
        }

        modify("Vendor Ledger Entry")
        {
            trigger OnAfterAfterGetRecord()
            var
                lCreditMemoHeader: Record "Purch. Cr. Memo Hdr.";
                lInvoiceHeader: Record "Purch. Inv. Header";
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
        layout(VendorSheetPrint)
        {
            Type = RDLC;
            LayoutFile = 'Vendor Sheet Print.rdlc';
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
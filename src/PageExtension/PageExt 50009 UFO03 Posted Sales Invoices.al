pageextension 50009 "UFO03 Posted Sales Invoices" extends "Posted Sales Invoices"
{
    actions
    {
        addafter(Print)
        {
            action(PrintInvoiceDocument)
            {
                ApplicationArea = all;
                CaptionML = ENU = 'Print Invoice - FD', ITA = 'Stampa Fattura - FD';
                Image = PrintVAT;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Category6;

                trigger OnAction()
                var
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                    InvoiceDocumentFD: Report "UFO03 Invoice Document - FD";
                begin
                    SalesInvoiceHeader.Reset();
                    SalesInvoiceHeader.Get(Rec.RecordId);
                    SalesInvoiceHeader.SetRecFilter();

                    InvoiceDocumentFD.SetTableView(SalesInvoiceHeader);
                    InvoiceDocumentFD.Run();
                end;
            }
        }
    }
}
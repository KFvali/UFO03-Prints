namespace Keyfor.UFO03.Prints;

using Microsoft.Sales.History;

pageextension 50006 "Posted Sales Invoice" extends "Posted Sales Invoice"
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
                PromotedCategory = Category7;

                trigger OnAction()
                var
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                    InvoiceDocumentFD: Report "Invoice Document - FD";
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
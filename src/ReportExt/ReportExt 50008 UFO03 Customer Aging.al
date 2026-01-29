reportextension 50008 "UFO03 Customer Aging" extends "EOS Customer Aging"
{
    dataset
    {
        add(Detail)
        {
            column(OnHold; OnHold(TempReportingBuffer."EOS Document No.")) { }
        }
    }


    rendering
    {
        layout(CustomerAging)
        {
            Type = RDLC;
            LayoutFile = 'UFO03 Customer Aging.rdlc';
        }
    }

    labels
    {
        label(OnHold_Caption; ENU = 'On Hold', ITA = 'Sosp.')
    }

    local procedure OnHold(DocNo: Code[20]): text[3];
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.reset;
        if DetailLevelPrmtr = DetailLevelPrmtr::Duedates then begin
            CustLedgerEntry.SetCurrentKey("Document No.", "Due Date");
            CustLedgerEntry.SetFilter("Document No.", DocNo);
            CustLedgerEntry.SetFilter("Due Date", '=%1', TempReportingBuffer."EOS Due Date");
            if CustLedgerEntry.FindFirst then
                exit(CustLedgerEntry."On Hold");
        end else if DetailLevelPrmtr = DetailLevelPrmtr::Document then begin
            CustLedgerEntry.SetCurrentKey("Document No.", "On Hold");
            CustLedgerEntry.SetFilter("Document No.", DocNo);
            CustLedgerEntry.SetFilter("On Hold", '=%1', 'SI');
            if CustLedgerEntry.FindFirst then
                exit(CustLedgerEntry."On Hold")
        end;
    end;

}
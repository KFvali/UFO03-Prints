reportextension 50009 "UFO03 Vendor Aging" extends "EOS Vendor Aging"
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
        layout(VendorAging)
        {
            Type = RDLC;
            LayoutFile = 'UFO03 Vendor Aging.rdlc';
        }
    }

    labels
    {
        label(OnHold_Caption; ENU = 'On Hold', ITA = 'Sosp.')
    }

    local procedure OnHold(DocNo: Code[20]): text[3];
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        VendorLedgerEntry.reset;

        if DetailLevelPrmtr = DetailLevelPrmtr::Duedates then begin
            VendorLedgerEntry.SetCurrentKey("Document No.", "Due Date");
            VendorLedgerEntry.SetFilter("Document No.", DocNo);
            VendorLedgerEntry.SetFilter("Due Date", '=%1', TempReportingBuffer."EOS Due Date");
            if VendorLedgerEntry.FindFirst then
                exit(VendorLedgerEntry."On Hold");
        end else if DetailLevelPrmtr = DetailLevelPrmtr::Document then begin
            VendorLedgerEntry.SetCurrentKey("Document No.", "On Hold");
            VendorLedgerEntry.SetFilter("Document No.", DocNo);
            VendorLedgerEntry.SetFilter("On Hold", '=%1', 'SI');
            if VendorLedgerEntry.FindFirst then
                exit(VendorLedgerEntry."On Hold")
        end;
    end;
}
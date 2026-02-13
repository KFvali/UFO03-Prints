namespace Keyfor.UFO03.Prints;

using Microsoft.Purchases.Payables;
using Microsoft.Purchases.Comment;

reportextension 50009 "Vendor Aging" extends "EOS Vendor Aging"
{
    dataset
    {
        add(Detail)
        {
            column(OnHold; OnHold(TempReportingBuffer."EOS Document No.")) { }
            column(LineComments; LineComment()) { }
            column(ShowComment; ShowComment) { }
        }
    }
    requestpage
    {
        layout
        {
            addlast(Content)
            {
                field(ShowComment; ShowComment)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Show comments', ITA = 'Mostra commenti';
                }
            }
        }

    }

    rendering
    {
        layout(VendorAging)
        {
            Type = RDLC;
            LayoutFile = 'Vendor Aging.rdlc';
        }
    }

    labels
    {
        label(OnHold_Caption; ENU = 'On Hold', ITA = 'Sosp.')
        label(LineComment_Caption; ENU = 'Notes:', ITA = 'Note:')
        label(Fornitore_Caption; ENU = 'Vend.', ITA = 'Forn.')
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

    local procedure LineComment(): Text;
    var
        lPurchCommentLine: Record "Purch. Comment Line";
        ReturnTxt: text;
    begin
        if DetailLevelPrmtr <> DetailLevelPrmtr::Vendor then begin
            lPurchCommentLine.Reset();
            lPurchCommentLine.SetFilter("No.", TempReportingBuffer."EOS Document No.");
            if lPurchCommentLine.FindFirst() then begin
                repeat
                    ReturnTxt := ReturnTxt + ' | ' + lPurchCommentLine.Comment;
                until lPurchCommentLine.Next = 0;
                ReturnTxt := DelStr(ReturnTxt, 1, 2);
                exit(ReturnTxt);
            end;
        end;
    end;

    var
        ShowComment: Boolean;

}
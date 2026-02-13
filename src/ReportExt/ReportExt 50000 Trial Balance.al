namespace Keyfor.UFO03.Prints;

using Microsoft.Finance.GeneralLedger.Reports;

reportextension 50000 "Trial Balance" extends "Trial Balance"
{
    dataset
    {
        add(Integer)
        {
            column(ControllaZeri; ControllaZeri) { }
        }
        modify(Integer)
        {
            trigger OnAfterAfterGetRecord()
            var

            begin
                if RigheAZero then GetSum();
            end;
        }
    }

    requestpage
    {
        layout
        {
            addlast(Content)
            {
                field(RigheAZero; RigheAZero)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Hide zero lines', ITA = 'Nascondi righe a zero';
                }
            }
        }

        trigger OnOpenPage()
        var
        begin
            RigheAZero := true;
        end;

    }

    rendering
    {
        layout(TrialBalance)
        {
            Type = RDLC;
            LayoutFile = 'Trial Balance.rdlc';
        }

    }

    local procedure GetSum()
    var

    begin
        if ("G/L Account"."Net Change" = 0) or ("G/L Account"."Balance at Date" = 0) then
            ControllaZeri := true
        else
            ControllaZeri := false;
    end;

    var
        RigheAZero: Boolean;
        ControllaZeri: Boolean;
}
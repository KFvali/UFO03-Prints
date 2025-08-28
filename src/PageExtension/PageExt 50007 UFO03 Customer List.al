pageextension 50007 "UFO03 Customer List" extends "Customer List"
{
    actions
    {

        addlast(reporting)
        {
            action(PrintStatementCVS)
            {
                ApplicationArea = all;
                CaptionML = ENU = 'EOS Customer Statement', ITA = 'Estratto conto (CVS)';
                Image = PrintExcise;
                Promoted = true;
                PromotedIsBig = true;
                Scope = Repeater;

                trigger OnAction()
                var
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(Report::"EOS Customer Statement", true, false, Rec);
                end;
            }
        }

    }
}
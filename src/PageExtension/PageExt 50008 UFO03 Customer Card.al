pageextension 50008 "UFO03 Customer Card" extends "Customer Card"
{
    actions
    {
        modify("Report Statement")
        {
            Visible = false;
        }

        addafter("Report Customer Detailed Aging")
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

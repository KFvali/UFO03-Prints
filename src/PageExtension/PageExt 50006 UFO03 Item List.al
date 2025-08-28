pageextension 50006 "UFO03 Item List" extends "Item List"
{
    actions
    {
        addlast(processing)
        {
            action(PrintBarcodeLabel)
            {
                ApplicationArea = all;
                CaptionML = ENU = 'Print Barcode Label', ITA = 'Stampa Etichetta Barcode';
                Image = BarCode;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Scope = Repeater;

                trigger OnAction()
                var
                    MenuTxt001: TextConst ENU = 'Barcode 50x30,Frontal 60x35,Exit', ITA = 'Barcode 50x30,Frontalino 60x35,Annulla';
                begin
                    Rec.SetRange("No.", Rec."No.");

                    case StrMenu(MenuTxt001, 3) of
                        1:
                            Report.Run(Report::"UFO03 Barcode Label", true, false, Rec);

                        2:
                            Report.Run(Report::"UFO03 Frontalino barcode label", true, false, Rec);
                    end;

                    Rec.Reset();
                end;
            }
        }
    }
}
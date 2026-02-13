namespace Keyfor.UFO03.Prints;

using Microsoft.Finance.GeneralLedger.Reports;
using Microsoft.Finance.GeneralLedger.Ledger;

reportextension 50002 "Account Book Sheet" extends "Account Book Sheet - Print"
{
    dataset
    {
        add("G/L Account")
        {
            column(DataStampa; Format(TODAY, 1, '<Day,2>/<Month,2>/<Year>')) { }
        }

        add("GL Book Entry")
        {
            column(Stornato; Stornato) { }
        }

        modify("GL Book Entry")
        {
            trigger OnAfterAfterGetRecord()
            var

            begin
                GLEntry.Reset();
                GLEntry.SetCurrentKey("Document No.");
                GLEntry.SetFilter("Document No.", "GL Book Entry"."Document No.");
                if GLEntry.FindFirst() then
                    Stornato := GLEntry.Reversed;
            end;
        }

    }

    rendering
    {
        layout(AccountBookSheet)
        {
            Type = RDLC;
            LayoutFile = 'Account Book Sheet.rdlc';
        }
    }

    labels
    {
        label(DataDoc_Caption; ENU = 'Data doc.', ITA = 'Data doc.')
        label(DataReg_Caption; ENU = 'Data reg.', ITA = 'Data reg.')
        label(NrDocEst_Caption; ENU = 'Nr. doc. esterno', ITA = 'Nr. doc. esterno')
        label(Stornato_Caption; ENU = 'St.', ITA = 'St.')
    }

    var
        GLEntry: Record "G/L Entry";
        Stornato: Boolean;

}
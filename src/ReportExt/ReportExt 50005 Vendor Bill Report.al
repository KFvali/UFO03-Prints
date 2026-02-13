namespace Keyfor.UFO03.Prints;

using Microsoft.Purchases.Vendor;
using Microsoft.Bank.Payment;

reportextension 50005 "Vendor Bill Report" extends "Vendor Bill Report"
{
    dataset
    {
        add("Vendor Bill Line")
        {
            column(VendIBAN; VendIBAN) { }
        }

        modify("Vendor Bill Line")
        {
            trigger OnAfterAfterGetRecord()
            var
            begin
                VendIBAN := '';

                if VendBankAccIBAN.Get("Vendor No.", "Vendor Bank Acc. No.") then
                    VendIBAN := VendBankAccIBAN.IBAN;
            end;
        }
    }

    rendering
    {
        layout(VendorBillReport)
        {
            Type = RDLC;
            LayoutFile = 'Vendor Bill Report.rdlc';
        }
    }

    labels
    {
        label(VendIBANLbl; ENU = 'Vendor IBAN', ITA = 'IBAN fornitore')
    }

    var
        VendBankAccIBAN: Record "Vendor Bank Account";
        VendIBAN: Code[50];

}
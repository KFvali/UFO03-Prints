namespace Keyfor.UFO03.Prints;

using Microsoft.Purchases.Vendor;
using Microsoft.Bank.Payment;

reportextension 50006 "Issued Vendor Bill List" extends "Issued Vendor Bill List"
{
    dataset
    {
        add("Posted Vendor Bill Line")
        {
            column(VendIBAN; VendIBAN) { }
        }

        modify("Posted Vendor Bill Line")
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
        layout(IssuedVendorBillList)
        {
            Type = RDLC;
            LayoutFile = 'Issued Vendor Bill List.rdlc';
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
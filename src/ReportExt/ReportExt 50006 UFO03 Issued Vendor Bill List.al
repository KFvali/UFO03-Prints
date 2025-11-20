reportextension 50006 "UFO03 Issued Vendor Bill List" extends "Issued Vendor Bill List"
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
            LayoutFile = 'UFO03 Issued Vendor Bill List.rdlc';
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
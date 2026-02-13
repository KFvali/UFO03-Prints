namespace Keyfor.UFO03.Prints;

using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;
using Microsoft.Sales.History;
using Microsoft.Sales.Archive;
using Microsoft.Sales.Receivables;
using Microsoft.Sales.Comment;
using Microsoft.Sales.Reports;
using Microsoft.Service.Document;
using Microsoft.Service.History;
using Microsoft.Purchases.History;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.Reports;
using Microsoft.Purchases.Payables;
using Microsoft.Purchases.Archive;
using Microsoft.Purchases.Vendor;
using Microsoft.Bank.BankAccount;
using Microsoft.Bank.Payment;
using Microsoft.Foundation.PaymentTerms;
using Microsoft.Foundation.Company;
using Microsoft.Foundation.Shipping;
using Microsoft.Foundation.Comment;
using Microsoft.Foundation.Auditcodes;
using Microsoft.Foundation.Address;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Transfer;
using Microsoft.Inventory.Tracking;
using Microsoft.Inventory.Location;
using Microsoft.Inventory.Item.Catalog;
using Microsoft.Finance.VAT.Clause;
using Microsoft.Finance.VAT.Setup;
using Microsoft.Finance.GeneralLedger.Reports;
using Microsoft.Finance.GeneralLedger.Ledger;
using Microsoft.CRM.Team;
using Microsoft.CRM.Contact;
using Microsoft.Utilities;
using Microsoft.Pricing.PriceList;
using Microsoft.HumanResources.Employee;
using System.Environment;
using System.Security.AccessControl;
using System.Security.User;
using System.Utilities;
using System.Text;
using System.Datetime;
using System.Environment.Configuration;

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
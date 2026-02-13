namespace Keyfor.UFO03.Prints;

using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;
using Microsoft.Sales.History;
using Microsoft.Sales.Archive;
using Microsoft.Sales.Receivables;
using Microsoft.Sales.Comment;
using Microsoft.Service.Document;
using Microsoft.Service.History;
using Microsoft.Purchases.History;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.Reports;
using Microsoft.Purchases.Payables;
using Microsoft.Purchases.Archive;
using Microsoft.Purchases.Vendor;
using Microsoft.Bank.BankAccount;
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
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
using Microsoft.FixedAssets.Reports;
using Microsoft.FixedAssets.Depreciation;
using Microsoft.FixedAssets.FixedAsset;
using Microsoft.FixedAssets.Setup;
using System.Environment;
using System.Security.AccessControl;
using System.Security.User;
using System.Utilities;
using System.Text;
using System.Datetime;
using System.Environment.Configuration;

reportextension 50008 "Customer Aging" extends "EOS Customer Aging"
{
    dataset
    {
        add(Detail)
        {
            column(OnHold; OnHold(TempReportingBuffer."EOS Document No.")) { }
        }
    }


    rendering
    {
        layout(CustomerAging)
        {
            Type = RDLC;
            LayoutFile = 'Customer Aging.rdlc';
        }
    }

    labels
    {
        label(OnHold_Caption; ENU = 'On Hold', ITA = 'Sosp.')
    }

    local procedure OnHold(DocNo: Code[20]): text[3];
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.reset;
        if DetailLevelPrmtr = DetailLevelPrmtr::Duedates then begin
            CustLedgerEntry.SetCurrentKey("Document No.", "Due Date");
            CustLedgerEntry.SetFilter("Document No.", DocNo);
            CustLedgerEntry.SetFilter("Due Date", '=%1', TempReportingBuffer."EOS Due Date");
            if CustLedgerEntry.FindFirst then
                exit(CustLedgerEntry."On Hold");
        end else if DetailLevelPrmtr = DetailLevelPrmtr::Document then begin
            CustLedgerEntry.SetCurrentKey("Document No.", "On Hold");
            CustLedgerEntry.SetFilter("Document No.", DocNo);
            CustLedgerEntry.SetFilter("On Hold", '=%1', 'SI');
            if CustLedgerEntry.FindFirst then
                exit(CustLedgerEntry."On Hold")
        end;
    end;

}
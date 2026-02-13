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

reportextension 50003 "Customer Sheet Print" extends "Customer Sheet - Print"
{
    dataset
    {
        add("Cust. Ledger Entry")
        {
            column(Stornato; "Cust. Ledger Entry".Reversed) { }
            column(DataScadenza; Format("Cust. Ledger Entry"."Due Date")) { }
            column(CodMetodoPagamento; MetodoPagamento) { }
        }

        modify("Cust. Ledger Entry")
        {
            trigger OnAfterAfterGetRecord()
            var
                lCreditMemoHeader: Record "Sales Cr.Memo Header";
                lInvoiceHeader: Record "Sales Invoice Header";
            begin
                if "Document Type" = "Document Type"::Invoice then begin
                    if lInvoiceHeader.Get("Document No.") then
                        MetodoPagamento := lInvoiceHeader."Payment Method Code"
                end else if "Document Type" = "Document Type"::Invoice then begin
                    if lCreditMemoHeader.Get("Document No.") then
                        MetodoPagamento := lCreditMemoHeader."Payment Method Code"
                end
            end;
        }
    }

    rendering
    {
        layout(CustomerSheetPrint)
        {
            Type = RDLC;
            LayoutFile = 'Customer Sheet Print.rdlc';
        }
    }

    labels
    {
        label(DataDoc_Caption; ENU = 'Data doc.', ITA = 'Data doc.')
        label(DataReg_Caption; ENU = 'Data reg.', ITA = 'Data reg.')
        label(DataScad_Caption; ENU = 'Data scad.', ITA = 'Data scad.')
        label(NrDocEst_Caption; ENU = 'Nr. doc. esterno', ITA = 'Nr. doc. esterno')
        label(Stornato_Caption; ENU = 'St.', ITA = 'St.')
        label(MetodoPagam_Caption; ENU = 'Metodo', ITA = 'Metodo')

    }

    var
        MetodoPagamento: Code[10];

}
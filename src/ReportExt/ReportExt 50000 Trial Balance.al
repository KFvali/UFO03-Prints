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

reportextension 50000 "Trial Balance" extends "Trial Balance"
{
    dataset
    {
        add(Integer)
        {
            column(ControllaZeri; ControllaZeri) { }
        }
        modify(Integer)
        {
            trigger OnAfterAfterGetRecord()
            var

            begin
                if RigheAZero then GetSum();
            end;
        }
    }

    requestpage
    {
        layout
        {
            addlast(Content)
            {
                field(RigheAZero; RigheAZero)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Hide zero lines', ITA = 'Nascondi righe a zero';
                }
            }
        }

        trigger OnOpenPage()
        var
        begin
            RigheAZero := true;
        end;

    }

    rendering
    {
        layout(TrialBalance)
        {
            Type = RDLC;
            LayoutFile = 'Trial Balance.rdlc';
        }

    }

    local procedure GetSum()
    var

    begin
        if ("G/L Account"."Net Change" = 0) or ("G/L Account"."Balance at Date" = 0) then
            ControllaZeri := true
        else
            ControllaZeri := false;
    end;

    var
        RigheAZero: Boolean;
        ControllaZeri: Boolean;
}
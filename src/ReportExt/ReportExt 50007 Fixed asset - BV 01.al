namespace Keyfor.UFO03.Prints;

using Microsoft.FixedAssets.Reports;
using Microsoft.FixedAssets.Depreciation;
using Microsoft.FixedAssets.FixedAsset;
using Microsoft.FixedAssets.Setup;

reportextension 50007 "Fixed asset - BV 01" extends "Fixed Asset - Book Value 01"
{
    dataset
    {
        add("Fixed asset")
        {
            column(TabAmm; TabAmm) { }
            column(Component_Main_Asset; "Component of Main Asset") { }
            column(FixedAssetDesc; FixedAssetDesc) { }
            column(FaSubClassDescr; FaSubClassDescr) { }
        }

        modify("Fixed asset")
        {

            trigger OnAfterAfterGetRecord()
            var
                lFixedAsset: Record "Fixed Asset";
                lFASubclass: Record "FA Subclass";
            begin
                Clear(TabAmm);
                TabAmm := GetDeprTableCode("Fixed Asset"."No.");

                FixedAssetDesc := '';
                lFixedAsset.reset;
                If lFixedAsset.get("Fixed Asset"."Component of Main Asset") then
                    FixedAssetDesc := lFixedAsset.Description;

                FaSubClassDescr := '';
                lFASubclass.Reset();
                if lFASubclass.get("Fixed Asset"."FA Subclass Code") then
                    FaSubClassDescr := lFASubclass.Name;

            end;
        }
    }

    rendering
    {
        layout("Fixed Asset - Book Value 01")
        {
            Type = RDLC;
            LayoutFile = 'Fixed asset - BV 01.rdlc';
        }
    }

    labels
    {
        label(TabAmm_Caption; ENU = 'Tab. Amm.', ITA = 'Tab. Amm.')
        label(Totale_Caption; ENU = 'Totale per componente bene principale', ITA = 'Totale per componente bene principale')
    }

    var
        TabAmm: Code[10];
        SubclassDescr: Text;
        FixedAssetDesc: Text;
        FaSubClassDescr: Text;

    local procedure GetDeprTableCode(pFaNo: Code[20]): Code[10];
    var
        DeprTableCode: Code[10];
        FADepreciationBook: Record "FA Depreciation Book";
    begin
        Clear(DeprTableCode);

        FADepreciationBook.reset;
        FADepreciationBook.SetCurrentKey("FA No.");
        FADepreciationBook.SetFilter("FA No.", pFaNo);
        if FADepreciationBook.FindFirst then
            if FADepreciationBook."Depreciation Table Code" <> '' then
                DeprTableCode := FADepreciationBook."Depreciation Table Code"
            else
                DeprTableCode := Format(FADepreciationBook."Straight-Line %") + ' %';

        exit(DeprTableCode);
    end;
}
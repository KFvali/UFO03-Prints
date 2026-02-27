report 50012 "Handling Unit Label"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = HULabel;
    CaptionML = ENU = 'Handling unit Label', ITA = 'Etichetta materia prima';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(HandlingUnit; "EOS055 Handling Unit")
        {
            column(intfinto; intfinto) { }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {

            }
        }

        actions
        {
            area(processing)
            {
                action(HULabel)
                {

                }
            }
        }
    }

    rendering
    {
        layout(HULabel)
        {
            Type = RDLC;
            LayoutFile = 'HU Label.rdlc';
        }
    }

    labels
    {
        label(Uform_Caption; ENU = 'U-FORM', ITA = 'U-FORM')
        label(IMP_Caption; ENU = 'IDENTIFICAZIONE MATERIA PRIMA', ITA = 'IDENTIFICAZIONE MATERIA PRIMA')
        label(Codice_Caption; ENU = 'CODICE', ITA = 'CODICE')
        label(Descrizione_Caption; ENU = 'DESCRIZIONE', ITA = 'DESCRIZIONE')
        label(Qta_Caption; ENU = 'QUANTITA''/PESO', ITA = 'QUANTITA''/PESO')
        label(Lotto_Caption; ENU = 'LOTTO', ITA = 'LOTTO')
        label(Mod_Caption; ENU = 'Mod ACQ-2', ITA = 'Mod ACQ-2')
        label(Rev_Caption; ENU = 'Rev.: 0', ITA = 'Rev.: 0')
        label(Data_Caption; ENU = 'Data 18/09/2017', ITA = 'Data 18/09/2017')
        label(Firma_Caption; ENU = 'Firma:', ITA = 'Firma:')
        label(Parte_Caption; ENU = 'Parte 1 di 1', ITA = 'Parte 1 di 1')
        label(Etichetta_Caption; ENU = 'N° ETICHETTA', ITA = 'N° ETICHETTA')
    }
    trigger OnPreReport()
    var

    begin
        HUFilter := pRecRef.Field(TempHandlingUnitBuffer.FieldNo("Handling Unit No.")).GetFilter();
        if HUFilter = '' then
            Error(ErrTxt001);

        HandlingUnit.Reset();
        HandlingUnit.SetFilter("No.", HUFilter);
        if HandlingUnit.FindSet() then
            repeat
                PackingDataCollect.SumHandlingUnitContent(HandlingUnit."No.", TempHandlingUnitBuffer);
                TempHandlingUnitBuffer.Reset();
                TempHandlingUnitBuffer.SetRange(Type, TempHandlingUnitBuffer.Type::Item);
                if TempHandlingUnitBuffer.FindSet() then
                    repeat
                        LineNo += 1;
                        TempHandlingUnitBuffer2.Init();
                        TempHandlingUnitBuffer2.TransferFields(TempHandlingUnitBuffer, false);
                        TempHandlingUnitBuffer2."Line No." := LineNo;
                        TempHandlingUnitBuffer2.Insert();
                    until TempHandlingUnitBuffer.Next() = 0;
            until HandlingUnit.Next() = 0;

        TempHandlingUnitBuffer2.Reset();
        pRecRef.GetTable(TempHandlingUnitBuffer2);
    end;

    var
        intfinto: Integer;
        gHandlingUnit: Record "EOS055 Handling Unit";
        TempHandlingUnitBuffer: Record "EOS055 Handling Unit Buffer" temporary;
        PackingDataCollect: Codeunit "EOS055 Packaging Data Collect.";
        TempHandlingUnitBuffer2: Record "EOS055 Handling Unit Buffer" temporary;
        HUFilter: Text;
        LineNo: Integer;
        ErrTxt001: TextConst ENU = 'HU Filter must be setted on record', ITA = 'Il filtro HU deve essere impostato sul record';
        pRecRef: RecordRef;
}
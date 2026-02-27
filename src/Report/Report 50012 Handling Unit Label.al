report 50012 "Handling Unit Label"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = HULabel;
    CaptionML = ENU = 'Handling unit Label', ITA = 'Etichetta materia prima';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(intf; Integer)
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

    var
        intfinto: Integer;
}
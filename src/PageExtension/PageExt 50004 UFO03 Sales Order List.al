pageextension 50004 "UFO03 Sales Order List" extends "Sales Order List"

{
    actions
    {
        modify("Work Order")
        {
            trigger OnBeforeAction()
            var
                //WorkOrdert: Report "MMA Work Order";
                lSalesHeader: Record "Sales Header";
                lSalesLine: Record "Sales Line";

            begin
                lSalesHeader := Rec;
                lSalesHeader.SETRECFILTER;
                lSalesLine.Reset();
                lSalesLine.SetRange("Document No.", lSalesheader."No.");
                lSalesLine.SetRange("Document Type", lSalesLine."Document Type"::Order);
                //lSalesLine.Setrange("MMA04 To Prepare - Inventory", true);
                //lSalesLine.SetRange("MMA04 D/T Print Work Order", 0DT);
                if lSalesline.FindSet() then begin
                    // repeat
                    //     lSalesLine."MMA04 D/T Print Work Order" := CurrentDateTime;
                    //     lSalesLine.Modify();
                    // until lSalesLine.Next() = 0;
                end;

                Commit;

            end;
        }
    }

    var

}
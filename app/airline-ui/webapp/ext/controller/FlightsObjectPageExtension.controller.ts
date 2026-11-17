import ControllerExtension from "sap/ui/core/mvc/ControllerExtension";
import ExtensionAPI from "sap/fe/templates/ObjectPage/ExtensionAPI";
import Context from "sap/ui/model/odata/v4/Context";
import Log from "sap/base/Log";
import UI5Event from "sap/ui/base/Event";
import Button from "sap/m/Button";

/**
 * @namespace airlineui.ext.controller
 * @controller
 */
export default class FlightsObjectPageExtension extends ControllerExtension<ExtensionAPI> {

    async makePayment(oEvent: UI5Event) {
        try {
            const oButton = oEvent.getSource() as Button;
            const oContext = oButton.getBindingContext() as Context;

            const sTicketId = oContext.getProperty("ID");

            const oPaymentModel = this.base
                .getExtensionAPI()
                .getModel("payment");

            const oOperation = oPaymentModel.bindContext(
                "/makePayment(...)"
            );

            oOperation.setParameter("ticketId", sTicketId);

            await oOperation.execute();

        } catch (error) {
            Log.error(
                "Payment processing failed",
                error instanceof Error ? error.stack : String(error),
                "airlineui.ext.controller.FlightsObjectPageExtension"
            );
        }
    }

    static overrides = {
        onInit(this: FlightsObjectPageExtension) {
            
        }
    };
}
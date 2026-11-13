import ControllerExtension from "sap/ui/core/mvc/ControllerExtension";
import ExtensionAPI from "sap/fe/templates/ObjectPage/ExtensionAPI";
import Context from "sap/ui/model/odata/v4/Context";
import Log from "sap/base/Log";

/**
 * @namespace airlineui.ext.controller
 * @controller
 */
export default class FlightsObjectPageExtension extends ControllerExtension<ExtensionAPI> {

    async makePayment(oContext: Context) {
        try {
            const oTicketsBinding = oContext.getModel().bindList(
                "tickets",
                oContext
            );

            const aTicketContexts = await oTicketsBinding.requestContexts(0, 2);

            if (aTicketContexts.length === 0) {
                throw new Error("No tickets found for this flight");
            }

            if (aTicketContexts.length > 1) {
                throw new Error("Multiple tickets found. A ticket must be selected.");
            }

            const sTicketId = aTicketContexts[0].getProperty("ID");

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
            // Initialization
        }
    };
}

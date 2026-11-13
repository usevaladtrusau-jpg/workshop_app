sap.ui.define([], function () {
    "use strict";

    return {
        processPayment: async function (oContext) {
            const oView = this.getView();
            const oPaymentModel = oView.getModel("payment");

            const oOperation = oPaymentModel.bindContext(
                "/processPayment(...)"
            );

            oOperation.setParameter(
                "bookingId",
                oContext.getProperty("ID")
            );

            await oOperation.execute();
        }
    };
});
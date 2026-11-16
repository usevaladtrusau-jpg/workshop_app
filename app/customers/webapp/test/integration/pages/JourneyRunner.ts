import JourneyRunner from "sap/fe/test/JourneyRunner";
import ListReport from "sap/fe/test/ListReport";
import ObjectPage from "sap/fe/test/ObjectPage";
import CustomCustomersListGenerated from "./CustomersList.gen";
import CustomCustomersObjectPageGenerated from "./CustomersObjectPage.gen";
import CustomTicketsObjectPageGenerated from "./TicketsObjectPage.gen";

const runner = new JourneyRunner({
    launchUrl: sap.ui.require.toUrl("customers") + "/test/flp.html#app-preview",
    pages: {
        onTheCustomersListGenerated: new ListReport(
            {
                appId: "customers",
                componentId: "CustomersList",
                entitySet: "",
                contextPath: "/Customers"
            },
            CustomCustomersListGenerated
        ),
        onTheCustomersObjectPageGenerated: new ObjectPage(
            {
                appId: "customers",
                componentId: "CustomersObjectPage",
                entitySet: "",
                contextPath: "/Customers"
            },
            CustomCustomersObjectPageGenerated
        ),
        onTheTicketsObjectPageGenerated: new ObjectPage(
            {
                appId: "customers",
                componentId: "TicketsObjectPage",
                entitySet: "",
                contextPath: "/Customers/tickets"
            },
            CustomTicketsObjectPageGenerated
        )
    },
    async: true
});

export default runner;

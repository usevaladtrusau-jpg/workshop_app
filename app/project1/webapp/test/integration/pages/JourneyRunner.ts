import JourneyRunner from "sap/fe/test/JourneyRunner";
import ListReport from "sap/fe/test/ListReport";
import ObjectPage from "sap/fe/test/ObjectPage";
import CustomFlightsListGenerated from "./FlightsList.gen";
import CustomFlightsObjectPageGenerated from "./FlightsObjectPage.gen";

const runner = new JourneyRunner({
    launchUrl: sap.ui.require.toUrl("project1") + "/test/flp.html#app-preview",
    pages: {
        onTheFlightsListGenerated: new ListReport(
            {
                appId: "project1",
                componentId: "FlightsList",
                entitySet: "",
                contextPath: "/Flights"
            },
            CustomFlightsListGenerated
        ),
        onTheFlightsObjectPageGenerated: new ObjectPage(
            {
                appId: "project1",
                componentId: "FlightsObjectPage",
                entitySet: "",
                contextPath: "/Flights"
            },
            CustomFlightsObjectPageGenerated
        )
    },
    async: true
});

export default runner;

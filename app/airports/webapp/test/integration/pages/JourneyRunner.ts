import JourneyRunner from "sap/fe/test/JourneyRunner";
import ListReport from "sap/fe/test/ListReport";
import ObjectPage from "sap/fe/test/ObjectPage";
import CustomAirportsListGenerated from "./AirportsList.gen";
import CustomAirportsObjectPageGenerated from "./AirportsObjectPage.gen";

const runner = new JourneyRunner({
    launchUrl: sap.ui.require.toUrl("airports") + "/test/flp.html#app-preview",
    pages: {
        onTheAirportsListGenerated: new ListReport(
            {
                appId: "airports",
                componentId: "AirportsList",
                entitySet: "",
                contextPath: "/Airports"
            },
            CustomAirportsListGenerated
        ),
        onTheAirportsObjectPageGenerated: new ObjectPage(
            {
                appId: "airports",
                componentId: "AirportsObjectPage",
                entitySet: "",
                contextPath: "/Airports"
            },
            CustomAirportsObjectPageGenerated
        )
    },
    async: true
});

export default runner;

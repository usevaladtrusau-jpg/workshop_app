import JourneyRunner from "sap/fe/test/JourneyRunner";
import ListReport from "sap/fe/test/ListReport";
import ObjectPage from "sap/fe/test/ObjectPage";
import CustomAircraftsListGenerated from "./AircraftsList.gen";
import CustomAircraftsObjectPageGenerated from "./AircraftsObjectPage.gen";
import CustomAircraftsSeatsObjectPageGenerated from "./AircraftsSeatsObjectPage.gen";

const runner = new JourneyRunner({
    launchUrl: sap.ui.require.toUrl("aircrafts") + "/test/flp.html#app-preview",
    pages: {
        onTheAircraftsListGenerated: new ListReport(
            {
                appId: "aircrafts",
                componentId: "AircraftsList",
                entitySet: "",
                contextPath: "/Aircrafts"
            },
            CustomAircraftsListGenerated
        ),
        onTheAircraftsObjectPageGenerated: new ObjectPage(
            {
                appId: "aircrafts",
                componentId: "AircraftsObjectPage",
                entitySet: "",
                contextPath: "/Aircrafts"
            },
            CustomAircraftsObjectPageGenerated
        ),
        onTheAircraftsSeatsObjectPageGenerated: new ObjectPage(
            {
                appId: "aircrafts",
                componentId: "AircraftsSeatsObjectPage",
                entitySet: "",
                contextPath: "/Aircrafts/seats"
            },
            CustomAircraftsSeatsObjectPageGenerated
        )
    },
    async: true
});

export default runner;

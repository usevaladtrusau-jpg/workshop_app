import JourneyRunner from "sap/fe/test/JourneyRunner";
import ListReport from "sap/fe/test/ListReport";
import ObjectPage from "sap/fe/test/ObjectPage";
import CustomAircraftsSeatsListGenerated from "./AircraftsSeatsList.gen";
import CustomAircraftsSeatsObjectPageGenerated from "./AircraftsSeatsObjectPage.gen";

const runner = new JourneyRunner({
    launchUrl: sap.ui.require.toUrl("aircraftseats") + "/test/flp.html#app-preview",
    pages: {
        onTheAircraftsSeatsListGenerated: new ListReport(
            {
                appId: "aircraftseats",
                componentId: "AircraftsSeatsList",
                entitySet: "",
                contextPath: "/AircraftsSeats"
            },
            CustomAircraftsSeatsListGenerated
        ),
        onTheAircraftsSeatsObjectPageGenerated: new ObjectPage(
            {
                appId: "aircraftseats",
                componentId: "AircraftsSeatsObjectPage",
                entitySet: "",
                contextPath: "/AircraftsSeats"
            },
            CustomAircraftsSeatsObjectPageGenerated
        )
    },
    async: true
});

export default runner;

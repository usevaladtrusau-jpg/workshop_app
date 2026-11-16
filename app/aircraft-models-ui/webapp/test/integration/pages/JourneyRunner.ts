import JourneyRunner from "sap/fe/test/JourneyRunner";
import ListReport from "sap/fe/test/ListReport";
import ObjectPage from "sap/fe/test/ObjectPage";
import CustomAircraftModelsListGenerated from "./AircraftModelsList.gen";
import CustomAircraftModelsObjectPageGenerated from "./AircraftModelsObjectPage.gen";

const runner = new JourneyRunner({
    launchUrl: sap.ui.require.toUrl("aircraftmodelsui") + "/test/flp.html#app-preview",
    pages: {
        onTheAircraftModelsListGenerated: new ListReport(
            {
                appId: "aircraftmodelsui",
                componentId: "AircraftModelsList",
                entitySet: "",
                contextPath: "/AircraftModels"
            },
            CustomAircraftModelsListGenerated
        ),
        onTheAircraftModelsObjectPageGenerated: new ObjectPage(
            {
                appId: "aircraftmodelsui",
                componentId: "AircraftModelsObjectPage",
                entitySet: "",
                contextPath: "/AircraftModels"
            },
            CustomAircraftModelsObjectPageGenerated
        )
    },
    async: true
});

export default runner;

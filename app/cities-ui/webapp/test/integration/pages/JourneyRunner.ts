import JourneyRunner from "sap/fe/test/JourneyRunner";
import ListReport from "sap/fe/test/ListReport";
import ObjectPage from "sap/fe/test/ObjectPage";
import CustomCitiesListGenerated from "./CitiesList.gen";
import CustomCitiesObjectPageGenerated from "./CitiesObjectPage.gen";
import CustomAirportsObjectPageGenerated from "./AirportsObjectPage.gen";

const runner = new JourneyRunner({
    launchUrl: sap.ui.require.toUrl("citiesui") + "/test/flp.html#app-preview",
    pages: {
        onTheCitiesListGenerated: new ListReport(
            {
                appId: "citiesui",
                componentId: "CitiesList",
                entitySet: "",
                contextPath: "/Cities"
            },
            CustomCitiesListGenerated
        ),
        onTheCitiesObjectPageGenerated: new ObjectPage(
            {
                appId: "citiesui",
                componentId: "CitiesObjectPage",
                entitySet: "",
                contextPath: "/Cities"
            },
            CustomCitiesObjectPageGenerated
        ),
        onTheAirportsObjectPageGenerated: new ObjectPage(
            {
                appId: "citiesui",
                componentId: "AirportsObjectPage",
                entitySet: "",
                contextPath: "/Cities/airports"
            },
            CustomAirportsObjectPageGenerated
        )
    },
    async: true
});

export default runner;

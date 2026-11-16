import JourneyRunner from "sap/fe/test/JourneyRunner";
import ListReport from "sap/fe/test/ListReport";
import ObjectPage from "sap/fe/test/ObjectPage";
import CustomRoutesListGenerated from "./RoutesList.gen";
import CustomRoutesObjectPageGenerated from "./RoutesObjectPage.gen";

const runner = new JourneyRunner({
    launchUrl: sap.ui.require.toUrl("routes") + "/test/flp.html#app-preview",
    pages: {
        onTheRoutesListGenerated: new ListReport(
            {
                appId: "routes",
                componentId: "RoutesList",
                entitySet: "",
                contextPath: "/Routes"
            },
            CustomRoutesListGenerated
        ),
        onTheRoutesObjectPageGenerated: new ObjectPage(
            {
                appId: "routes",
                componentId: "RoutesObjectPage",
                entitySet: "",
                contextPath: "/Routes"
            },
            CustomRoutesObjectPageGenerated
        )
    },
    async: true
});

export default runner;

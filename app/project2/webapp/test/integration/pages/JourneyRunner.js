sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project2/test/integration/pages/FlightsList.gen",
	"project2/test/integration/pages/FlightsObjectPage.gen",
	"project2/test/integration/pages/TicketsObjectPage.gen"
], function (JourneyRunner, FlightsListGenerated, FlightsObjectPageGenerated, TicketsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project2') + '/test/flp.html#app-preview',
        pages: {
			onTheFlightsListGenerated: FlightsListGenerated,
			onTheFlightsObjectPageGenerated: FlightsObjectPageGenerated,
			onTheTicketsObjectPageGenerated: TicketsObjectPageGenerated
        },
        async: true
    });

    return runner;
});


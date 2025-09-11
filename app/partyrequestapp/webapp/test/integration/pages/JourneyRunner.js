sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"partyrequestapp/test/integration/pages/PartyRequestsList",
	"partyrequestapp/test/integration/pages/PartyRequestsObjectPage"
], function (JourneyRunner, PartyRequestsList, PartyRequestsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('partyrequestapp') + '/index.html',
        pages: {
			onThePartyRequestsList: PartyRequestsList,
			onThePartyRequestsObjectPage: PartyRequestsObjectPage
        },
        async: true
    });

    return runner;
});


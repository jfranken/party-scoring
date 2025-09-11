const cds = require('@sap/cds');

module.exports = async (srv) => {
  // handler für PartyRequests einbinden
  const partyRequestsHandler = require('./handlers'); // wenn deine Datei handlers.js heißt
  partyRequestsHandler(srv);
};

const cds = require('@sap/cds');

module.exports = (srv) => {

  srv.after('CREATE', 'PartyRequests', async (req) => {
    const { ID, adults, children, includeChildren } = req.data;

    const numAdults = adults || 0;
    const numChildren = includeChildren ? (children || 0) : 0;
    const totalGuests = numAdults + numChildren;

    // Berechnung Materialien
    const plates = numAdults + Math.ceil(numAdults*0.1); // +10% Ersatz Erwachsene
    const glasses = numAdults + Math.ceil(numAdults*0.1);
    const cutlery = numAdults + Math.ceil(numAdults*0.1);

    const paperCups = numChildren + Math.ceil(numChildren*0.1); // +10% Ersatz Kinder
    const paperPlates = numChildren + Math.ceil(numChildren*0.1);
    const disposableCutlery = numChildren + Math.ceil(numChildren*0.1);

    const tx = cds.transaction(req);

    // totalGuests in PartyRequests aktualisieren
    await tx.run(
      UPDATE('partyPlanning.PartyRequests')
        .set({ totalGuests })
        .where({ ID })
    );

    // Calculations anlegen
    await tx.run(
      INSERT.into('partyPlanning.Calculations').entries({
        plates,
        glasses,
        cutlery,
        paperCups,
        paperPlates,
        disposableCutlery,
        partyRequests: { ID }  

      })
    );
  });

};

using { partyPlanning } from '../db/schema';

service partyPlanningSrv {
    entity PartyRequests as projection on partyPlanning.PartyRequests;
    entity Calculations as projection on partyPlanning.Calculations;
}

using { sap.common.CodeList } from '@sap/cds/common';

namespace partyPlanning;

// --- CodeLists ---
entity PartyRequestsPartyReasonCodeList : CodeList {
    @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
    key code : String(50);
}

entity PartyRequestsFoodOptionsCodeList : CodeList {
    @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
    key code : String(100);
}

entity PartyRequestsDrinkOptionsCodeList : CodeList {
    @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
    key code : String(100);
}

entity PartyRequestsExtraServicesCodeList : CodeList {
    @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
    key code : String(100);
}

// --- Entities ---
entity PartyRequests {
    key ID: UUID;
    partyReason: Association to PartyRequestsPartyReasonCodeList;
    date: Date;
    location: String(100);
    adults: Integer;
    includeChildren: Boolean default false;
    children: Integer;
    totalGuests: Integer;
    foodOptions: Association to PartyRequestsFoodOptionsCodeList;
    drinkOptions: Association to PartyRequestsDrinkOptionsCodeList;
    extraServices: Association to PartyRequestsExtraServicesCodeList;

    calculations: Association to many Calculations on calculations.partyRequests = $self;
}

entity Calculations {
    key ID: UUID;
    plates: Integer;
    glasses: Integer;
    cutlery: Integer;
    paperCups: Integer;
    paperPlates: Integer;
    disposableCutlery: Integer;

    partyRequests: Association to PartyRequests;
}

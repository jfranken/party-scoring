using { partyPlanningSrv } from '../../srv/service.cds';

// --- DataPoints ---
annotate partyPlanningSrv.PartyRequests with
@UI.DataPoint #partyReason: { Value: partyReason_code, Title: 'Party Reason' };
annotate partyPlanningSrv.PartyRequests with
@UI.DataPoint #date: { Value: date, Title: 'Date' };
annotate partyPlanningSrv.PartyRequests with
@UI.DataPoint #location: { Value: location, Title: 'Location' };

// --- HeaderFacets ---
annotate partyPlanningSrv.PartyRequests with
@UI.HeaderFacets: [
    { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#partyReason', ID: 'PartyReason' },
    { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#date', ID: 'Date' },
    { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#location', ID: 'Location' }
];

// --- HeaderInfo ---
annotate partyPlanningSrv.PartyRequests with
@UI.HeaderInfo: { TypeName: 'Party Request', TypeNamePlural: 'Party Requests' };

// --- Labels ---
annotate partyPlanningSrv.PartyRequests with {
    partyReason @Common.Label: 'Party Reason';
    date @Common.Label: 'Date';
    location @Common.Label: 'Location';
    adults @Common.Label: 'Adults';
    includeChildren @Common.Label: 'Include Children';
    children @Common.Label: 'Children';
    totalGuests @Common.Label: 'Total Guests';
    foodOptions @Common.Label: 'Food Options';
    drinkOptions @Common.Label: 'Drink Options';
    extraServices @Common.Label: 'Extra Services';
    calculations @Common.Label: 'Calculations';
};

// --- Text & Multi-Select ---
annotate partyPlanningSrv.PartyRequests with {
    partyReason @Common.Text: { $value: partyReason.name };
    includeChildren @Common.Text: { 
        $value: includeChildren,
        $EnumMemberMapping: [
            { $Key: true, $Label: 'Yes' },
            { $Key: false, $Label: 'No' }
        ]
    };
    foodOptions @Common.Text: { $value: foodOptions.name };
    drinkOptions @Common.Text: { $value: drinkOptions.name };
    extraServices @Common.Text: { $value: extraServices.name };
};

// --- ValueLists für Multi-Select-Filter ---
annotate partyPlanningSrv.PartyRequests with {
    partyReason @Common.ValueListWithFixedValues;
    includeChildren @Common.ValueListWithFixedValues;
    foodOptions @Common.ValueListWithFixedValues;
    drinkOptions @Common.ValueListWithFixedValues;
    extraServices @Common.ValueListWithFixedValues;
};
// --- Filterfelder ---
annotate partyPlanningSrv.PartyRequests with @UI.SelectionFields: [
    partyReason_code, date, location, adults, includeChildren, children,
    foodOptions_code, drinkOptions_code, extraServices_code
];

// --- LineItems (Tabellen) ---
annotate partyPlanningSrv.PartyRequests with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: partyReason_code },
    { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Value: location },
    { $Type: 'UI.DataField', Value: adults },
    { $Type: 'UI.DataField', Value: children },
    { $Type: 'UI.DataField', Value: totalGuests },
    { $Type: 'UI.DataField', Value: foodOptions_code },
    { $Type: 'UI.DataField', Value: drinkOptions_code },
    { $Type: 'UI.DataField', Value: extraServices_code }
];

// --- FieldGroups ---
annotate partyPlanningSrv.PartyRequests with @UI.FieldGroup #Main: {
    $Type: 'UI.FieldGroupType',
    Data: [
        { $Type: 'UI.DataField', Value: partyReason_code },
        { $Type: 'UI.DataField', Value: date },
        { $Type: 'UI.DataField', Value: location },
        { $Type: 'UI.DataField', Value: adults },
        { $Type: 'UI.DataField', Value: includeChildren, Label: 'Include Children' },
        { $Type: 'UI.DataField', Value: children, Label: 'Children',
          ![@UI.Hidden]: {
            $If: [
              { $Eq: [ { $Path: 'includeChildren' }, false ] },
              true,
              false
            ]
          }
        },
        { $Type: 'UI.DataField', Value: totalGuests, ![@UI.Hidden]: true },
        { $Type: 'UI.DataField', Value: foodOptions, Label: 'Food Options', ValueHelp: '@PartyRequestsFoodOptionsCodeList', MultiSelect: true },
        { $Type: 'UI.DataField', Value: drinkOptions, Label: 'Drink Options', ValueHelp: '@PartyRequestsDrinkOptionsCodeList', MultiSelect: true },
        { $Type: 'UI.DataField', Value: extraServices, Label: 'Extra Services', ValueHelp: '@PartyRequestsExtraServicesCodeList', MultiSelect: true }
    ]
};

// --- Calculations LineItems ---
annotate partyPlanningSrv.Calculations with @UI.LineItem #PartyRequests_calculations: [
    { $Type: 'UI.DataField', Value: plates },
    { $Type: 'UI.DataField', Value: glasses },
    { $Type: 'UI.DataField', Value: cutlery },
    { $Type: 'UI.DataField', Value: paperCups },
    { $Type: 'UI.DataField', Value: paperPlates },
    { $Type: 'UI.DataField', Value: disposableCutlery }
];

// --- Facets ---
annotate partyPlanningSrv.PartyRequests with @UI.Facets: [
    { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
    { $Type: 'UI.ReferenceFacet', ID: 'calculations', Label: 'Calculations', Target: 'calculations/@UI.LineItem#PartyRequests_calculations' }
];

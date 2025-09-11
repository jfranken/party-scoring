# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.


This CAP project and the included SAP Fiori application were generated with the Project Accelerator, using the prompt: Please generate annotations for the PartyRequests entity to define the UI:

Creation Form:
- partyReason: dropdown (Birthday, Wedding, Corporate Event, Private Gathering, Festival)
- date: date picker
- location: text input
- adults: number input
- includeChildren: checkbox
- children: number input, only visible if includeChildren = true
- totalGuests: read-only, automatically calculated
- foodOptions: multi-select checkbox group (Vegan, Vegetarian, Meat&#x2F;Fish, Fingerfood, Dessert buffet)
- drinkOptions: multi-select checkbox group (Soft drinks, Beer, Wine, Cocktails)
- extraServices: multi-select checkbox group (DJ, Decoration, Service staff)

Overview &#x2F; Result Table:
- Show partyReason, date, location, adults, children, totalGuests
- Show selected foodOptions, drinkOptions, extraServices
- Show calculated results from the Calculations entity: plates, glasses, cutlery, paperCups, paperPlates, disposableCutlery.

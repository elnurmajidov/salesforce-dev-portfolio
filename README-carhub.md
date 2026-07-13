# CAR HUB — Car Explorer App

A Lightning app for browsing and filtering cars, built as a 4-level training project
covering data modelling, static resources, Lightning Web Components, and
component-to-component communication (LMS + custom events).

## Data Model

**Car\_\_c** custom object — Car Name (Text 80) plus:

| Field | Type |
|---|---|
| Category\_\_c | Picklist (Hatchback, Sedan, SUV, MUV) |
| Description\_\_c | Long Text Area |
| Make\_\_c | Picklist (Tata, Hyundai, Honda, Kia, Ford, Renault) |
| Price\_\_c | Currency (16,2) |
| Picture_URL\_\_c | URL |
| Control\_\_c | Picklist (Manual, Automatic) |
| Fuel_Type\_\_c | Text (20) |
| Seating_Capacity\_\_c | Number (2) |

## Components

- **carFilter** — reads Category picklist values via `getPicklistValues`, adds an
  "All" option (default), and publishes the selected category over the
  `CarsFiltered` Lightning Message Channel. Combobox centered, 300px wide.
- **carTileList** — fetches cars from `CarController.getCars` (`@wire`, reactive
  to the selected category), renders a `carTile` per car, handles the tile's
  `carselect` custom event (child-to-parent), stores the selected car id, and
  publishes it over the `CarSelected` message channel.
- **carTile** — receives one car via a public `@api` property; shows the picture
  (300px height), name, and price; on click fires the `carselect` custom event.
- **carCard** — subscribes to `CarSelected`, shows the chosen car with
  `lightning-record-view-form` (Make, Category, Price + Other Details section).

## App Shell

- **CAR HUB** Lightning app with the Cars tab and the **Car Explorer** app page
  (Header and Right Sidebar layout: filter on top, tile list in the main region,
  car card in the sidebar).
- **carhub_images** static resource (public cache) serving the car pictures;
  `Picture_URL__c` values point to `/resource/carhub_images/<file>`.
- **Car_Hub_Access** permission set: object/field access, tab visibility, and
  Apex class access.

## Communication Patterns Demonstrated

1. **Car Filter → Car Tile List:** Lightning Message Service (`CarsFiltered`)
2. **Car Tile → Car Tile List:** custom DOM event (`carselect`)
3. **Car Tile List → Car Card:** Lightning Message Service (`CarSelected`)

## Sample Data

Twelve car records (Tata, Hyundai, Honda, Ford, Renault) are loaded with an
anonymous Apex script. Car photos in the static resource are sourced from
Wikimedia Commons (freely licensed) and resized to fit the 5 MB static
resource limit.

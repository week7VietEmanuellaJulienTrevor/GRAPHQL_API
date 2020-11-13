Rocket Elevators Graphql

FALL-2020-TEAM-API-2 - Week 8 Odyssey

TEAM MEMBERS:

VIET-NGA DAO “Team Leader”
TREVOR KITCHEN “Member”
EMMANUELLA DERILUS “Member”
ANDRE DE SANTANA “Member”
JULIEN DUPONT “Member”

  GEMS
  *graphql
  *graphiql

This week we were asked to create an API allowing GraphQL queries. This was done with the use of our databases from the past weeks.

To use GraphIQL you need to add the query on the left panel then press the play button on the top left.

You can retrieve the address of the building, the beginning and the end of the intervention for a specific intervention. The ids can be changed as needed.
```
{
    newquery1(id: 201) {
        interventions {
            startDateIntervention
            endDateIntervention
            address {
                numberAndStreet
                suiteOrApartment
                city
                country
                postalCode
            }
        }
    }
}

```
You can retrieve customer information and the list of interventions that look place for a specific building.
```
{
    newquery2(id: 6) {
        customer {
            id
            addressId
            fullNameCompanyContact
            companyName
            companyDescription
            companyContactPhone
            companyHeadquarterAddress
            customerCreationDate
        }
        interventions {
            id
            batteryId
            columnId
            elevatorId
            employeeId
            status
            result
            startDateIntervention
            endDateIntervention
            report
        }
    }
}
```

You can retrieve all interventions carried out by a specified employee with the buildings associated with these interventions including the details (Table BuildingDetails) associated with these buildings.
```
{  
newquery3 (id: 10)  {  
	employee{  
		id  
		firstName  
		lastName  
		interventions{  
			description  
			id  
			endDateIntervention  
			startDateIntervention  
			status  
			result  
			report  
			building{  
				description  
				id  
				addressOfTheBuilding  
				fullNameOfTheBuildingAdministrator  
				fullNameOfTheTechnicalContactForTheBuilding  
				emailOfTheAdministratorOfTheBuilding  
				technicalContactEmailForTheBuilding  
				phoneNumberOfTheBuildingAdministrator  
				technicalContactPhoneForTheBuilding  
				buildingDetail{  
				informationKey  
				value  
					}  
				}  
			}  
		}  
	}  
}
```

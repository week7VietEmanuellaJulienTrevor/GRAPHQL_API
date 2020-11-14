## Rocket Elevators Graphql

### FALL-2020-TEAM-API-2 - Week 8 Odyssey 

#### TEAM MEMBERS:
- VIET-NGA DAO "Team Leader"
- TREVOR KITCHEN "Member"
- EMMANUELLA DERILUS "Member"
- ANDRE DE SANTANA "Member"
- JULIEN DUPONT "Member"

#### GEMS
* graphql
* graphiql

#### This week we were asked to create a Graphql Api allowing queries for Rocket Elevators.This was done with the use of our databases from the past weeks.

### Testing with Postman 
* Clicking on the button will send you to the postman collection (Rocket-Elevator-GraphqlAPI). Inside Postman you can click on the button "Runner" which will execute a sequence, retrieving and changing the information before restoring for further tests. (Supplied in the Codeboxx deliverable)
N.B. Endpoint with post: https://rocketelevatorgraphqlapi.herokuapp.com/graphql

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/a194138cc39845896e5a)
### How to use GraphIQL (development mode):

1. Access your file and run "Bundle Install";
2. Go to your local host on a web browser: http://localhost:3000/graphiql;
3. Add the query on the left panel then press the play button on the top left.

- Retrieving the address of the building, the beginning and the end of the intervention for a specific intervention. The Id's can be changed as needed.
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
- Retrieving customer information and the list of interventions that took place for a specific building.
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

- Retrieval of all interventions carried out by a specified employee with the buildings associated with these interventions including the details (Table BuildingDetails) associated with these buildings.
```
{
    newquery3(id: 10) {
        employee {
            id
            firstName
            lastName
            interventions {
                description
                id
                endDateIntervention
                startDateIntervention
                status
                result
                report
                building {
                    description
                    id
                    addressOfTheBuilding
                    fullNameOfTheBuildingAdministrator
                    fullNameOfTheTechnicalContactForTheBuilding
                    emailOfTheAdministratorOfTheBuilding
                    technicalContactEmailForTheBuilding
                    phoneNumberOfTheBuildingAdministrator
                    technicalContactPhoneForTheBuilding
                    buildingDetail {
                        informationKey
                        value
                    }
                }
            }
        }
    }
}
```
-[Extra] Retrieving employee name for a specific intervention


	{

	query5 (id: 6){

		interventions{

			id

			employee{

				firstName

				lastName

				}

			}

		}

	}
	
-[Extra] List all telephone numbers and emails from employees and customers (alphabetical order)

	{

		contactdetailslist {

			employees{

				firstName

				lastName

				phoneNumber

				email

			}

			customers{

				companyName

				fullNameCompanyContact

				companyContactPhone

				emailCompanyContact

				fullNameServiceTechnicalAuthority

				technicalAuthorityPhone

				technicalManagerEmail

			}

		}

	}

-[Extra] Retreiving all products id of a customer (elevators, columns, batteries) in each of his buildings

	{

		customerinfo (id: 2){

			customer{

				id

				companyName

				buildings{

					addressOfTheBuilding

					batteries{

						id

						status

						columns{

							id

							elevators{

								id

							}

						}

  

					}

				}

			}

		}

	}

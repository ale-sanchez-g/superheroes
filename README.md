# superheroes

This repository will hold the questions and answers that will be presented in the battlefield, with the relevant scores.

No player data will be stored in this repository

## Endpoints

Example:

/office
/bus
/restaurant
/library

## Steps

- npm install
- PORT:3000 npm start

## Tests

- npm test

## MIGRATION PLAN

```
This will be moved to Hasura Covid Logic. This repo will be used for codifying the testing and deployment of the app.
```
### Pre-requisites

- Mac or Linux OS
- Latest installation of docker
- Internet access
s
### Docker capabilities

- docker-compose to have infrastructure similar to heroku infrastructure.
    - Postgress DB and Hasura with a password
    - Create relevant tables
    - Load test content

- Run the below command to set up your local test infrastructure
```sh
cd infra/test
sh setup.sh
```    
- to teardown the infra run the below (Delete containers and volumes)
```
cd infra/test
sh teardown.sh
```
<!-- https://hasura.io/docs/latest/graphql/core/guides/postgres/import-data-from-csv.html -->

### Example call to get Questions

```
query getQuestion {
  questions(where: {id: {_eq: "bus_1"}}) {
    answer1
    answer2
    correctanswer
    question
    score
  }
}
```
#!/bin/bash

# 2. Create Tables

curl --location --request POST 'http://localhost:8080/v1/graphql' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: myadminsecretkey' \
--header 'Content-Type: application/json' \
--data-raw '{
  "type": "run_sql",
  "args": {
    "sql": "CREATE TABLE questions(id text NOT NULL, question text NOT NULL, answer1 text NOT NULL, answer2 text NOT NULL, correctAnswer text NOT NULL, score integer NOT NULL, PRIMARY KEY (id));"
  }
}'

curl --location --request POST 'http://localhost:8080/v1/graphql' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: myadminsecretkey' \
--header 'Content-Type: application/json' \
--data-raw '{
  "type": "run_sql",
  "args": {
    "sql": "CREATE TABLE flows(id text NOT NULL, flow_sequence json NOT NULL, PRIMARY KEY (id));"
  }
}'

curl --location --request POST 'http://localhost:8080/v1/graphql' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: myadminsecretkey' \
--header 'Content-Type: application/json' \
--data-raw '{
  "type": "run_sql",
  "args": {
    "sql": "CREATE TABLE user_stage(id text NOT NULL, username text NOT NULL, stage text NOT NULL, PRIMARY KEY (id));"
  }
}'

# 2. Track Tables

curl --location --request POST 'http://localhost:8080/v1/graphql' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: myadminsecretkey' \
--header 'Content-Type: application/json' \
--data-raw '{
    "type": "track_table",
    "args": {
        "schema": "public",
        "name": "questions"
    }
}'

curl --location --request POST 'http://localhost:8080/v1/graphql' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: myadminsecretkey' \
--header 'Content-Type: application/json' \
--data-raw '{
    "type": "track_table",
    "args": {
        "schema": "public",
        "name": "flows"
    }
}'

curl --location --request POST 'http://localhost:8080/v1/graphql' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: myadminsecretkey' \
--header 'Content-Type: application/json' \
--data-raw '{
    "type": "track_table",
    "args": {
        "schema": "public",
        "name": "user_stage"
    }
}'
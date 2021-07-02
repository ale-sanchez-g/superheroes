#!/bin/bash

# 1. Connect PG to Hasura

curl --location --request POST 'http://localhost:8080/v1/metadata' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: myadminsecretkey' \
--header 'Content-Type: application/json' \
--data-raw '{
  "type": "pg_add_source",
  "args": {
    "name": "default",
    "configuration": {
      "connection_info": {
        "database_url": "postgres://postgres:postgrespassword@postgres:5432/postgres",
        "pool_settings": {
          "retries": 1,
          "idle_timeout": 180,
          "max_connections": 50
        }
      }
    }
  }
}'

# 2. Create Table

curl --location --request POST 'http://localhost:8080/v1/query' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: myadminsecretkey' \
--header 'Content-Type: application/json' \
--data-raw '{
  "type": "run_sql",
  "args": {
    "sql": "CREATE TABLE questions(id text NOT NULL, question text NOT NULL, answer1 text NOT NULL, answer2 text NOT NULL, correctAnswer text NOT NULL, score integer NOT NULL, PRIMARY KEY (id));"
  }
}'

# 3. Track Table

curl --location --request POST 'http://localhost:8080/v1/query' \
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

# 4. Create Question 1 and 2

curl --location --request POST 'http://localhost:8080/v1/graphql' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: myadminsecretkey' \
--header 'Content-Type: application/json' \
--data-raw '{"query":"mutation addQuestion {\n  insert_questions(objects: {answer1: \"bad\", answer2: \"good\", correctanswer: \"good\", id: \"bus_1\", question: \"what is your bus answ?\", score: 20}, on_conflict: {constraint: questions_pkey}) {\n    returning {\n      id\n    }\n  }\n}","variables":{}}'

curl --location --request POST 'http://localhost:8080/v1/graphql' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: myadminsecretkey' \
--header 'Content-Type: application/json' \
--data-raw '{"query":"mutation addQuestion {\n  insert_questions(objects: {answer1: \"bad\", answer2: \"good\", correctanswer: \"good\", id: \"off_1\", question: \"what is your office answ?\", score: 20}, on_conflict: {constraint: questions_pkey}) {\n    returning {\n      id\n    }\n  }\n}","variables":{}}'
#!/bin/bash

# # 2. Create Table

# curl --location --request POST 'https://test-covid19-logic.herokuapp.com/v1/query' \
# --header 'X-Hasura-Role: admin' \
# --header 'x-hasura-admin-secret: James-22-Jumps' \
# --header 'Content-Type: application/json' \
# --data-raw '{
#   "type": "run_sql",
#   "args": {
#     "sql": "CREATE TABLE questions(id text NOT NULL, question text NOT NULL, answer1 text NOT NULL, answer2 text NOT NULL, correctAnswer text NOT NULL, score integer NOT NULL, PRIMARY KEY (id));"
#   }
# }'


# 4. Create Question 1 and 2

curl --location --request POST 'https://test-covid19-logic.herokuapp.com/v1/graphql' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: James-22-Jumps' \
--header 'Content-Type: application/json' \
--data-raw '{"query":"mutation addQuestion {\n  insert_questions(objects: {answer1: \"bad\", answer2: \"good\", correctAnswer: \"good\", id: \"bus_1\", question: \"what is your bus answ?\", score: 20}, on_conflict: {constraint: questions_pkey}) {\n    returning {\n      id\n    }\n  }\n}","variables":{}}'

curl --location --request POST 'https://test-covid19-logic.herokuapp.com/v1/graphql' \
--header 'X-Hasura-Role: admin' \
--header 'x-hasura-admin-secret: James-22-Jumps' \
--header 'Content-Type: application/json' \
--data-raw '{"query":"mutation addQuestion {\n  insert_questions(objects: {answer1: \"bad\", answer2: \"good\", correctAnswer: \"good\", id: \"res_1\", question: \"what is your restaurant answ?\", score: 20}, on_conflict: {constraint: questions_pkey}) {\n    returning {\n      id\n    }\n  }\n}","variables":{}}'
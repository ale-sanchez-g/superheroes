const express = require('express');
const bodyParser = require('body-parser');

let port = process.env.PORT || 3000;
let key = process.env.AUTH_KEY || "local_key";


const app = express();
app.use(bodyParser.json());


const battlefields = [
        {place:"office"},
        {place:"bus"},
        {place:"restaurant"},
        {place:"library"},
];

//e.g GET: http://localhost:3000/
app.get('/', function (req, res) {
    if (req.get('Authorization') == key ) {
        res.send(battlefields)
       } else {
        res.status(401)
        res.json({error: "incorrect key"})
       } 
})

//e.g GET: http://localhost:3000/api/v2/office
battlefields.forEach(function(battle){
    const place = require('./battlefield/v2/'+battle.place);
    app.get(`/api/v2/${battle.place}`, (req, res) => {
        console.log(`Returning ${battle.place} questions`);
        res.send(place);
    });
});

//e.g POST: http://localhost:3000/api/submitAnswer
app.post(`/api/v2/submitAnswer`, function (req, res) {
    console.log('Received data: ' + req)
    res.send('POST request to the homepage')
  });

// //TODO: Create and move this logic to a Service (SOA)
// function validateAnswer(question_id, answer) {
//     let pass = false;
//     const correct_answers = 
//     [
//         { bus_1: "Use your superheroes Mask and sanitizer while traveling on public transport and clean your hands regularly." },
//         { bus_2: "Move to another seat immediately and report it to the driver!" },
//         { bus_3:"Cover any sneezes or coughs with your superhero inner elbow or with a tissue that is then discarded."}
//         // {place:"library"},
//     ];
//     //get the Question Id
//     let match = correct_answers.findIndex(element => element.includes(question_id))
//         alert (match);     
//         //Validate Question Id against correct Answer
//         if (answer === match) {
//             pass = true;
//         }        
//     return pass
// }

console.log(`Covid Heroes service listening on port ${port}`);
app.listen(port);
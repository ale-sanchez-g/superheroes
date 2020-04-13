const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const office = require('./battlefield/office');
const port = process.argv.slice(2)[0];
const app = express();
app.use(bodyParser.json());


const battlefields = [
        {place:"office"},
        {place:"bus"},
        {place:"restaurant"},
        {place:"library"},
];

app.get('/', (req, res) => {
    // I want to add Swagger in the home page
    console.log('simple info on how to use the API');
    res.send(battlefields);
 });

// app.get('/office', (req, res) => {
//    console.log('Returning office questions');
//    res.send(office);
// });
  
battlefields.forEach(function(battle){
    const place = require('./battlefield/'+battle.place);
    app.get(`/${battle.place}`, (req, res) => {
        console.log(`Returning ${battle.place} questions`);
        res.send(place);
     });
  });


console.log(`Heroes service listening on port ${port}`);
app.listen(port);
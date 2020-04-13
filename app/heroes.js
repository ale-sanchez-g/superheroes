const express = require('express');
const bodyParser = require('body-parser');

let port =process.env.PORT || 3000;

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
  
battlefields.forEach(function(battle){
    const place = require('./battlefield/'+battle.place);
    app.get(`/${battle.place}`, (req, res) => {
        console.log(`Returning ${battle.place} questions`);
        res.send(place);
     });
  });


console.log(`Heroes service listening on port ${port}`);
app.listen(port);
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

app.get('/', function (req, res) {
    res.send(app.battlefields)
})

  
battlefields.forEach(function(battle){
    const place = require('./battlefield/'+battle.place);
    app.get(`/${battle.place}`, (req, res) => {
        console.log(`Returning ${battle.place} questions`);
        res.send(place);
     });
  });

battlefields.forEach(function(battle){
    const place = require('./battlefield/v2/'+battle.place);
    app.get(`/api/v2/${battle.place}`, (req, res) => {
        console.log(`Returning ${battle.place} questions`);
        res.send(place);
    });
});


console.log(`Covid Heroes service listening on port ${port}`);
app.listen(port);
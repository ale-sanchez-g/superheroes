const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors')

let port = process.env.PORT || 3000;
let key = process.env.AUTH_KEY || "local_key";


const app = express();
app.use(bodyParser.json());
app.use(cors())

const battlefields = [
        {place:"office"},
        {place:"bus"},
        {place:"restaurant"},
        {place:"library"},
];

app.get('/', function (req, res) {
    if (req.get('Authorization') == key ) {
        res.send(battlefields)
       } else {
        res.status(401)
        res.json({error: "incorrect key"})
       } 
})


battlefields.forEach(function(battle){
    const place = require('./battlefield/v2/'+battle.place);
    app.get(`/api/v2/${battle.place}`, (req, res) => {
        console.log(`Returning ${battle.place} questions`);
        res.send(place);
    });
});


console.log(`Covid Heroes service listening on port ${port}`);
app.listen(port);
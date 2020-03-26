const express = require('express');
const bodyParser = require('body-parser');

const port = process.argv.slice(2)[0];
const app = express();
app.use(bodyParser.json());


const heroes = [
   {
       id: 1,
       type: 'handWasher',
       displayName: 'The HandWasher',
       img: 'handWasher.jpg'
   },
   {
       id: 2,
       type: 'social-distance',
       displayName: 'Invisible Distance',
       img: 'social-distance.jpg'
   },
   {
       id: 3,
       type: 'soap',
       displayName: 'SOAP',
       img: 'soap.jpg'
   },
   {
       id: 4,
       type: 'working-from-home',
       displayName: 'WFH',
       img: 'working-from-home.jpg'
   }
];

app.get('/', (req, res) => {
    console.log('simple info on how to use the API');
    res.send("To user go a GET request to /heroes");
 });

app.get('/heroes', (req, res) => {
   console.log('Returning heroes list');
   res.send(heroes);
});

console.log(`Heroes service listening on port ${port}`);
app.listen(port);
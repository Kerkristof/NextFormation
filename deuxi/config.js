var express = require('express');
var prog = express();
prog.use(express.static('public'));

prog.get('/', function (request, response) {
    'use strict';
    response.sendfile(__dirname + '/index.html');
});

prog.get('/fish', function (request, response) {
    'use strict';
    response.sendfile(__dirname + '/poissons.html');
});

prog.get('/personnes', function (request, response) {
    'use strict';
    response.send('Vous êtes sur la liste des personnes');
});

prog.listen(8281);
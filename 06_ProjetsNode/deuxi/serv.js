var express = require('express');
var prog = express();

prog.get('/', function(request, response) {
    response.send('Bonjour les gens; Welcome to my first config');
});

var serveur = prog.listen(8280, function(){
    var port = serveur.address().port;

    console.log("Notre port est : ", port);
});
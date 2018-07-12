// Quoi ça fait?

// require indique le fichier à importer ds la var app ==>app contient un objet qui contient des params et des méthodes
// Ici, on importe le fichier (objet) "express"
// Why?  ==> parce qu'on en a besoin ;=)
var appBehaviour = require('express')();
// console.log(appBehaviour);

// ******************************************************
// Quoi ça fait??
// Importe la méthode "Server" de l'objet "http" qui pernd en paramètre l'objet "app"
// why?? ==> Prrrrrrrrrrrrrrtt???
var httpServer = require('http').Server(appBehaviour);

// ******************************************************
// Quoi ça fait?
// genere un objet io qui stocke socket.io et prend l'objet http en paramètre
// Why?? ==> Pour gérer des connexions persistantes (qui viennent de httpServer)
var ioManager = require('socket.io')(httpServer);

// ******************************************************
// variable qui stocke les messages historiques
var history = [];

var getHeure = function (){
    var d = new Date();
    return d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
};

var Message = function (message) {
    this.auteur = "Alice";
    this.message = message;
    this.heure = getHeure();
};

var afficheMsg = function(indice) {
    return history[indice].auteur +" dit: " + history[indice].message + " a " + history[indice].heure;
};


// ******************************************************
// le jour ou la méthode GET est appelée de notre objet "app" qui prend comme paramètres,'/'
//et execute la fct callback qui a comme paramètre req et res
appBehaviour.get('/', function (request, response) {

    // ******************************************************
    // execute la méthode res.sendFile qui va met le fichier dans la réponse au  navigateur
    response.sendFile(__dirname + '/index.html');
});

// ******************************************************
// si la connexion est active, alors la fct socket.on est executée
ioManager.on('connection', function (socket) {

    // TODO: renvoyer l'historique à celui qui vient de se connecter
    for (var i=0; i<history.length; i++) {
        socket.emit('chat message',afficheMsg(i));
    };


    // ******************************************************
    // declenche la fct io.emit avec le parametre msg
    socket.on('chat message', function (msg) {

        // ******************************************************
        // envoie le msg ds la page index html
        var newMsg = new Message(msg);
        history.push(newMsg);
        ioManager.emit('chat message', afficheMsg(history.length-1));
    });
});

// Indique sur quel port on va travailler
httpServer.listen(3000, function () {
    // affiche le num du port dans la console
    console.log('listening on *:3000');
});
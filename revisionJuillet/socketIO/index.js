// Quoi ça fait?
// require indique le fichier à importer ds la var app ==>app contient un objet qui contient des params et des méthodes
// Ici, on importe le fichier (objet) "express"
// Why?  ==> parce qu'on en a besoin ;=)
var app = require('express')();
console.log(app);

// ******************************************************
// Quoi ça fait??
// Importe la méthode "Server" de l'objet "http" qui pernd en paramètre l'objet "app"
// why?? ==> Prrrrrrrrrrrrrrtt???
var http = require('http').Server(app);

// ******************************************************
// Quoi ça fait?
// genere un objet io qui stocke socket.io et prend l'objet http en paramètre
// Why?? ==> Bof
var io = require('socket.io')(http);

// ******************************************************
// variable qui stocke les messages historiques
var history = "Message";

// ******************************************************
// execute la méthode "get" de notre objet "app" qui prend comme paramètres,'/'
//et execute la fct callback qui a comme paramètre req et res
app.get('/', function (req, res) {

    // ******************************************************
    // execute la méthode res.sendFile qui va charger le index.html dans le navigateur
    res.sendFile(__dirname + '/index.html');
});

// ******************************************************
// si la connexion est active, alors la fct socket.on est executée
io.on('connection', function (socket) {

    // ******************************************************
    // declenche la fct io.emit avec le parametre msg
    socket.on('chat message', function (msg) {

        // ******************************************************
        // envoie le msg ds la page index html
        io.emit('chat message', msg);
    });
});

// Indique sur quel port on va travailler
http.listen(3000, function () {
    // affiche le num du port dans la console
    console.log('listening on *:3000');
});
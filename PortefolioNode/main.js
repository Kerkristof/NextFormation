var http = require('http');
var url = require('url'); /*on requiere la presence de l'url*/
var fichier = require('fs'); /*besoinde la presence d un systeme de fichier (module de gestion de fichier dans node js)*/

http.createServer(function (request, response) {
    var dem = url.parse(request.url).pathname; /*ici on passe la request en url (parse = chiffre entier)*/

    fichier.readFile(dem.substr(1), function (erreur, donne) { /*utilisation de fs (subtr prend une partie du string)*/
        if (erreur) {
            response.writeHead(404, {
                'Content-Type': 'text/html'
            }); /*renvoie une response pas okai 404*/
        } else {
            response.writeHead(200, {
                'Content-Type': 'text/html'
            });

            response.write(donne.toString()); /*information contenu dans le read*/

        }
        response.end();
    });
}).listen(8081);
console.log('server en marche sur http://127.0.0.1:8081');
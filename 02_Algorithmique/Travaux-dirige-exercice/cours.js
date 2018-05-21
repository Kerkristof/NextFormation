// alert('Je vais bien');
// console.log('Je vais bien');
//-------------Declaration des variables----------
var age;
var prenom;
var nomDeLUtilisateur;
var chiffreUn = 1;
var chiffreDeux = 2;
var chiffreTrois =3;
console.log(chiffreDeux);
// ----------------Exercice 3----------
// ecrire un code qui:
//   demande son nom a l'utilisateur
//   affiche "Bienvenue et son nom"'

// ecrire un code qui:
//   demande son nom a l'utilisateur
//   affiche "Bienvenue et son nom"'

var message=prompt("Hello Comment t'appelles-tu?");
console.log("Bienvenue dans ce cours "+message);

//  ------Les types de variables------------
var nombre =123;
var string="toto";
var boolean=true;
var fonction="une fonction";
var nulle="null";
var objet="contient un ojet java";

typeof true // boolean;

// --------------attention au typage -------------

var chiffreUn=prompt("Entrer un premier chiffre");
var chiffreDeux=Number(prompt("Entrer un second chiffre"));

chiffreUn=Number(chiffreUn);

var produit=chiffreUn*chiffreDeux;
var somme=chiffreUn+chiffreDeux;

console.log(chiffreUn+" X "+chiffreDeux+" = "+produit);
console.log(chiffreUn+" + "+chiffreDeux+" = "+somme);

//---------------------
// voir ES6 nouvelle version de JavaScript
// TypeScript permet de coder en JS mais avec un typage de variable fort.
parseInt(variable);
parseFloat(variable);
Number("string");
String(number);

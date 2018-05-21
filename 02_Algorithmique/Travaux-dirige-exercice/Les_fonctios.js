//noprotect
// declaration d'une fonction'
// function toto(){}
// ou alors
// var toto = function(){}
// titi=toto  copie toto ds titi
// toto() execute la fonction toto

// Exemple d'une fonction
//noprotect
function vieillir(age){
  var resultat;
  resultat=age+1;
  return resultat;
}

var nouvelAge=vieillir(12);
console.log(nouvelAge);

//noprotect
function f(x){
  function g(y){
    return x+y;
  }
  return g;
}
aTrois=f(3);
aQuatre=f(4);

console.log(aTrois(4));
console.log(aQuatre(4));

//noprotect
// -------------exercice 1 prix TTC-------------------
console.log("Test1: " + (prixTTC(100) == 120));
console.log("Test2: " + prixTTC(100));
console.log("Test3: " + prixTTC(20));


function prixTTC(prixHT) {
  var resultat = 1.2 * prixHT;
  return resultat;
}

/*Ecrire une fonction sommeJusquA qui prend un paramètre
 'n' et qui calcule la somme des chiffres de 1 à n
 et retourne le résultat*/

sommeJusquA(10);
sommeJusquA(20);

function sommeJusquA(n){
  var sum=0;
  for (var compt=1; compt<=n;compt+=1){
    sum+=compt;
  }
  return sum; 
}
console.log(sommeJusquA(10)===55);
console.log(sommeJusquA(20)===210);
// le videur simple "golfé"
var prenom=prompt("comment t'appelles tu?");
if(prenom==="Marc"){
  console.log('Bienvenue Marc');
}else{
  console.log('Je ne te connais pas');
}

// ou alors-------------------------------

(prompt('Prenom?')==="Marc")?console.log('Ok'):console.log('Non');

// Exercice Boucle compter de un à 10
var indice;
for(indice=1;indice<=10;indice+=1){
  console.log(indice);
}

//----------exercice somme de nbval nombre
// noprotect
// ---------- Declaration des variables -------------------
var nbval,chiffreEtape,somme,indice;
somme=0;
indice=1;

// -----------Entree du nombre de nombre à saisir---------
var nbval=prompt('Combien de nombre');

// -----------Boucle qui demande les nombres à ajouter-----
while (indice <= nbval){
  chiffreEtape=Number(prompt('Entre le nombre '+indice+'/'+nbval));
  somme+=chiffreEtape;
  indice+=1;
}

// -----------Affichage du resultat--------------------------
console.log("leurs sommes est "+somme);

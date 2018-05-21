// noprotect
var tour = 1; // tour de jeu (number)
var gagne; // savoir si on a gagné ou perdu (boolean)
var essai; // le chiffre entré par l'utilisateur (number)
var cible = Math.floor(Math.random() * 1000) + 1;
var message = "essai n°1";
//alert(cible);

while (!gagne && tour <= 10) {
  tour = tour + 1;
  essai = Number(prompt(message));

  if (essai === cible) {
    gagne = true;
  }
  if (essai < cible) {
    gagne === false;
    message = 'essai n°' + tour + " la valeur " + essai + ' est trop petite';
  }
  if (essai > cible) {
    gagne === false;
    message = 'essai n°' + tour + " la valeur " + essai + ' est trop grande';
  }
}

if (gagne===true){
  console.log('Vous avez gagné le milllion');
}else{
  console.log("Désolé mais vous avez perdu");
}
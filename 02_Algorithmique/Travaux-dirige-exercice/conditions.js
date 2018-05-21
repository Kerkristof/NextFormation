var age=Number(prompt("Bonjour, quel est ton age?"));
var genre=prompt("Es tu un garçon ou une fille \"M\" ou \"F\"");
genre=genre.toUpperCase();

//Version 1------------------------------
console.log('Version°1 -----------------');
if (age>=18 & genre=="F") {
  console.log('C\'est bon, tu peux rentrer');
  
} else {
  console.log('C\'est pas bon, tu peux rentrer chez  toi');
}

// Version 2-------------------------------
console.log('Versionn°2 ------------------');
if (age<18) {
  console.log('C\'est pas bon, tu peux rentrer chez  toi');
}else{
  if (genre=="M"){
    console.log('C\'est pas bon, tu peux rentrer chez  toi');
  }else{
    console.log('C\'est bon, tu peux rentrer');
  }
}

// Version 3--------------------------------------
console.log('Versionn°3 --------------------------');
if(age>=18) {
  if (genre=="F"){
    console.log('C\'est bon, tu peux rentrer');
  } else {
    console.log('C\'est pas bon, tu peux rentrer chez  toi');
  }
} else {
  console.log('C\'est pas bon, tu peux rentrer chez  toi');
}

console.log('========================================================');

// switch / case -----------------------
var prenom=prompt("quel est ton prénom?");
var bonjour;

switch(prenom){
  case "Jean":
    bonjour='Bonjour';
  break;
    
  case "Nikos":
    bonjour='Kalimera';
  break;
    
  case "Aissam":
    bonjour='Salam alaikum';
  break;
    
  case "James":
    bonjour='Hello';
  break;
    
  case "Tushar":
    bonjour='Namaste';
  break;
    
  default:
    bonjour='Tu n\'es pas dans ma liste';
}
console.log(bonjour+" "+prenom);

// switch / case -----------------------
var prenom=prompt("quel est ton prénom?");
var indice;
var tab=['Bonjour','Kalimera','Salam alaikum','Hello','Namaste',
         'Tu n\'es pas dans ma liste'];

switch(prenom){
  case "Jean":
    indice=0;
  break;
    
  case "Nikos":
    indice=1;
  break;
    
  case "Aissam":
    indice=2;
  break;
    
  case "James":
    indice=3;
  break;
    
  case "Tushar":
    indice=4;
  break;
    
  default:
    indice=5;
}
console.log(tab[indice]+" "+prenom);
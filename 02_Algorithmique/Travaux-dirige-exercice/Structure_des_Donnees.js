//construire un tableau et afficher le 2em prenom donc indice (1)
// var tab=["Farid","Laurent","Gregory","Stephanie"];
// console.log(tab[1]);

//Echanger le contenu de deux cases dans un tableau donné

var a;

var a = [1, 2, 3, 4, 5, ];
tableSwap(a, 0, 4);
console.log(a);

var a = [1, 2, 3, 4, 5, ];
tableSwap(a, 1, 3);
console.log(a);

function tableSwap(table, i, j) {
  var tamp;
  tamp = table[i];
  table[i] = table[j];
  table[j] = tamp;
}

function decaleDroite(t,taille){
  //Code ici!!
  var temp;
  temp=t[taille-1];
  
  for (i=taille-1; i>=0; i-=1){
    t[i]=t[i-1];
  }
  t[0]=temp;
}


//TEST
var t=["D","E","C","A","L","A","G","E"];
decaleDroite(t,8);
console.log(t);

//--------------Decale à droite en utilisant la fonction 
//-------Fct inverse deux lettre---------------
function tableSwap(table, i, j) {
  var tamp;
  tamp = table[i];
  table[i] = table[j];
  table[j] = tamp;
}
//-------Fct decale qui appelle tableSwap()-----
function decaleDroite(t, taille) {
  for (i = taille - 1; i > 0; i -= 1) {
    tableSwap(t,i,i-1)
  }
}
//-------test---------------
//TEST
var t = ["D", "E", "C", "A", "L", "A", "G", "E"];
decaleDroite(t, 8);
console.log(t);



//  Trier un tabeau
function tableSwap(table, i, j) {
  var tamp;
  tamp = table[i];
  table[i] = table[j];
  table[j] = tamp;
}

//  Trier un tabeau
// ------tableSwap() inverse deux cases dans un tabbleau-------
function tableSwap(table, i, j) {
  var tamp;
  tamp = table[i];
  table[i] = table[j];
  table[j] = tamp;
}
// ------triage() remet le tableau ds l'ordre >>>---------------
function triage(tab, taille) {
  var test=true;
  
  while (test) {  //La boucle while sera repetee tant que test est vrai!!
    test=false;  // si test n'est pas remis à true dans la boucle alors le tri s'arrete
    for (i = 0; i < taille - 1; i += 1) {
      if (tab[i] > tab[i + 1]) {
        tableSwap(tab, i, i + 1); //si tableSwap est executée alors test vaut true!!
        test=true;
      }
    }
  }
}
//------------t est le tableau à trier ---------------------------------------
var t = [56, 10, 98, 78, 5, 6, 55, 55, 89,78, 45, 25, 5, 65, 2, 33, 12, 55, 22];
//-----------Appelle la fonction triage et affiche le resultat-----------------
triage(t, 19);
console.log(t);

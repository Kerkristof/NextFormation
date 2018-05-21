//-------Fct inverse deux lettre---------------
function tableSwap(table, i, j) {
  var tamp;
  tamp = table[i];
  table[i] = table[j];
  table[j] = tamp;
}
//-------Fct decale à droite qui appelle tableSwap()-----
function decaleDroite(t, taille) {
  for (var i = taille - 1; i > 0; i -= 1) {
    tableSwap(t,i,i-1)
  }
}

//-------Fct decale à gauche qui appelle tableSwap()-----
function decaleGauche(t,taille){
  for(var i=0; i<taille-1; i+=1){
    tableSwap(t,i,i+1);
  }
}

//-------test---------------
//TEST
var t = ["D", "E", "C", "A", "L", "A", "G", "E"];
decaleDroite(t, 8);
console.log(t);

var t = ["D", "E", "C", "A", "L", "A", "G", "E"];
decaleGauche(t, 8);
console.log(t);
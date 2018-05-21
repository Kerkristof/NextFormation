// 2. Ecrire une fonction `chercheCombien(table, taille, elem)` qui 
// returne le nombre d'occurences de `elem` dans le tableau `table`
// > EX: pour le tableau `t = [0, 1, 0, 0, 1, 1, 1]`, l'appel 
// de `chercheCombien(t, 7, 0)` retournera `3`

function chercheCombien(tab,taille,elem){
  var combien=0;
  for(var i=0; i<taille;i+=1){
    if(tab[i]===elem){
      combien+=1;
    }
  } 
  return combien;
}
//TEST-----------------------------------
var t=[0, 1, 0, 0, 1, 1, 1];
console.log(chercheCombien(t,7,0));  //=>'3'
console.log(chercheCombien(t,7,1));  //=>'4'
// 3. Ecrire une fonction `estTrie(table, taille)`qui retourne
// `true` (ou `false`) selon que le tableau est trié (ou non)

//---fct estTrie
function estTrie(tab, taille) {
  var check = true;
  for (var i = 0; i < taille - 1; i += 1) {
    if (tab[i] > tab[i + 1]) {
      check = false;
      break;
    }
  }
  return check;
}


//TESTS -----------------------------------------
var ta=[3,6,-2,0,5,2,12,-10];
var tb=[-10,-5,-2,0,5,6,89,110];
console.log(ta);
console.log(estTrie(ta,8));
console.log(tb);
console.log(estTrie(tb,8));
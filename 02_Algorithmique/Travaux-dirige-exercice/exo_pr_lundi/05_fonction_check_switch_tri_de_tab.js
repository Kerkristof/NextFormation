//Test----------------
var t = [3, 1, 5, 7, 15, 11, 9, -6, -2, 0, 2, 9, 7];
console.log(t);
triTab(t, 13);
//console.log(t);



//---fct de switch
function switchCells(tab, cell1, cell2) {
  var tmp = tab[cell1];
  tab[cell1] = tab[cell2];
  tab[cell2] = tmp;
}

//---fct checkTri
function checkTri(tab, taille) {
  var check = true;
  for (var i = 0; i < taille - 1; i += 1) {
    if (tab[i] > tab[i + 1]) {
      check = false;
      break;
    }
  }
  console.log(check);
  return check;
}
//---fct de tri
function triTab(tab, taille) {
  while(!checkTri(t,13)){
    for (var i = 0; i < taille - 1; i += 1) {
      if (tab[i] > tab[i + 1]) {
        switchCells(tab, i, i + 1);
      }
    }
    console.log(t);
  }
}
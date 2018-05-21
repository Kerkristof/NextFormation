// 4. (bonus) Ecrire une fonction `zeroPos(table, taille)` qui retourne la
// position de la plus longue suite de zéros (d'affilée) dans le tableau `table`
// >  Ex : [1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0] =>9

function zeroPos(table, taille) {
  var pos = 0;  //position de départ de la chaine de "0" la plus longue
  var stringLenMax = 0; //garde en memoire la longeur max de la sequence de "0" 
  var stringLen = 0; //mesure le nombre de "0" consecutif
  var exist=false; // reste false si il n'y a aucun "0" dans le tableau
  //console.log('stringLen / stringLenMAx / pos')
  for (var i = 0; i < taille; i += 1) {
    if (table[i] === 0) {
      exist=true;
      stringLen += 1;
      if (stringLen > stringLenMax) {
        stringLenMax=stringLen;
        pos=i+1-stringLenMax;
      }
    } else {
      stringLen = 0;
    }
    //console.log(stringLen+" ---------- "+stringLenMax+" ---------- "+pos);
  }
  if (exist===true){
    return pos
  }else{
    return("il n'y a pas l'element recherché dans ce tableau");
  }
}


//TEST
var ta = [1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0];
console.log(zeroPos(ta,13)); //==>'9'
var tb = [1, 1, 1, 1, 1, 1, 1, 1]; //==> "il n'y a ....
console.log(zeroPos(tb,8));
var tc = [1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0];
console.log(zeroPos(tc,13)); //==>5
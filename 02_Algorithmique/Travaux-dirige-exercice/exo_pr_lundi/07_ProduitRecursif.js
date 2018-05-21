//Ecrire une fonction recursive qui return le produit de deux nombre en ne faisant
// que des addition

function produit(x,y){
  if (y===0){
    // x * 0 = x;
    return 0;
  }else{
    return (produit(x,y-1)+x);
  }  
}
//TEST
console.log(produit(4,5)); //==>20
console.log(produit(0,0)); //==>0
console.log(produit(1,0)); //==>0
console.log(produit(0,1)); //==>0
console.log(produit(1,1)); //==>1
console.log(produit(12,5)); //==>60
console.log(produit(23,12)); //==>276
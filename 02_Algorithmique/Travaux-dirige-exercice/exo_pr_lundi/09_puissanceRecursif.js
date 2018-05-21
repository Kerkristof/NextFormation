//Ecrire puissance de n en recursif

function puissance(x,n){
  if(n===0){
    return 1;
  }else{
    return (puissance(x,n-1)*x);
  }
}
//TEST
console.log(puissance(5,0)); //==>1
console.log(puissance(6,1)); //==>6
console.log(puissance(3,2)); //==>9
console.log(puissance(5,4)); //==>625
console.log(puissance(25,12)); //==>59604644775390625
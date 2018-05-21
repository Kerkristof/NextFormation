//Ecrire factorielle de n en recursif
function factorielle(n){
  if(n===0){
    return 1;
  }else{
    return (factorielle(n-1)*n);
  }
}



//TEST
console.log(factorielle(0)); //==>1
console.log(factorielle(1)); //==>1
console.log(factorielle(2)); //==>2
console.log(factorielle(5)); //==>120
console.log(factorielle(20)); //==>2432902008176640000
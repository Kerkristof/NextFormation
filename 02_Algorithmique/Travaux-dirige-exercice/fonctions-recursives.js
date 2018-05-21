//noprotect
//Compter la somme des nombres de 1 à n-----

//La methode expeditive
console.log(sommeJusquA(10)===55);
console.log(sommeJusquA(20)===210);

function sommeJusquA(n){
  return (n*(n+1))/2;
}


//La methode boucle
console.log(sommeJusquA(10)===55);
console.log(sommeJusquA(20)===210);

function sommeJusquA(n){
  var somme=0;
  for(var compt=1; compt<=n; compt+=1){
    somme+=compt;
  }
  return somme;
}

//La methode boucle recursive
// f(1)=>1    f(2)=>3   f(3)=>6
// f(2)=f(1)+2
// f(3)=f(2)+3
// f(n)=f(n-1)+n
//noprotect

//La methode boucle recursive
console.log(sommeJusquA(1)===1);
console.log(sommeJusquA(10)===55);
console.log(sommeJusquA(20)===210);
console.log(sommeJusquA(5000,0)===12502500);

function sommeJusquA(n){
  if (n===1){
    return 1;
  }else{
    return sommeJusquA(n-1)+n;
  }
}

//La methode boucle recursive terminale
console.log(sommeJusquA(1,0)===1);
console.log(sommeJusquA(10,0)===55);
console.log(sommeJusquA(20,0)===210);
console.log(sommeJusquA(5000,0)===12502500);

function sommeJusquA(n,acc){
  if(n===1){
    return acc+1;
  }else{
    return sommeJusquA(n-1,acc+n)
  }
}
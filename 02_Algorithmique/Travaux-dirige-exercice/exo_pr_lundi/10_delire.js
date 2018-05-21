function f(tab,i){
  if(i===0){
    console.log(tab[0]);
  }else{
    console.log(tab[i]);
    return (f(tab,i-1));
  }
}

var tab=[0,1,2,3,4,5,6,7,8,9];

f(tab,9);
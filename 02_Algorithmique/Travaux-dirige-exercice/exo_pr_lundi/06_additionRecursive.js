// Addition recursive on ne sait faire que des +1

function addRec(x,y){
  if(y===0){
    return x;
  }else{
    return (addRec(x,y-1)+1);
  }
}

//TEST

console.log(addRec(0,23)); //==>23
console.log(addRec(1,23)); //==>24
console.log(addRec(5,23)); //==>28
console.log(addRec(5,0)); //==>5
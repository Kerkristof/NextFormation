/*jslint browser: true, devel: true, white: true */
/*global $ */
$(document).ready(function () {
  "use strict";
  // ----- DECLARATION DE VARIABLES -----
  var name = "fruit";
  
  // ----- CONSTRUCTEUR DE FRUIT -----
  function Fruit(nom, col, taille, posX, posY) {
    this.nom = nom;
    this.col = col;
    this.taille = taille;
    this.posX = posX;
    this.posY = posY;
  }
  
  // ----- DECLARATION DES FONCTIONS -----
  function ajoutFruit(fruit) {
    var $newFruit = $("<div class = 'fruit'></div>");
    $newFruit.css('background-color',fruit.col);
    $newFruit.css('width',fruit.taille);
    $newFruit.css('height',fruit.taille);
    $newFruit.css('left',fruit.posX +'px');
    $newFruit.css('top',fruit.posY + 'px');
    $(".cadre").append($newFruit);
  }  
  function rndColor(){
    var red = Math.floor(Math.random()*255)+1;
    var green = Math.floor(Math.random()*255)+1;
    var blue = Math.floor(Math.random()*255)+1;
    return 'rgb('+red+','+green+','+blue+')';
  }
  function fruitGenerator() {
    var color = rndColor();
    var taille = Math.floor(Math.random()*45)+5;
    var posX = Math.floor(Math.random()*550);
    var posY = Math.floor(Math.random()*550);
    ajoutFruit(new Fruit(name, color, taille, posX, posY));
  }
    // ----- js CODE -----
    setInterval(fruitGenerator,50);
});
//------------- PUISSANCE QUATRE-----------------------------------
// noprotect

// ECRIRE UNE FONCTION game()
function Game() {
  // on va remplir l'objet...
  this.initialize = function() {
    this.grid = [
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
    ];
    this.player = 'x'; // ou 'o'
    this.winner = null;
    this.tokens = {
      x: 21,
      o: 21
    };
  };
  // FONCTION NEXT PLAYER
  this.nextPlayer = function() {
    if (player === "x") {
      player = "o";
    } else {
      player = "x";
    }
    return player;
  };

  // FONCTION DISPLAY
  this.display = function() {
    for (var i = 0; i < 6; i += 1) {
      var ligne = "";
      for (var j = 0; j < 7; j += 1) {
        switch (this.grid[i][j]) {
          case null:
            ligne = ligne + " . ";
            break;
          case "o":
            ligne += " o ";
            break;
          case "x":
            ligne += " x ";
            break;
        }
      }
      console.log(ligne);
    }
    console.log("---------------------");
    console.log(" 1  2  3  4  5  6  7 ");
    console.log("Joueur "+this.player+" Choisir une colonne[1-->7]");
  };
  this.initialize();
  return this;
}


var game = new Game();
game.initialize();
game.display();
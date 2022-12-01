void gameover() {
  // Somehow include who lost, and how they lost
  // Ex. Player 1 lost: 8 ball pocketed, Player 2 lost, Player 1 pocketed all balls
  background(255, 0, 0);
  
  if (mousePressed){
    newGame = true;
    mode = INTRO;
  }
}

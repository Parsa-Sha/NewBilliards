void gamewon() {
  background(0, 255, 0);
  
  if (mousePressed) {
    newGame = true;
    mode = INTRO;
  }
}

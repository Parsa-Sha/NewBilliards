int hover = 1;

void intro() {
  background(255);
  image(bg, 0, 0);
  hover = 1;
  
  if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 + 100 && mouseY < height/2 + 200) {
    if (mousePressed) mode = GAME;
    hover = 5;
  }
  
  if (newGame) newGame();
  
  fill(150,78,2);
  stroke(100,52,1);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("BILLIARDS INCOMPLETE", width/2, 200);
  textSize(10);
  //text("We didn't have the funding for a front-end programmer", width/2, 300);
  strokeWeight(hover);
  fill(150,78,2);
  rect(width/2-100, height/2 + 100, 200, 100);
  
  fill(map(hover, 1, 5, 1, 2) * 100, map(hover, 1, 5, 1, 2) * 52, map(hover, 1, 5, 1, 2) * 1);
  textSize(25);
  text("START", width/2-100 + 100, height/2 + 100 + 42);
}

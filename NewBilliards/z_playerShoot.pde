boolean hasPressed;
float rotationPressed;

PVector beginPressed, endPressed;
PVector newVel;

boolean hasShot = false;
boolean contactMade = false;

void playerShoot() { // We will get back to the shooting code, don't worry about this;
  float firstContact = firstContact();
  pb.setGrabbable(false);
  
  if (velcel) {
    velcel = false;
    mousePressed = false;
  }
  if (mousePressed) {
    pushMatrix();
    translate(pb.getX(), pb.getY());
    rotate(atan2(mouseY - beginPressed.y, mouseX - beginPressed.x) * int(!hasPressed));
    rotate(rotationPressed * int(hasPressed));
    translate(20 + map(dist(beginPressed.x, beginPressed.y, mouseX, mouseY), 0, 500, 0, 200), -6); // Incorporate length of mouse dragged
    if (checkVelRest() < 1) image(stick, 0, 0);
    popMatrix();
  }

  stroke(0);
  strokeWeight(5);
  noFill();
  if (checkVelRest() < 1) ellipse(30, 30, 26, 26);
  stroke(255 * int(turn), 0, 255 * int(!turn));
  ellipse(60, 30, 26, 26);
  stroke(int(teamDecided)*255);
  ellipse(90, 30, 26, 26);
  if (teamDecided) {
    stroke(int(solidStripe)*255, 0, int(!solidStripe)*255);
    ellipse(120, 30, 26, 26);
  }
  
  if (checkVelRest() < 1 && hasShot) { // When shot is over
    hasShot = false;
    if (anotherTurn) anotherTurn = false;
    else turn = !turn;
  }

  if (checkVelRest() > 1) hasShot = true; // When ball has just been shot

  if (teamDecided) { // teamDecided appears to be working, but if solid ball is hit and striped ball pocketed, game is still over.
    if (firstContact != 0) { // After balls have come to a rest
      if (solidStripe) { // Check the teams
        if ( // Then ask according to teams
          !turn && firstContact > 0 && firstContact < 8 ||
          turn && firstContact > 8 && firstContact < 16
          ) mode = GAMEOVER;
      } else {
        if (
          turn && firstContact > 0 && firstContact < 8 ||
          !turn && firstContact > 8 && firstContact < 16
          ) mode = GAMEOVER;
      }
    }
  }

  if (firstContact != 0) {
    if (firstContact == 8 && allBallsBut8[int(!turn)]) mode = GAMEOVER;
  }
}

void mousePressed() { // Rotate origin, mouseDragged ignoring Y changes, only X. Take X change, rotate back, and then apply velocity
  if (gameState == PLAYERSHOOT) {
    if (checkVelRest() < 1) beginPressed = new PVector(mouseX, mouseY);
  }
}

void mouseReleased() {
  if (gameState == PLAYERSHOOT) {
    if (checkVelRest() < 1) endPressed = new PVector(mouseX, mouseY);
    newVel = beginPressed.sub(endPressed);

    newVel.setMag(newVel.mag()*3);

    if (pb.getVelocityX() < 0.1 && pb.getVelocityY() < 0.1) pb.setVelocity(newVel.x, newVel.y);
  }
}

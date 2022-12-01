ArrayList<FBody> fBodyList;
float totalVelocity = 0;
int returning;

float checkVelRest() {
  totalVelocity = 0;
  fBodyList = world.getBodies();
  for (int i = 0; i < fBodyList.size(); i++) {
    FBody fb = fBodyList.get(i);
    totalVelocity += abs(fb.getVelocityX()) + abs(fb.getVelocityY());
  }
  return totalVelocity;
}

void calmVel() {
  fBodyList = world.getBodies();
  for (int i = 0; i < fBodyList.size(); i++) {
    FBody fb = fBodyList.get(i);
    fb.setVelocity(fb.getVelocityX() * 0.98, fb.getVelocityY() * 0.98);
  }
}

int firstContact() {
  fBodyList = world.getBodies();
  for (int i = 0; i < fBodyList.size(); i++) {
    FBody fb = fBodyList.get(i);
    if (fb instanceof Ball && !(fb instanceof PlayerBall)) { // Checking to make sure we only deal with all balls except pb
      if (pb.isTouchingBody(fb)) {
        for (int j = 1; j < myBalls.length; j++) { // Compare all balls with the one touching playerball
          if (fb.equals(myBalls[j]) && !contactMade) {
            returning = myBalls[j].id; // Return id of ball that was hit
            contactMade = true;
          }
        }
      }
    }
  }

  if (checkVelRest() < 1) {
    if (contactMade) {
      contactMade = false;
      return returning;
    } 
  }
  return 0;
}

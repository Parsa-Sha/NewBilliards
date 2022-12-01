class Ball extends FCircle {
  PVector pos;
  PVector vel;
  int size;
  int id;
  
  Ball() {
    super(26);
    pos = new PVector(0, 0);
    vel = new PVector(0, 0);
    size = 26;
    id = 1;
  }
  
  Ball(int identification) {
    super(26);
    pos = new PVector(0,0);
    vel = new PVector(0, 0);
    size = 26;
    id = identification;
  }

}

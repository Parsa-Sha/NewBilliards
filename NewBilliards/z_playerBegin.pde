void playerBegin() {
  pb.setGrabbable(true);
  
  // Set unable to be put down unless it's behind the line and not in the holes
  
  fill(255, 0, 0);
  if (mouseX > 50 && mouseX < 263 && mouseY > 105 && mouseY < 495) fill(0, 255, 0);
  circle(mouseX, mouseY, 10);
  
  rect(50, 105, 213, 390);
}

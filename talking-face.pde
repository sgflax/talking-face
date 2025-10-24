import processing.sound.*;

// Declare the processing sound variables
AudioIn input;
Amplitude loudness;

float volume;
float v;
float easing = 0.05;
float vprior;

PFont font;

void setup() {
  size(1000, 1000);
  smooth();
  font=loadFont("U.S.101-48.vlw");

  // Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);
  // Begin capturing the audio input
  input.start();
  // Create a new Amplitude analyzer
  loudness = new Amplitude(this);

  // Patch the input to the volume analyzer
  loudness.input(input);
}

void draw() {


  // Adjust the volume of the audio input based on mouse position
  float inputLevel = map(mouseX, 0, width, 1.0, 0.0);
  input.amp(inputLevel);
  volume = loudness.analyze();
  //println("loudness = " + volume);
   
  v = int(map(volume, 0, 1, 1, width));
  v=v*5; //20
  println("volume="+v);

  float dvFill = v - vprior;  //target v -vprior
  if(abs(dvFill) > 1) {
    vprior += dvFill * easing;
  }
    background(255, 250 - vprior/5, 155 - vprior/5);
   

  
   //left cheek
  push();
  noStroke();
  fill(#912b62, 5 + vprior/2);
  
 
  float dv = v - vprior;  //target v -vprior
  if(abs(dv) > 1) {
    vprior += dv * easing;
  }

  ellipse(238.111, 628.738, 300 + (vprior/2), 300 + (vprior/2));
  pop();
  
   //right cheek
  push();
  float dv2 = v - vprior;  //target v -vprior
  if(abs(dv2) > 1) {
    vprior += dv2 * easing;
  }
  noStroke();
  fill(#912b62, 5 + vprior/2);
  ellipse(750.111, 628.738, 300 + vprior/2, 300 + vprior/2);
  pop();
  

  
  //left eye
  push();
    stroke(255);
    ellipse(325, 400, 100, 100);
    //pupil
    fill(0);
    ellipse(325, 400, 70, 70);
  pop();
  
  //right eye
  push();
    stroke(255);
    ellipse(675, 400, 100, 100);
    //pupil
    fill(0);
    ellipse(675, 400, 70, 70);
  pop();
  
  //nose
  push();
    fill(0);
    ellipse(width/2, 540, 80, 30);
  pop();
  
  //mouth
  push();
    fill(0);
     rectMode(CENTER);
    rect(width/2, 700, 200 - v/20, 10 + v/10, 28);
  pop();
    
    //left eyelid
   if(v<600){
  push();
  noStroke();
  float dv3 = v - vprior;  //target v -vprior
  if(abs(dv3) > 1) {
    vprior += dv * easing;
  }
  fill(255, 250 - vprior/5, 155 - vprior/5);
  rectMode(CENTER);
  rect(325, 370 - vprior/10, 100, 60);
  pop();
   }

  

  
      //right eyelid
  if(v<600){
  push();
  noStroke();
  float dv4 = v - vprior;  //target v -vprior
  if(abs(dv4) > 1) {
    vprior += dv * easing;
  }
  fill(255, 250 - vprior/5, 155 - vprior/5);
  rectMode(CENTER);
  rect(675, 370 - vprior/10, 100, 60);
  pop();
   }

   // star background cutouts
  //top left
   push();
    noStroke();
    fill(255);
    beginShape();
      vertex(0, 406.06);
      vertex(368.64, 291.71);
      vertex(531, 0);
      vertex(0, 0);
    endShape();
    
    //top right
      noStroke();
      fill(255);
      beginShape();
      vertex(467, 0);
      vertex(632.54, 294.45);
      vertex(962.97, 396.06);
      vertex(1000, 400);
      vertex(1000, 0);
    endShape();
    
    //bottom left
    noStroke();
    fill(255);
    beginShape();
      vertex(0, 1000);
      vertex(213.97, 940.31);
      vertex(207.83, 631.2);
      vertex(35, 390);
      vertex(0, 390);
    endShape();
    
     //bottom
    noStroke();
    fill(255);
    beginShape();
      vertex(0, 1000);
      vertex(490.97, 823.63);
      vertex(786.13, 940.31);
      vertex(1000, 1000);
    endShape();
    
    //bottom right
    noStroke();
    fill(255);
    beginShape();
      vertex(786.13, 1000);
      vertex(1000, 1000);
      vertex(1000, 355);
      vertex(785.11, 616.08);

    endShape();
    pop();
    
   if(v>600) {
  //left eyering
  
  push();
  noStroke();
  float eyerings=map(v,0,350,0,2.5);
  for (int i=0; i<eyerings;i++){
  //fill(0, 250 - v/5, 155 - v/5);
  noFill();
  strokeWeight(3);
  stroke(180 - i, 255, 50*i);
  ellipse(675, 400, 100+i*30, 100+i*30);
  }
  pop();
        
   }
   
   
   if(v>600) {
  //right eyering
  push();
  noStroke();
  float eyerings=map(v,0,350,0,2.5);
  for (int i=0; i<eyerings;i++){
  //fill(0, 250 - v/5, 155 - v/5);
  noFill();
  stroke(180 - i, 255, 50*i);
  strokeWeight(3);
  
  ellipse(325, 400, 100+i*30, 100+i*30);
  }
  pop();
        
   }
  //pop matrix back
  //pop();

  ///////////////////////////////////////

  //credits
  fill(150);
  textFont(font, 14);
  textAlign(CENTER);
  String credits = "Serena Flaxenburg"; 
  text(credits, width/2, height-10);
  fill(255);
}

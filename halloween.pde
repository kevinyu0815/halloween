final int EYE_X_L = 160;  // left eye center X-position 
final int EYE_X_R = 440;  // right eye center X-position
final int EYE_Y = 250;    // eyes center Y-position
final int SCARF_W = 60;

PImage pumpkin, eye, bat;


void setup() {  
  size(600 ,720);
  pumpkin = loadImage("pumpkin.png");
  eye = loadImage("eye.png");
  bat = loadImage("bat.png");
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  noCursor(); // make mouse disappear
}

void draw(){  
  //background
  image(pumpkin, width/2, height/2);
  // draw eyes
  imageMode(CENTER);
  //left
  pushMatrix();
  translate(EYE_X_L, EYE_Y);
  rotate(atan2(mouseY-EYE_Y,mouseX-EYE_X_L));
  image(eye, 0, 0);
  popMatrix();
  
  //right
  pushMatrix();
  translate(EYE_X_R, EYE_Y);
  rotate(atan2(mouseY-EYE_Y,mouseX-EYE_X_R));
  image(eye, 0, 0);
  popMatrix();
  
  imageMode(CENTER);
  // draw scarf
  for(int i=0; i<=20; i++){
    int x = i*SCARF_W;
    int y =600;
    if(i>=10){
      x -= 600;
      y += SCARF_W;
    }
    float distance = dist(mouseX, mouseY, x+SCARF_W/2, y+SCARF_W/2);
    float brightness = map(distance, 0, 60, 30, 100);
    colorMode(HSB, 360, 100, brightness); 
    if(i%3 == 0){
        fill(46,46,100);
        rect(x,y,SCARF_W,SCARF_W);
      }
      if(i%3 == 1){
        fill(18,100,100);
        rect(x,y,SCARF_W,SCARF_W);      
      }
      if(i%3 == 2){
        fill(37, 100,100);
        rect(x,y,SCARF_W,SCARF_W);  
      }
  }
  
  
  
  /*
  for(int i=0; i<=10; i++){
    for(int j=0; j<2; j++){
      int x = i*SCARF_W;
      int y = 600+j*SCARF_W;
      if(j%2 == 1){
        x = x-SCARF_W;
      }
      if(i%3 == 0){
        fill(46,46,100);
        rect(x,y,SCARF_W,SCARF_W);
      }
      if(i%3 == 1){
        fill(18,100,100);
        rect(x,y,SCARF_W,SCARF_W);      
      }
      if(i%3 == 2){
        fill(37, 100,100);
        rect(x,y,SCARF_W,SCARF_W);       
      }
    }
  }
*/
  
  
  
  
  image(bat, mouseX, mouseY,60,60);
}
boolean reset = false;
boolean crow = false;
boolean [] keys = new boolean[128];
int pointsX = floor(random(2, 5)) *50;
int pointsY = floor(random(2, 5)) *50;
int pointsX2 = floor(random(5, 10)) * 50;
int pointsY2 = floor(random(5, 7)) * 50;
int randParkX = floor(random(2, 7))*50;
int randParkY = floor(random(5, 7))*50;
float carX = 50;
float carY = floor(random(2, 9)) *50;
float R =random(255);
float G =random(255);
float B =random(255);
float carX2 = floor(random(2, 9)) *50;
float carY2 = 50;
float R2 =random(255);
float G2 =random(255);
float B2 =random(255);
float distance;
float crowDistance;
float movingX= carX2;
float movingY= carY2 + 20;

void setup() {
  size(600, 500);
  
  
}

void draw() {
      background(240);

  //Reset Button Logic
    if (reset) {
      background(255);
      reset = false; 
      crow = false;
      randParkX =  floor(random(2, 7))*50;
      randParkY =  floor(random(5, 7))*50;
      pointsX2 =  floor(random(5, 10)) * 50;
      pointsY2 = floor(random(5, 7)) * 50;
      pointsX = floor(random(2, 5)) *50;
      pointsY = floor(random(2, 5)) *50;
      movingX= floor(random(2, 9)) *50;
      movingY= 70;
      carX = 50;
      carY = floor(random(2, 9)) *50;
      R =random(255);
      G =random(255);
      B =random(255);
      R2 =random(255);
      G2 =random(255);
      B2 =random(255);
  }

   //Methods
       title();
       cityBlock();
       park(randParkX, randParkY + 10);
       road();
       streetCars();
       calculateManhattanDistance((pointsX/50), (pointsY/50), (pointsX2/50), (pointsY2/50));
       pointPathway();
       generatePoints();
       move();
       
       
    //Moving Car
      stroke(0);
      strokeWeight(1);
      fill(R2, G2, B2);
      rect( movingX - 10,movingY -5, 20, 10); 
      fill(172,216,230);
      rect( movingX- 7, movingY - 10,15, 5);
      fill(0);
      ellipse(movingX - 5,movingY +7,5,5);
      ellipse(movingX + 5,movingY +7,5,5);
      
   //Reset Block
      strokeWeight(1);
      fill(255, 50, 50);
      rect(480, 0, 90, 40);
      textSize(30);
      fill(255);
      text("Reset", 485, 30);
 
  //Crow Distance Block
      fill(230,50,50);
      rect(30,0, 140, 40);

   //Crow Size Distance Logic
      if (crow) {
        crowDistancePoint((pointsX/50), (pointsY/50), (pointsX2/50), (pointsY2/50));
        textSize(13);
        fill(240);
        text(" Crow Distance = " + crowDistance,28,22); 
        
        
        //Crow Distance Line
          stroke(255,0,0);
          strokeWeight(4);
          line(pointsX,pointsY,pointsX2,pointsY2);
          
      } else {
        //Block Crow Size Text
        strokeWeight(1);
        textSize(15);
        fill(255);
        text("Crow Distance", 40, 25);
     
  }     
  
}

void mousePressed() {
  if ( mouseX >490 && mouseX < 560 && mouseY > 0 && mouseY < 40) {
    fill(255, 0, 0);
    reset = true;
  }
   if ( mouseX >30 && mouseX < 170 && mouseY > 0 && mouseY < 40) {
     fill(255, 0, 0);
     crow = true;
  }
}

  
void road() {
  stroke(255);
  strokeWeight(4);

  //Veritcal Lines
    for (int rdX = 100; rdX < 550; rdX += 50) {
      line(rdX, 50, rdX, 450);
    }
  //Horizontal Lines
    for (int rdY = 100; rdY < 500; rdY += 50) {
      line(50, rdY, 550, rdY);
    }
}

void cityBlock() {
  //Blocks
    noStroke();
    fill(150);
    rect(50, 50, 500, 400);
}

void generatePoints( ) {
  //PointA
    for (int pointCnt = 0; pointCnt < 1; pointCnt++) {
      fill(255, 50, 50);
      noStroke();
      ellipse(pointsX, pointsY - 25, 25, 25);
      triangle(pointsX - 10, pointsY - 18, pointsX, pointsY + 5, pointsX + 10, pointsY - 18);
      fill(250);
      ellipse(pointsX, pointsY-25, 20, 20);
      fill(255, 100, 100);
      textSize(20);
      text("1", pointsX-7, pointsY-18);
      fill(50, 50, 255);
      ellipse(pointsX, pointsY+2, 7, 7);
      textSize(15);
      fill(255,50,50);
      text("(" +(pointsX/50) +"," + (pointsY/50) + ")", pointsX + 15, pointsY -5);
    }

  //Point B
    for (int pointCnt = 0; pointCnt < 1; pointCnt++) {
      fill(255, 50, 50);
      noStroke();
      ellipse(pointsX2, pointsY2 - 25, 25, 25);
      triangle(pointsX2 - 10, pointsY2 - 18, pointsX2, pointsY2 + 5, pointsX2 + 10, pointsY2 - 18);
      fill(250);
      ellipse(pointsX2, pointsY2-25, 20, 20);
      fill(255, 100, 100);
      textSize(20);
      text("2", pointsX2-7, pointsY2-18);
      fill(50, 50, 255);
      ellipse(pointsX2, pointsY2+2, 7, 7);
       textSize(15);
      fill(255,50,50);
      text("(" +(pointsX2/50) +"," + (pointsY2/50) + ")", pointsX2 + 15, pointsY2 -5);
    }
}

void park(int treeX, int treeY ) {
    noStroke();
    fill(36, 195, 13);
    rect(randParkX, randParkY, 150, 100);

      for(int treeCnt = 0 ; treeCnt < 6; treeCnt++){
        fill(118, 92, 72);
        rect(treeX + 10,treeY + 20,5,15);
        noStroke();
        fill(0,100,0);
        ellipse(treeX + 10,treeY+ 15,10,10); 
        ellipse(treeX + 15,treeY + 15,10,10); 
        ellipse(treeX + 12,treeY + 8,10,10); 
        
        treeX +=25;
        //treeY +=  9;
      }
}

void title() {
    textSize(25);
    fill(255, 50, 50);
    text(" Distance Calculator", 190, 40);
}

void calculateManhattanDistance(int x1, int y1, int  x2, int y2) {  
  
  distance = abs(x1 - x2) + abs(y1 - y2);

  fill(0);
  textSize(25);
  fill(255, 0, 0);
  text("Distance = " + floor(distance) + " Blocks", 170, 480);
}

void streetCars() { 
  stroke(0);
  strokeWeight(1);
  fill(172,216,230);
  rect(carX +3, carY - 10, 15, 10);
  fill(R, G, B);
  rect(carX, carY-5, 20, 10); 
  fill(0);
  ellipse(carX+15,carY+5,5,5);
  ellipse(carX+5,carY+5,5,5);

  carX+=2;
  carY+=0;

  if (carX > 550) {
    carX = 50;
    carY= floor(random(2, 9)) *50;
    R =random(255);
    G =random(255);
    B =random(255);
  }
}

void move(){

     if(keys  ['s'])   
       movingY +=2;
     
      if(keys  ['w']) 
      movingY -=2;
      
      if(keys  ['a']) 
       movingX-=2;
      
      if(keys ['d']) 
       movingX +=2;    
       
       if(movingX > 550 || movingY > 450|| movingY < 50|| movingX < 50){
         
        movingX= floor(random(2, 9)) *50;
        movingY= 50;
  }
}
void keyPressed(){
  keys[key] = true; 
}

void keyReleased(){
  keys[key] = false;
}


void pointPathway() {
  strokeWeight(4);
  stroke(0, 0, 255);
  line(pointsX, pointsY, pointsX2, pointsY);
  line(pointsX2, pointsY, pointsX2, pointsY2);

}

void crowDistancePoint(int crowX, int crowY, int crowX2, int crowY2){
  
  crowDistance = (sqrt(((crowX2 - crowX) *(crowX2 - crowX))  + ((crowY2 - crowY) * (crowY2 - crowY))));
}































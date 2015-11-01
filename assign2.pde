/* please implement your assign1 code in this file. */
PImage enemy,hp,ship,treasure,background1,background2,start1,start2,lose1,lose2;
int enemyX,enemyY,p,q,w,s1,s2,gameState;
 float shipX,shipY,speed=5;
 boolean upPressed,downPressed,leftPressed,rightPressed = false; 

 final int GAME_START=0; 
 final int GAME_RUN=1;
 final int GAME_LOSE=2;
 
void setup () {
 
  gameState=GAME_START;
  size(640,480) ; 
  enemyX=0;
  enemyY=floor(random(440));
  s1=0;
  s2=-640;
  shipX=600;
  shipY=200;
  w=40;
  
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  lose1=loadImage("img/end1.png");
  lose2=loadImage("img/end2.png");
  enemy=loadImage("img/enemy.png");
  hp=loadImage("img/hp.png");
  ship=loadImage("img/fighter.png");
  treasure=loadImage("img/treasure.png");
  p=floor(random(0,600));
  q=floor(random(0,440));
  
  
}

void draw() {
 image(start2,0,0);
  switch(gameState){
    case GAME_START:
    if(420>mouseY&&mouseY>360&&mouseX>205&&mouseX<440){
    if(mousePressed){
        gameState=GAME_RUN;}
    else{
        image(start1,0,0);}
}
    break;
   case GAME_RUN:
  //background
  s1+=2;
  s2+=2;
  background1=loadImage("img/bg1.png");
  background2=loadImage("img/bg2.png");
  image(background1,s1,0);
  image(background2,s2,0);
  if(s1==640){ 
   s1=s1*-1;
 }
 if(s2==640){ 
   s2=s2*-1;
 }
  //Hp
  colorMode(RGB);
  fill(255,0,0);
  rect(15,9,w,16);
  image(hp,5,5);
  //Treasure
  image(treasure,p,q);
  if(p+40>shipX&&q+40>shipY && p<shipX+40&&q<shipY+40){
   p=floor(random(600));
   q=floor(random(20,440));
              w=w+20;
            }
   if(w>=200){
              w=200;
            }
     
  //Ship
  image(ship,shipX,shipY);
   if (upPressed) {
   shipY -= speed;
 } 
   if (downPressed) {
   shipY += speed; 
 } 
   if (leftPressed) {
   shipX -= speed;
 } 
   if (rightPressed) {
     shipX += speed;
 }  
   if(shipX>600){
   shipX=600;
 }
   if(shipX<0){
   shipX=0;
 }
 
   if(shipY>440){
     shipY=440;
 }
   if(shipY<0){
     shipY=0;
 }
 //Enemy
  image(enemy,enemyX,enemyY);
  enemyX+=3;
  if(enemyX>640){
  enemyX%=640;
  enemyY=floor(random(440));}
  else if(enemyX+40>shipX&&enemyY+40>shipY && enemyX<shipX+40&&enemyY<shipY+40){
                enemyX=0;
                enemyY=floor(random(440));
                w-=40;
            }else if(w==0){
              gameState=GAME_LOSE;
            }
        break;
 
       case GAME_LOSE:
           image(lose2,0,0);
 if(mouseY>300 && mouseY<350 && mouseX>210 && mouseX<440){
               if(mousePressed){
                 gameState = GAME_RUN;
                 w=40;
               }
               else{
                 
                 image(lose1,0,0);
               } 
             }
     break;
    }
  }


void keyPressed(){
if (key == CODED) {
    switch (keyCode) {
      case UP:
      upPressed= true;
        break;
      case DOWN:
        downPressed= true;
        break;
      case LEFT:
       leftPressed= true;
        break;
      case RIGHT:
       rightPressed= true;
        break;
    }
  }
}
void keyReleased(){
if (key == CODED) { 
     switch (keyCode) { 
       case UP: 
         upPressed = false; 
         break; 
       case DOWN: 
         downPressed = false; 
         break; 
       case LEFT: 
         leftPressed = false; 
         break; 
       case RIGHT: 
         rightPressed = false; 
         break; 
     } 
   } 
  }

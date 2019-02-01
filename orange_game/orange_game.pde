int radius=15;
int horiz = 5;
int jump = 7;
float xp,yp,xspeed = 0,yspeed = 0;
//float gravity = 0.3;
//float resistance = 0.98;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

//enemy bob;
enemy[] cars;

int carnum = 10;
boolean alive = false;

PFont font;

void setup()
{
  size(1920,300);
  xp=width*0.2;
  yp=height/2;
  cars = new enemy[carnum];
//  bob = new enemy(-5,15,6);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  noStroke();
  font = createFont("8-BIT.TTF",32);
  textFont(font);
  for(int i = 0; i< cars.length; i++)
  cars[i] = new enemy(-5,15,6);
}

void draw()
{
  background(0);
  if(alive)
  {
    move();
    controlls();
    walls();
    display();
    for(int i = 0; i< cars.length; i++)
    cars[i].run();
  }
  else
  {
    text("play again",width/2,height/2);
  }
  if (frameCount % 60 == 0) {
    println(frameRate);
  }
}

void walls()
{
  if(yp<=radius)
  yp = radius+1;
  if(yp>=height)
  yp = height-(radius+1);
  if(xp<=radius)
  xp = radius+1;
  if(xp>=width)
  xp = width-(radius+1);
}

void controlls()
{
  if(keyPressed)
  {
    if(rightPressed)
      xspeed = horiz;
    if(leftPressed)
      xspeed = -horiz;
    if(upPressed)
      yspeed = jump;
    if(downPressed)
      yspeed = jump/2;
  }
}

void move()
{
  xp += xspeed;
  yp += yspeed;
//  yspeed += gravity;
//  xspeed *= resistance;
}

void display()
{
  fill(255);
  rect(xp,yp,radius*3,radius*2);
}

void keyPressed()
  {
    if(keyCode == RIGHT)
      rightPressed = true;
    if(keyCode == LEFT)
      leftPressed = true;
    if(keyCode == UP)
      upPressed = true;
    if(keyCode == DOWN)
      downPressed = true;
  }

void keyReleased()
  {
    if(keyCode == RIGHT)
      rightPressed = false;
    if(keyCode == LEFT)
      leftPressed = false;
    if(keyCode == UP)
      upPressed = false;
    if(keyCode == DOWN)
      downPressed = false;
  }
  
  void mouseReleased()
  {
    if(!alive)
    {
      alive = true;
      for(int i = 0; i< cars.length; i++)
      cars[i].respawn();
      xspeed = 0;
      yspeed = 0;
      xp=width*0.2;
      yp=height/2;
    }
    
  }

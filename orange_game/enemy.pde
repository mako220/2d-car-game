class enemy
{
  int speed;
  int xpos,ypos;
  int rad;
  int rowSize;
  int rowNumber;
  enemy(int spd_temp,int rad_temp, int rowNumber_temp)
  {
    speed = spd_temp;
    rad = rad_temp;
    rowNumber = rowNumber_temp;
    rowSize = height/rowNumber;
    respawn();
  }
  void move()
  {
    xpos += speed;
  }
  void respawn()
  {
    xpos = width+int(random(0,width/rowSize))*rowSize;
    //xpos = int(random(radius,width-radius));
    ypos = int(random(1,rowNumber+1))*rowSize - rad;
  }
  void collide()
  {
    if((abs(xp-xpos)-2)<rad+radius  &&  (abs(yp-ypos)-2)<rad+radius)
    {
      alive = false;
    }
  }
  
  void teleport()
  {
    if(xpos < -rad)
    respawn();
  }
  
  void display()
  {
    fill(255,150,0);
    rect(xpos,ypos,rad*3,rad*2);
  }
  
  void run()
  {
    move();
    teleport();
    display();
    collide();
    
  }
}

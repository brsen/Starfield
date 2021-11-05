NormalParticle[] Stars = new NormalParticle[100];
int opacity = 20;
void setup()
{
  noStroke();
  size(500,500);
  for(int i = 0; i < Stars.length; i++)
  {
    Stars[i] = new NormalParticle();
  }
  Stars[0] = new OddBall();
}
void draw()
{
  fill(0, opacity);
  rect(0,0,width,height);
  for(int i = 0; i < Stars.length; i++)
  {
    Stars[i].move();
    Stars[i].show();
  }
}



class NormalParticle
{
  double myX, myY, myAngle, mySpeed;
  int myColor, mySize, myOpacity;
  NormalParticle()
  {
    myX = myY = 250;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 3 + 4;
    myColor = color(255,255,255);
    mySize = 5;
  }
  void move()
  {
    if(myX > 500)
    {
      myX = 250;
      myY = 250;
    }
    if(myX < 0)
    {
      myX = 250;
      myY = 250;
    }
    if(myY > 500)
    {
      myX = 250;
      myY = 250;
    }
    if(myY < 0)
    {
      myX = 250;
      myY = 250;
    }
    myOpacity = (dist((float)myX,(float)myY,250,250) < 75) ? 0 : (int)dist((float)myX,(float)myY,250,250);
        myX += Math.cos(myAngle) * mySpeed;
        myY += Math.sin(myAngle) * mySpeed;
        myAngle += 0.02;
        fill(dist((float)myX,(float)myY,250,250)-50,dist((float)myX,(float)myY,250,250)-50,dist((float)myX,(float)myY,250,250)-50,myOpacity);
        opacity = 20;
  }
  void show()
  {
    ellipse((float)myX, (float)myY, mySize, mySize);
  }
}

class OddBall extends NormalParticle
{
  int count;
  OddBall()
  {
    myColor = color(192,192,192);
  }
  void move()
  {
    if(count%20 == 0)
    {
    myX = 250;
    myY = 250;
    }
    myX += (int)(Math.random() * 7) - 3;
    myY += (int)(Math.random() * 7) - 3;
    count++;
    
  }
  void show()
  {
    fill(0,255,0,50);
    ellipse((float)myX,(float)myY-17,20,20);
    fill(myColor,50);
    arc((float)myX,(float)myY-12,60,50,PI,2 *PI);
    fill(myColor);
    ellipse((float)myX,(float)myY,80,30);
    fill(255,0,0);
    ellipse((float)myX - 30, (float)myY,5,5);
    ellipse((float)myX + 30, (float)myY,5,5);
    ellipse((float)myX - 15, (float)myY + 5,5,5);
    ellipse((float)myX + 15, (float)myY + 5,5,5);
    ellipse((float)myX, (float)myY + 7,5,5);
  }
}

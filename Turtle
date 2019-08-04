public class Turtle { //<>//
  final color[]colors = new color[]{
    // http://fmslogo.sourceforge.net/workshop/color.shtml
    color(0, 0, 0), 
    color(0, 0, 255), 
    color(0, 255, 0), 
    color(0, 255, 255), 
    color(255, 0, 0), 
    color(255, 0, 255), 
    color(255, 255, 0), 
    color(255, 255, 255), 
    color(155, 96, 59), 
    color(197, 136, 18), 
    color(100, 162, 64), 
    color(120, 187, 187), 
    color(255, 149, 119), 
    color(144, 113, 208), 
    color(255, 163, 0), 
    color(183, 183, 183)};
  PVector pos, angle;
  float turtleStrokeWeight, textSize;
  int turtleStroke;
  boolean pendown = true;

  public Turtle() {
    pos = new PVector();
    angle = new PVector();
    reset();
  }

  public void reset() {
    pos.set(0, 0);
    angle.set(0, 1);
    turtleStrokeWeight = 1;
    turtleStroke = 0;
  }
  
  protected PVector posToScreen(float x, float y) {
    while (x > width/2)
      x -= width;
    while (y > height/2)
      y -= height;
    while (x < -width/2)
      x += width;
    while (y < -height/2)
      y += height;
    return new PVector(x, y);
  }

  public void forward(float val) {
    angle.setMag(val);
    if (pendown) {
      stroke(red(turtleStroke), green(turtleStroke), blue(turtleStroke));
      strokeWeight(turtleStrokeWeight);
    } else noStroke();
    PVector newPos = posToScreen(pos.x + angle.x, pos.y + angle.y);
    line(pos.x, pos.y, newPos.x, newPos.y);
    pos.set(newPos);
  }

  public void back(float val) {
    forward(-val);
  }

  public void left(float val) {
    angle.rotate(radians(val));
  }
  public void right(float val) {
    left(-val);
  }

  public void home() {
    setXY(width/2, height/2);
  }
  public void setXY(float x, float y) {
    if (pendown) {
      stroke(red(turtleStroke), green(turtleStroke), blue(turtleStroke));
      strokeWeight(turtleStrokeWeight);
    } else noStroke();
    PVector newPos = posToScreen(x, y);
    line(pos.x, pos.y, newPos.x, newPos.y);
    pos.add(newPos);
  }
  public void setX(float x) {
    if (pendown) {
      stroke(red(turtleStroke), green(turtleStroke), blue(turtleStroke));
      strokeWeight(turtleStrokeWeight);
    } else noStroke();  
    PVector newPos = posToScreen(x, pos.y);
    line(pos.x, pos.y, newPos.x, newPos.y);
    pos.add(newPos);
    line(pos.x, pos.y, x, pos.y);
    pos.x = x;
  } 
  public void setY(float y) {
    if (pendown) {
      stroke(red(turtleStroke), green(turtleStroke), blue(turtleStroke));
      strokeWeight(turtleStrokeWeight);
    } else noStroke();
    line(pos.x, pos.y, pos.x, y);
    pos.y = y;
  }

  public void clearscreen() {
    background(255);
  }
  public void setlabelheight(float val) {
    textSize = val;
    textSize(textSize);
  }
  public void label(String val) {
    text(val, pos.x, pos.y);
  }

  public void setWidth(float val) {
    turtleStrokeWeight = val;
  }
  public void penDown() {
    pendown = true;
  }
  public void penUp() {
    pendown = false;
  }
  public void setColor(int val) {
    turtleStroke = colors[val];
  }

  public void setHeading(float val) {
    angle.set(0, 1);
    angle.rotate(-radians(val));
  }
}

abstract class Box {
  
  public int x, y;
  public color c;
  public String type;
  public boolean opened = false;
  public int digit;
  
  public Box(int x, int y) {
    this.x = x;
    this.y = y;
    this.c = color(191);
  }
  
  public void run() {
    update();
    show();
  }
  
  public void show() {
    fill(c);
    rect(x * scl, y * scl, scl, scl);
  }
  
  public void update() {
  }
  abstract public void searchBombs();
  abstract public void open();
  
}
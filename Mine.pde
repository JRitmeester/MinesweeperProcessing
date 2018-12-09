class Mine extends Box {
  
  //public color mineColour = color(192);
  
  public Mine(int x, int y) {
    super(x, y);
    //c = mineColour;
    type = "MINE";
  }
  
  public void open() {
    opened = true;
    c = color(#ff0000);
    gameOver = true;
  }
  
  public void searchBombs() {}
}
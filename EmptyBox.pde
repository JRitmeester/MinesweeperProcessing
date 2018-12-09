class EmptyBox extends Box {

  //public color emptyColor = color(13);
  public int digit;

  public EmptyBox(int x, int y) {
    super(x, y);
    //c = emptyColor;
    type = "EMPTY";
  }

  public void searchBombs() {
    int surroundingBombs = 0;
    for (int yy = y - 1; yy < y + 2; yy++) {
      if (yy < 0) break;
      if (yy >= h) break;
      for (int xx = x - 1; xx < x + 2; xx++) {
        if (xx < 0) break;
        if (xx >= w) break;
        if (xx + yy * w == x + y * w) continue;
        if (boxes[xx + yy * w].type.equals("MINE")) {
          surroundingBombs++;
        }
      }
    }
    digit = surroundingBombs;
  }

  public void show() {
    super.show();
    fill(0);
    textSize(scl/1.5);
    if (opened) text(digit, (x + 0.5) * scl, (y + 0.75) * scl);
  }

  public void open() {
    opened = true;
    score++;
    c = color(150);
    if (digit == 0) {
      for (int yy = y - 1; yy < y + 2; yy++) {
        if (yy < 0) continue;
        if (yy >= h) continue;
        for (int xx = x - 1; xx < x + 2; xx++) {
          if (xx < 0) continue;
          if (xx >= w) continue;
          if (boxes[xx + yy * w].type.equals("EMPTY") && !boxes[xx + yy * w].opened) {
              boxes[xx + yy * w].open();
          }
        }
      }
    }
  }
}
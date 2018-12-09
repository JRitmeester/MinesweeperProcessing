int scl = 40;
int w, h;
Box[] boxes;
boolean gameOver = false;
int score = 0;

public void setup() {
  size(1280, 720);
  w = width/scl;
  h = height/scl;
  boxes = new Box[w*h];

  rectMode(CORNER);
  textSize(scl/1.5);
  textAlign(CENTER);

  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int boxType = int(random(0, 1.2));

      if (boxType == 0) {
        boxes[x + y * w] = new EmptyBox(x, y);
      } else {
        boxes[x + y * w] = new Mine(x, y);
      }
    }
  }
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      if (boxes[x + y * w].type.equals("EMPTY")) {
        boxes[x + y * w].searchBombs();
      }
    }
  }
}

public void draw() {
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      boxes[x + y * w].run();
    }
  }

  if (gameOver) {
    textSize(40);
    text("GAME OVER", width/2, height/2);
    text(score, width/2, height/2 + scl);
  }
}

void keyPressed() {
  if (key == ' ') {
    boxes[mouseX / scl + (mouseY / scl * w)].c = color(#FF00FF);
  }
}

void mouseClicked() {
  int x = mouseX / scl;
  int y = mouseY / scl;
  if (!boxes[x + y * w].opened && !gameOver) {
    boxes[x + y * w].open();
  }
}
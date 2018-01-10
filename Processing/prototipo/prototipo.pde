final int SEQUENCE_LENGTH = 25;
final int TOTAL_TAKES = 35;

ArrayList<String> candidates;
long nextChangeMillis;
String currentNumber, currentSequence;

void setup() {
  size(800, 450);
  textFont(createFont("Courier", 32));

  currentSequence = "";
  currentNumber = "";

  candidates = new ArrayList<String>();
  for (int i=0; i<TOTAL_TAKES; i++) {
    candidates.add(((i<10)?" ":"")+Integer.toString(i));
  }
  nextChangeMillis = millis();
}

void update() {
  if (millis() > nextChangeMillis) {
    nextChangeMillis = millis() + 200;
    // last one, longer pause
    if (candidates.size() == (TOTAL_TAKES-SEQUENCE_LENGTH+1)) {
      nextChangeMillis = millis() + 2000;
    }
    // already played 25
    if (candidates.size() <= (TOTAL_TAKES-SEQUENCE_LENGTH)) {
      candidates.clear();
      for (int i=0; i<TOTAL_TAKES; i++) {
        candidates.add(((i<10)?" ":"")+Integer.toString(i));
      }
      println(currentSequence+"\n");
      currentSequence = "";
    }

    int ci = (int)random(candidates.size());
    currentNumber = candidates.get(ci);
    candidates.remove(ci);
    currentSequence += currentNumber+"  ";
  }
}

void draw() {
  update();
  background(0);

  textAlign(LEFT, TOP);
  text(currentSequence, width*0.04, 0, width*0.92, height);
  textAlign(CENTER, CENTER);
  text(currentNumber, width/2, height/2);
}


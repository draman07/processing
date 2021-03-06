void setup() {
  size(800, 500);
  background(255);
}

void draw() {
  CA ca = new CA();  
  while (ca.generation < height) {
    ca.generate();
    ca.display();
  }  
}

class CA {
  int[] cells; 
  int generation;  
  int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0};  
  int w = 10;

  CA() {
    cells = new int[width/w];
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1; 
    generation = 0;
  }

  void generate() {
    int[] nextgen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1]; 
      int me = cells[i];      
      int right = cells[i+1]; 
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;
    generation++;
  }

  void display() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(0);
      else               fill(255);
      noStroke();
      rect(i*w, generation*w, w, w);
    }
  }


  int rules(int a, int b, int c){
      String s = ""+ a + b + c;
      int index = Integer.parseInt(s, 2);
      return ruleset[index];
     }
}

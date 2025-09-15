//Initializing things
color sqColor; // for random color thing
int[] positions = new int[0];  // for "imposed structure" - new=makes a new "instance"

int sqX = 300;
int sqY = 300;
int sqW = 200;
int sqH = 200;

float sWeight = 3; // initializer, to change stroke weight 

void setup(){
  size(800,800);
  background(130,101,57); //brown
  sqColor = color(71,51,251);
  
  fill(255);
  textSize(12);
  text("Move your mouse to add dots across the background fabric.", 10, 20);
  text("Move the cursor over the middle square to randomize the color.", 10, 35);
  text("Press B on the keyboard to make the stroke size bigger.", 10, 50);
  text("Click on the screen to add a horizontal line of quilting.", 10, 65);
  text("Have fun!", 10, 80);
}

void moveMouse(){ // interaction for mouse press function set up 
  boolean insideRect = mouseX > sqX && mouseX < sqX + sqW && mouseY>sqY && mouseY<sqY+sqH;
  if (insideRect) {
    sqColor= color(random(255), random(255), random(255));
  }
}

void keyPressed(){ // b for bigger
 if (key == 'B' || key== 'b') {
   sWeight +=2;
 }
}
 
// if (key == 'S' || key== 's'){
//   sWeight -=5;
// }
//}
  
void draw(){

  strokeWeight(sWeight);
  
  // center square
  noStroke();
  //fill(71,51,251); //cobalt blue
  fill(sqColor);
  rect(300,300,200,200);
  
  // T1
  stroke(0);
  fill(255,241,78); //bright yellow 
  triangle(300,200,400,300,300,300);
  
  // T2
  fill(255,198,218); //light pink
  triangle(500,200, 500,300,400,300);
  
  // T3
  fill(72,135,41); // kelly green
  triangle(500,300,600,300,500,400);
  
  // T4
  fill(254,104,65); //bright orange 
  triangle(500,400,600,500,500,500);
  
  //T5
  fill(248,55,157); //barbie pink
  triangle(400,500,500,500,500,600);

  //T6
  fill(152,133,226); //light purple
  triangle(300,500,400,500,300,600);
  
  //T7
  fill(187,239,89); //neon green
  triangle(300,400,300,500,200,500);
  
  //T8
  fill(253,208,141); //peach skin
  triangle(200,300,300,300,300,400);
  
// interactions - points
 stroke(255);
 strokeWeight(4);
 point(mouseX,mouseY); 
 
// vertical lines for "Imposed Structure" requirement 
 stroke(200,230,200);
 strokeWeight(2);
 for (int i = 0; i < positions.length; i++) { // keeps the array going
   line(positions[i], 0, positions[i], height); //line(x1, y1, x2, y2)
 }
 
 moveMouse();

}

void mousePressed() { // when mouse is pressed,
  positions = append(positions, mouseX); //adds new value at the end of array
  positions = sort(positions); // sort the array 
}

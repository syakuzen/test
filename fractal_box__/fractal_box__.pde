int limit = 3;//細かさ
float len = 100;//辺の長さ
import processing.pdf.*;

float ang = radians(60);//角度

void setup(){
  size(800,600);
  background(0);
  smooth();
  beginRecord (PDF, "test.pdf");
  
}

void draw(){
  stroke(255);
  translate(400-len/2,600);
  background(0);
  noStroke();
  box(len);
}

void box(float len){
  rect(0,-len,len,len);
  if(len>limit){
 
    pushMatrix();
    translate(len,-len);
    rotate(ang);
    translate(-cos(ang)*len,0);
    box(cos(ang)*len);
    popMatrix();
    
    pushMatrix();
    translate(0,-len);
    rotate(-PI/2);
    rotate(ang);
    box(sin(ang)*len);
    popMatrix();
  
  }
}


/////コピペしたコード
void keyPressed() {
  if (key == CODED) {      // コード化されているキーが押された
    if (keyCode == RIGHT) {    // キーコードを判定
          ang+=0.01;
    } else if (keyCode == LEFT) {
           ang-=0.01;
    }
  }
}


    //クリックで書き出し
void mousePressed () {
    endRecord ();
    exit ();
}

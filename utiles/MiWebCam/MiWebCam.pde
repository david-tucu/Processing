import processing.video.*;
Capture cam;

String TITULO = "Mi WebCam"; //titulo
int NUM_CAM = 0; //Cambiar por si hay más de un dispotivo

void setup() {
  size(200, 200);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("No hay cámaras disponibles.");
    exit();
  } else {
    println("Cámaras disponibles:");
    for (int i = 0; i < cameras.length; i++) {
      println(i + ": " + cameras[i]);
    }
    cam = new Capture(this, cameras[NUM_CAM]);
    cam.start();
  }
  surface.setTitle(TITULO);
  surface.setAlwaysOnTop(true);
  surface.setResizable(true);
}

void draw() {
  background(0);
  if (cam.available()) {
    cam.read();
  }
  float w = cam.width;
  float h = cam.height;
  imageMode(CENTER);
  image(cam, width/2, height/2, w*height/h, height);
}

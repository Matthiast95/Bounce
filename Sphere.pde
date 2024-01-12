int rad = 60;        // Rayon de la sphère
float xpos, ypos, zpos;    // Position initiale de la sphère    

float xspeed = 2.8;  // Vitesse de la sphère
float yspeed = 2.2;  // Vitesse de la sphère
float zspeed = 3.0;  // Vitesse de la sphère dans la direction z

int xdirection = 1;  // Gauche ou Droite
int ydirection = 1;  // Haut en Bas
int zdirection = 1;  // Avant en Arrière

void setup() 
{
  size(640, 360, P3D);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Définir la position initiale de la sphère
  xpos = width / 2;
  ypos = height / 2;
  zpos = rad; // Assurez-vous que la sphère commence à l'intérieur de la fenêtre
}

void draw() 
{
  background(102);
  
  // Mettre à jour la position de la sphère
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);
  zpos = zpos + (zspeed * zdirection);
  
  // Vérifier si la sphère dépasse les limites de la fenêtre
  // Si c'est le cas, inverser sa direction en multipliant par -1
  if (xpos > width - rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height - rad || ypos < rad) {
    ydirection *= -1;
  }
  if (zpos > width/2 - rad || zpos < rad) {
    zdirection *= -1;
  }

  camera(width / 2.0, height / 2.0, (height / 2.0) / tan(PI/6), width / 2.0, height / 2.0, 0, 0, 1, 0);

  // Dessiner la sphère
  translate(xpos, ypos, zpos);
  sphere(rad);
}

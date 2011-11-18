var aSeeded1 = new algorithm({ seed: 42 });//,
    aSeeded2 = new algorithm({ seed: 42 }),
    aNonSeeded = new algorithm();
var img1 = createImage(400, 400, RGB),
    img2 = createImage(400, 400, RGB),
    img3 = createImage(400, 400, RGB);

void generateNoise(algorithm a, image im, int w, int h) {
    int i=0;
    for (int x=0; x<w; ++x) {
        for (int y=0; y<h; ++y, ++i) {
            var n = a.simplex2(x/100, y/100);
            im.pixels[i] = color(n*255, n*255, n*255);
        }
    }
}

void setup() {
    size(650,665);
	stroke(1);
	fill(0);
	frameRate(1);
    //aSeeded1.seedRandom(42);
    //aSeeded2.seedRandom(42);
    generateNoise(aSeeded1, img1, img1.width, img1.height);
    generateNoise(aSeeded2, img2, img2.width, img2.height);
    generateNoise(aNonSeeded, img3, img3.width, img3.height);
}

void draw() {
    background(#FFFFFF);
    
    image(img1, 0, 30, 300, 300);
    image(img2, 320, 30, 300, 300);
    image(img3, 0, 370, 300, 300);
    
    text("Seeded1 (42)",0,15);
    text("Seeded2 (42)",320,15);
    text("NonSeeded",0,355);

}

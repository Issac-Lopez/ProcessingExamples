 // by SamuelYAN
 // more works //
 // https://twitter.com/SamuelAnn0924
 // https://www.instagram.com/samuel_yan_1990/

 var ranges;
 let seed = Math.random() * 1241;

 // colors
 let colors1 = "fef9fb-fafdff-ffffff-fcfbf4-f9f8f6".split("-").map((a) => "#" + a);
 let colors2 = "8c75ff-c553d2-2dfd60-2788f5-23054f-f21252-8834f1-c4dd92-184fd3-f9fee2-2E294E-541388-F1E9DA-FFD400-D90368-e9baaa-ffa07a-164555-ffe1d0-acd9e7-4596c7-6d8370-e45240-21d3a4-3303f9-cd2220-173df6-244ca8-a00360-b31016".split("-").map((a) => "#" + a);
 let color1, color2;

 function setup() {
 	// pixelDensity(5);
 	randomSeed(seed);
 	createCanvas(windowWidth, windowHeight / 2);
 	background("#202020");
 	ranges = 200;
 	color1 = random(colors1);
 	color2 = random(colors2);

 }

 function draw() {

 	randomSeed(seed);
 	noiseSeed(seed);
 	background("#202020");
 	blendMode(DIFFERENCE);
 	noFill();
 	strokeWeight(random(1, 20));
 	for (let i = 0; i < ranges; i++) {
 		stroke(color2);
 		drawingContext.shadowColor = random(colors1);
 		drawingContext.shadowOffsetX = 1;
 		drawingContext.shadowOffsetY = 1;
 		drawingContext.shadowBlur = 0;
 		beginShape();
 		for (let x = -100; x < width + 200; x += 100) {
 			let n = noise(x * 0.001, i * 0.01, x * 0.02);
 			let y = map(n, 0, 1, 0, height * 1);
 			curveVertex(x, y);
 		}
 		endShape();
 	}
 	noLoop();
 }

 function keyTyped() {
 	if (key === "s" || key === "S") {
 		noLoop();
 		saveCanvas("0319_MetalWave_1.1_2022", "png");
 	}
 }

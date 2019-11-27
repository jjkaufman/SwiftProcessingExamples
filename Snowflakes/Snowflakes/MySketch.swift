import SwiftProcessing
import UIKit

class MySketch: Sketch, SketchDelegate{
    var snowflakes: [Snowflake] = []; // array to hold snowflake objects
    
    func setup() {
        fill(240, 240, 240);
        background(255, 0, 0)
        noStroke();
    }
    
    func draw() {
        let t = frameCount / 60; // update time
        
        text("\(Int((1.0/60.0) / deltaTime * 60)) fps", width * 0.5, height * 0.5)
        
        // create a random number of snowflakes each frame
        for i in 1...Int(random(2,5)) {
            snowflakes.append(Snowflake(self)); // append snowflake object
        }
        
        // loop through snowflakes with a for..of loop
        for (i, flake) in snowflakes.enumerated() {
            flake.update(t, i); // update snowflake position
            flake.display(); // draw snowflake
        }
    }
    
    // snowflake class
    class Snowflake {
        var posX: CGFloat = 0
        var posY: CGFloat = 0
        var initialangle: CGFloat = 0
        var size: CGFloat = 0
        var radius: CGFloat = 0
        var sketch: MySketch
        
        init(_ sketch: MySketch){
            self.sketch = sketch
            self.posX = 0;
            self.posY = sketch.random(-50, 0);
            self.initialangle = sketch.random(0, 2 * sketch.PI);
            self.size = sketch.random(2, 5);
            self.radius = sqrt(sketch.random(0, pow(sketch.width / 2, 2)));
            
        }
        // initialize coordinates
        
        // radius of snowflake spiral
        // chosen so the snowflakes are uniformly spread out in area
        
        func update(_ time: CGFloat, _ index: Int) {
            // x position follows a circle
            let w:CGFloat = 0.6; // angular speed
            let angle = w * time + self.initialangle;
            self.posX = sketch.width / 2 + self.radius * sin(angle);
            
            // different size snowflakes fall at slightly different y speeds
            self.posY += pow(self.size, 0.5) * sketch.deltaTime * 65;
            
            if (self.posY > sketch.height) {
                sketch.snowflakes.remove(at: index)
            }
        };
        
        func display() {
            sketch.ellipse(self.posX, self.posY, self.size);
        };
    }
    
    
    
}



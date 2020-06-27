import Foundation
import SwiftProcessing
import UIKit

class MySketch: Sketch,SketchDelegate {
    var camera: Camera!
    var vectors: [Vector] = []
    var photos: [Image] = []
    
    func setup() {
        self.camera = createCamera(FRONT)
    }
    
    func draw() {
        if vectors.count < 70 {
            vectors.append(createVector(random(0,self.width),0,random(4,15)))
            photos.append(camera.get())
        }
        for index in 0...vectors.count-1 {
            fill(251,248,241)
            rect(vectors[index].x-2, vectors[index].y-2, 35, 42)
            self.image(photos[index],vectors[index].x,vectors[index].y,31,31)
            vectors[index].y = vectors[index].y + vectors[index].z!
            if vectors[index].y > self.height {
                vectors[index] = createVector(random(0,self.width),0,random(4,15))
                photos[index] = camera.get()
            }
        }
    }
}

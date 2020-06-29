import Foundation
import SwiftProcessing
import UIKit

class MySketch: Sketch,SketchDelegate {
    var camera: Camera!

    func setup() {
        self.camera = createCamera(FRONT)
    }

    func draw() {
        self.camera.show()
        self.camera.size(self.width,self.height)
    }
}

import SwiftProcessing
import UIKit
import Foundation

class MySketch: Sketch, SketchDelegate{
    
    var camera: Camera!
    var photo: Image!
    var button: Button!
    var vectors: [Vector] = []
    var firstRun = true
    let hawaiiGif = Image(UIImage.gifImageWithURL("https://web.archive.org/web/20090728044700/http://www.geocities.com/jimaiton/hawaii360/images/A.Hula2.gif")!)
    let sunGIf = Image(UIImage.gifImageWithURL("https://web.archive.org/web/20090822005106im_/http://geocities.com/aughrim_cgi_guides/Games/sun.gif")!)
    let palmTreeGIf = Image(UIImage.gifImageWithURL("https://web.archive.org/web/20090831002154im_/http://geocities.com/cortiz2_99/images/plamtree.gif")!)
    
    func setup() {
        self.camera = createCamera(FRONT,1)
        self.button = createButton("Take Photo")
        self.button.backgroundColor(255, 0, 0)
        self.button.cornerRadius(10)
        
    }
    
    func draw() {
        
        if firstRun {
            for i in 0...25{
                vectors.append(createVector(random(0,self.width),random(self.height/2,self.height)))
            }
            self.firstRun = false
        }
        
        self.camera.position(0,0)
        self.camera.size(self.width,self.height/2)
        self.camera.show()
        self.camera.rotateCamera()
        self.button.position(self.width/2, self.height-100)
        self.button.touchStarted {
            self.photo = self.camera.get()
            let sizeOfPhoto = self.photo.size()
            let ratio = (self.height/2)/self.photo.size().height
            self.photo.resize(sizeOfPhoto.width*ratio,sizeOfPhoto.height*ratio)
        }
        
        if self.photo != nil {
            self.image(self.photo, (self.width-self.photo.size().width)/2, self.height/2)
            fill(255,0,0)
            triangle(self.width/2, self.height/2+30, self.width/2-50, self.height/2+150, self.width/2+50, self.height/2+150)
            fill(24,25,255)
            circle(self.width/2+4, self.height/2+60, 10)
            circle(self.width/2-10, self.height/2+78, 10)
            circle(self.width/2+19, self.height/2+98, 10)
            circle(self.width/2-27, self.height/2+110, 10)
            circle(self.width/2+29, self.height/2+129, 10)
            circle(self.width/2-17, self.height/2+127, 10)
            circle(self.width/2+40, self.height/2+142, 10)
            circle(self.width/2-25, self.height/2+135, 10)
            
        }
        
        self.image(hawaiiGif,self.width/2+self.width/7,self.height/2+self.height/7)
        self.image(hawaiiGif,self.width/2-self.width/7,self.height/2+self.height/7)
        self.image(sunGIf,self.width/2-self.width/4,self.height/2+self.height/12)
        let palmTreeGIf = Image(UIImage.gifImageWithURL("https://web.archive.org/web/20090831002154im_/http://geocities.com/cortiz2_99/images/plamtree.gif")!)
        for vector in vectors{
            self.image(palmTreeGIf,vector.x,vector.y)
        }
        
        if self.photo != nil {
            let sizeOfPhoto = self.photo.size()
            fill(255,255,255)
            rect(0, 0, (self.width-sizeOfPhoto.width)/2, self.height)
            rect(sizeOfPhoto.width+(self.width-sizeOfPhoto.width)/2, 0, (self.width-sizeOfPhoto.width)/2, self.height)
        }
        
    }
    
}

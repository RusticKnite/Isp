// allows us to import renders and audio from outside the shell
import Foundation 
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */


class Background : RenderableEntity {
    var backgroundMusic : Audio
    let crowdStands : Image
    let rightNet : Image 
    let leftNet : Image
    let fireworks : Image
    let redPlayer : Image
    let bluePlayer : Image
    let scoreboard : Image
    func clearCircle(canvas:Canvas, rect:Rect){
        let rectangle = Rectangle(rect:rect, fillMode:.clear)
        canvas.render(rectangle)
    }
    
    // renders for our background for our game

    func renderRectangleGround(canvas: Canvas, rect: Rect) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let fillStyle = FillStyle(color:Color(.green))
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(fillStyle, strokeStyle, rectangle)
    }

    func renderRectangleSky(canvas: Canvas, rect:Rect) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let fillStyle = FillStyle(color:Color(.lightblue))
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(fillStyle, strokeStyle, rectangle)
    }

    func renderRectangleBackgroundFoundation(canvas: Canvas, rect:Rect) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let fillStyle = FillStyle(color:Color(.lightgray))
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(fillStyle, strokeStyle, rectangle)
    }
    
    //lays out a foundation border that gives refrence to our other renders

    init() {

        // rendering our image and audio links

        backgroundMusic = Audio(sourceURL: URL(string: "http://commondatastorage.googleapis.com/codeskulptor-demos/pyman_assets/ateapill.ogg")!, shouldLoop: true)

        guard let crowdStandsURL = URL(string:"https://media.istockphoto.com/illustrations/audience-in-stadium-background-outdoor-version-illustration-id96612496?k=20&m=96612496&s=612x612&w=0&h=oxunjhq6ADKp2voaqGrY0rjpiIf2Z1cUXDetU0-Glnw=") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let rightNetURL = URL(string:"https://lh3.googleusercontent.com/pw/AM-JKLUB22D0ehrcqsWJxjXDbOSUrl9Tx4YyQ6NDn_CfLewUBCNxHJra9yR-09MFhQF_xCnmUR_WssVxoHlKsugJU9hikNqUpqqmvBYKbxQXEjnigc-_Rz7wNOcbwHzR9idWrHVYmuqP0mPf_xQsSS01gnNu=w234-h657-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let leftNetURL = URL(string:"https://lh3.googleusercontent.com/pw/AM-JKLXvx6V_O4xTqwlRrrM0K9yo4VFTg3CoXTM3kGvLRHxOM8WpjluROKdac7253SS1qP7_p3yngHkonTEPq5gUPuTnv2IQqBFqHUlR_6OAe9Y0W9H6g7mFYCxZNXP_NQ9Iue9-oXtCpuEuTswbfJDrL4Aw=w234-h657-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let fireworksURL = URL(string:"https://lh3.googleusercontent.com/pw/AM-JKLU3XKlPOlr6PfZ8i6SxC8VrM2yFFpq5A3_7PdnLX7WZFVUMs0Ii9rAwfOmuFBKTGPcKs15kVr0-wPGcac2hWQ_Z7HD8Y_M72IUreu5prftGXnMLFV6NvrIyocjKZ15CTOCsqdZQSUcYjhtPBkkg88sj=w598-h417-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let scoreboardURL = URL(string:"https://lh3.googleusercontent.com/pw/AM-JKLXgLqCoAdET7BJtCmStZcEkcANSMmFJx7I5ZSmO_GOAGW8VDKkCsbcFu2FsOm3DwiF31TCWulubSNGlLD1hUnCqjSj64AX9ONtE71UUC9XUYE37ORCBH3KzCBwi55_gKtPFS_bhAXktbjBi4OFpKVyN=w272-h185-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let redPlayerURL = URL(string:"https://lh3.googleusercontent.com/pw/AM-JKLVdYNXv0P7VjpKsT_3t1KhypHwfeu-KqrwyWhJjUvsUYnM7c4sknoRVTcAi_miA5xsoaM8rjBGGLLctUKzpkzoiZXuFXiGQvwKkCcBXFeBoYv-WVs2L8iLJDm8_-p9P7wtylthFDbkwB1pfBeeNTfHy=w186-h271-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let bluePlayerURL = URL(string:"https://lh3.googleusercontent.com/pw/AM-JKLUCHAvJxFsEvOmDUCoHPU0ZYU_70EbQn0pOvwPiX8AN0VYwvWvvsOy6gKmhDA1qsDL0idO1aZT79v8WRgOWyrtQMgGxUaWz4GdifKQaLkM1FosOUFhsc1mhNic9QRQCM1eq3j1CKxzI_P-tl_ince_q=w204-h248-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        crowdStands = Image(sourceURL:crowdStandsURL)
        rightNet = Image(sourceURL:rightNetURL)
        leftNet = Image(sourceURL:leftNetURL)
        fireworks = Image(sourceURL:fireworksURL)
        scoreboard = Image(sourceURL:scoreboardURL)
        redPlayer = Image(sourceURL:redPlayerURL)
        bluePlayer = Image(sourceURL:bluePlayerURL)
        // Using a meaningful name can be helpful for debugging

        super.init(name:"Background")
    }
    
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(backgroundMusic)
        canvas.setup(crowdStands)
        canvas.setup(rightNet)
        canvas.setup(leftNet)
        canvas.setup(fireworks)
        canvas.setup(scoreboard)
        canvas.setup(redPlayer)
        canvas.setup(bluePlayer)
    }
    
    override func render(canvas: Canvas) {
        // Shape renders

        let clears = Rect(topLeft:Point(x:0, y:0), size:Size(width:5000, height:5000))
        clearCircle(canvas: canvas, rect: clears)

        let ground = Rect(topLeft:Point(x:-10, y:450), size:Size(width:5000, height:5000))
        renderRectangleGround(canvas: canvas, rect: ground)

        let sky = Rect(bottomLeft:Point(x:-10, y:450), size:Size(width:5000, height:5000))
        renderRectangleSky(canvas:canvas, rect:sky)

        let sun = Ellipse(center:Point(x:55, y:55), radiusX:50, radiusY:50, fillMode:.fill)
        let sunColor = FillStyle(color:Color(.yellow))

        let building1 = Rect(bottomLeft:Point(x:0, y:450), size:Size(width: 3000, height: 250))
        renderRectangleBackgroundFoundation(canvas:canvas, rect:building1)

        canvas.render(sunColor, sun)

        // Rendering our audio and images

        if backgroundMusic.isReady {
            canvas.render(backgroundMusic)       
        }
        
        if crowdStands.isReady {
            crowdStands.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width:500, height:450)))
            canvas.render(crowdStands)
        }
        
        if crowdStands.isReady {
            crowdStands.renderMode = .destinationRect(Rect(topLeft:Point(x:450, y:0), size:Size(width:500, height:450)))
            canvas.render(crowdStands)
        }
        
        if crowdStands.isReady {
            crowdStands.renderMode = .destinationRect(Rect(topLeft:Point(x:900, y:0), size:Size(width:500, height:450)))
            canvas.render(crowdStands)
        }
        
        if crowdStands.isReady {
            crowdStands.renderMode = .destinationRect(Rect(topLeft:Point(x:1350, y:0), size:Size(width:500, height:450)))
            canvas.render(crowdStands)
        }
        
        if crowdStands.isReady {
            crowdStands.renderMode = .destinationRect(Rect(topLeft:Point(x:1800, y:0), size:Size(width:500, height:450)))
            canvas.render(crowdStands)
        }
        
        if scoreboard.isReady {
            scoreboard.renderMode = .destinationRect(Rect(topLeft:Point(x:700, y:275), size:Size(width:400, height:200)))
            canvas.render(scoreboard)
        }
        
        if redPlayer.isReady {
            redPlayer.renderMode = .destinationRect(Rect(topLeft:Point(x:650, y:275), size:Size(width:125, height:250)))
            canvas.render(redPlayer)
        }
        
        if bluePlayer.isReady {
            bluePlayer.renderMode = .destinationRect(Rect(topLeft:Point(x:1000, y:275), size:Size(width:150, height:250)))
            canvas.render(bluePlayer)
        }
        
        if rightNet.isReady {
            rightNet.renderMode = .destinationRect(Rect(topLeft:Point(x:1675, y:50), size:Size(width:250, height:950)))
            canvas.render(rightNet)
        }
        
        if leftNet.isReady {
            leftNet.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:50), size:Size(width:250, height:950)))
            canvas.render(leftNet)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:200, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:400, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:600, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:800, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:1000, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:1200, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:1400, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        canvas.render(sunColor, sun)
        
        
    }

    
}

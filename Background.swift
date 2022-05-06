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
        
        guard let rightNetURL = URL(string:"https://i.postimg.cc/LXnscb86/115-1157004-soccer-goal-top-png-okayama-removebg-preview.png") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let leftNetURL = URL(string:"https://i.postimg.cc/SRxGbqzY/download.png") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let fireworksURL = URL(string:"https://i.postimg.cc/htDQCMTh/fireworks-clipart-new-year-fireworks-clipart-nature-outdoors-transparent-png-1043354-removebg-previe.png") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let scoreboardURL = URL(string:"https://i.postimg.cc/BQKfrG5V/images-removebg-preview.png") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let redPlayerURL = URL(string:"https://i.postimg.cc/wBy6jsD9/download-1-1-removebg-preview.png") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let bluePlayerURL = URL(string:"https://i.postimg.cc/sD7HsfMb/download-2-removebg-preview-1-removebg-preview.png") else {
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

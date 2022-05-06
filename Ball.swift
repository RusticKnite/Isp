import Scenes
import Igis
import Foundation

class Ball: RenderableEntity {

    let ellipse = Ellipse(center:Point(x:0, y:0), radiusX:45, radiusY:45, fillMode:.fillAndStroke)
    let strokeStyle = StrokeStyle(color:Color(.black))
    let fillStyle = FillStyle(color:Color(.darkblue))
    let lineWidth = LineWidth(width:5)
    var velocityX : Int
    var velocityY : Int
    var leftCurrentScore = 0
    var leftScore: Text
    var rightCurrentScore = 0
    var rightScore: Text
    var compressedCounter : UInt  
    var textDisplay = false
    func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
    }
    // initilaizing velocity of ball and the score for the scoreboard
    init() {
        velocityX = 0
        velocityY = 0
        compressedCounter = 0
        leftScore = Text(location: Point(x:500, y: 50), text: "")
        leftScore.font = "10pt Arial"
        rightScore = Text(location: Point(x:750, y: 50), text: "")
        rightScore.font = "10pt Arial"
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Ball")
    }
    
    override func setup(canvasSize: Size, canvas: Canvas) {
        // Position the ellipse at the center of the canvas
        ellipse.center = canvasSize.center
    }

    // Removed this in order to make ball independent from the cursorx
    //override func teardown() {
    //  dispatcher.unregisterMouseMoveHandler(handler:self)
    //}

    func interactionLayer() -> InteractionLayer{
        guard let layer = layer as? InteractionLayer else {
            fatalError("InteractionLayer required")
        }
        return layer
    }
    
    override func render(canvas:Canvas) {
        canvas.render(strokeStyle, fillStyle, lineWidth, ellipse)
        let strokeStyleR = FillStyle(color:Color(.red))
        let strokeStyleB = FillStyle(color:Color(.blue))
        let lineWidth = LineWidth(width:5)
        leftScore = Text(location: Point(x:820, y:400), text: "\(leftCurrentScore)")
        rightScore = Text(location: Point(x:940, y:400), text: "\(rightCurrentScore)")
        canvas.render(strokeStyleR, lineWidth, leftScore)
        canvas.render(strokeStyleB, lineWidth, rightScore)
    }

    override func boundingRect() -> Rect {
        let topLeft = ellipse.center - Point(x: ellipse.radiusX, y: ellipse.radiusY)
        let size = Size(width: 2 * ellipse.radiusX, height: 2 * ellipse.radiusY)
        return Rect (topLeft: topLeft, size: size)
    }

    // calculates 
    override func calculate(canvasSize: Size) {
        ellipse.center += Point(x: velocityX, y: velocityY)

        // First, move to the new position
        ellipse.center += Point(x:velocityX, y:velocityY)

        // Form a bounding rectangle around the canvas
        let canvasBoundingRect = Rect(size:canvasSize)

        // Form a bounding rect around the ball (ellipse)
        let ballBoundingRect = Rect(topLeft:Point(x:ellipse.center.x-ellipse.radiusX, y:ellipse.center.y-ellipse.radiusY),
                                    size:Size(width:ellipse.radiusX*2, height:ellipse.radiusY*2))

        // Determine if we've moved outside of the canvas boundary rect
        let tooFarLeft = ballBoundingRect.topLeft.x < canvasBoundingRect.topLeft.x
        let tooFarRight = ballBoundingRect.topLeft.x + ballBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width

        let tooFarUp = ballBoundingRect.topLeft.y < canvasBoundingRect.topLeft.y
        let tooFarDown = ballBoundingRect.topLeft.y + ballBoundingRect.size.height > canvasBoundingRect.topLeft.y + canvasBoundingRect.size.height

        // If we're too far to the left or right, we bounce the x velocity
        if tooFarLeft || tooFarRight {
            velocityX = -velocityX - 4

            ellipse.radiusX = 35
            ellipse.radiusY = 60

            compressedCounter = 10

            if tooFarLeft {
                InteractionLayer().incrementRightScore()
                rightCurrentScore += 1
                ellipse.center = canvasSize.center                
                velocityX = 5
                velocityY = 5
            } else {
                InteractionLayer().incrementLeftScore()
                leftCurrentScore += 1
                ellipse.center = canvasSize.center
                velocityX = 5
                velocityY = 5
            }
            print("increment score")
        }

        if tooFarUp || tooFarDown {
            velocityY = -velocityY - 4

            ellipse.radiusX = 60
            ellipse.radiusY = 35


            compressedCounter = 10
        }

        if compressedCounter == 0 {
            ellipse.radiusX = 45
            ellipse.radiusY = 45
        }else{
            compressedCounter -= 1
        }

    }
}

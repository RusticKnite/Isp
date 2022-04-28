import Scenes
import Igis
/*
 This class is responsible for the interaction Layer.
 Internally, it maintains the RenderableEntities for this layer.
 */


class InteractionLayer : Layer, KeyDownHandler {
    var canvasSize = Size(width: 0, height: 0)

    let ball = Ball()
    let paddleLeft = Paddle(rect:Rect(size:Size(width:25, height:150)))
    let paddleRight = Paddle(rect:Rect(size:Size(width:25, height:150)))
    
    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")

        // We insert our RenderableEntities in the constructor
        insert(entity: ball, at: .front)
        ball.changeVelocity(velocityX: 4, velocityY: 3 )
        insert(entity: paddleLeft, at: .front)
        insert(entity: paddleRight, at: .front)
        
    }

    // sets the controls and keys for our paddles going up and down both on the left and the right side
    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        let movement = 50
        switch(key) {
        case "w" :
            //left paddle up
            if paddleLeft.rectangle.rect.topLeft.y >= 50 {
                paddleLeft.move(to:Point(x: paddleLeft.rectangle.rect.topLeft.x, y: paddleLeft.rectangle.rect.topLeft.y - movement))
            }
        case "s" :
            //left paddle down
            if paddleLeft.rectangle.rect.topLeft.y <= canvasSize.height - paddleLeft.rectangle.rect.height - 50 {
                paddleLeft.move(to:Point(x: paddleLeft.rectangle.rect.topLeft.x, y: paddleLeft.rectangle.rect.topLeft.y + movement))
            }
        case "i" :
            //right paddle up
            if paddleRight.rectangle.rect.topLeft.y >= 50 {
                paddleRight.move(to:Point(x: paddleRight.rectangle.rect.topLeft.x, y: paddleRight.rectangle.rect.topLeft.y - movement))
            }
        case "k" :
            //right paddle down
            if paddleRight.rectangle.rect.topLeft.y <= canvasSize.height - paddleRight.rectangle.rect.height - 50 {
                paddleRight.move(to:Point(x: paddleRight.rectangle.rect.topLeft.x, y: paddleRight.rectangle.rect.topLeft.y + movement))
            }
        default:
            ""
        }
        print("key: \(key), code: \(code), ctrlKey: \(ctrlKey), shiftKey: \(shiftKey), altKey: \(altKey), metaKey: \(metaKey)")
    }


    override func preSetup(canvasSize: Size, canvas: Canvas) {
        self.canvasSize = canvasSize
        paddleLeft.move(to:Point(x: 10, y: canvasSize.center.y))
        paddleRight.move(to:Point(x: canvasSize.width - 20,  y: canvasSize.center.y))
        dispatcher.registerKeyDownHandler(handler: self)
    }

    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }

    func mainScene() -> MainScene {
        guard let scene = scene as? MainScene else {
            fatalError("MainScene required")
        }
        return scene
    }
    
    func incrementLeftScore() {
        MainScene().incrementLeftScore()
    }

    func incrementRightScore() {
        MainScene().incrementRightScore()
    }

    //tells us when either the left or right paddle is impacted
    override func preCalculate(canvas: Canvas) {
        let ballBoundingRect = ball.boundingRect()

        let leftPaddleBoundingRect = paddleLeft.boundingRect()
        let leftPaddleContainment = leftPaddleBoundingRect.containment(target: ballBoundingRect)
        let leftPaddleTargetContainmentSet: ContainmentSet = [.overlapsRight, .contact]

        if leftPaddleTargetContainmentSet.isSubset(of: leftPaddleContainment){
            print("LEFT PADDLE IMPACTED")
            ball.velocityX = -ball.velocityX
        }

        let rightPaddleBoundingRect = paddleRight.boundingRect()
        let rightPaddleContainment = rightPaddleBoundingRect.containment(target: ballBoundingRect)
        let rightPaddleTargetContainmentSet: ContainmentSet = [.overlapsLeft, .contact]

        if rightPaddleTargetContainmentSet.isSubset(of: rightPaddleContainment){
            print("RIGHT PADDLE IMPACTED")
            ball.velocityX = -ball.velocityX
        }
    }
    
}

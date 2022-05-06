import Igis
import Scenes

class Paddle: RenderableEntity {
    var rectangle: Rectangle

    init(rect:Rect) {
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)

        // Using a meaningful name can be helpful for debugging
        super.init(name: "Paddle")
    }

    override func render(canvas:Canvas) {
        let color = FillStyle(color:Color(red:254, green:74, blue:73))
        canvas.render(color)
        let strokeStyle = StrokeStyle(color:Color(.black))
        //        let fillStyle = FillStyle(color:Color(color))
        let lineWidth = LineWidth(width:2)
        canvas.render(strokeStyle, color, lineWidth, rectangle)
    }

    func move(to point:Point) {
        rectangle.rect.topLeft = point
    }
    override func boundingRect() -> Rect {
        return rectangle.rect
    }
// Calculates are bounding function
    override func calculate(canvasSize: Size) {
        let canvasBoundingRect = Rect(size:canvasSize)
        let paddleBoundingRect = Rect(topLeft:Point(x:rectangle.rect.center.x, y: rectangle.rect.center.y), size:Size(width:rectangle.rect.width, height: rectangle.rect.height))
    }
}

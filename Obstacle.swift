import Igis
import Scenes

class Obstacle: RenderableEntity {
    var rectangle: Rectangle

    init(rect:Rect) {
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)

        // Using a meaningful name can be helpful for debugging
        super.init(name: "Obstacle")
    }
// adds obstacles but we decided to not initate this code for our final presentation due to timeline and bugs
    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.red))
        let lineWidth = LineWidth(width:4)
        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
    }
    override func boundingRect() -> Rect {
        return rectangle.rect
    }
    func move(to point:Point) {
        rectangle.rect.topLeft = point
    }
    override func calculate(canvasSize: Size) {
        let canvasBoundingRect = Rect(size:canvasSize)
        let paddleBoundingRect = Rect(topLeft:Point(x:rectangle.rect.center.x, y: rectangle.rect.center.y), size:Size(width:rectangle.rect.width, height: rectangle.rect.height))
    }
}

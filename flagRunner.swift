import Igis
import Scenes
import Foundation

class flagRunner: RenderableEntity {
    var rectangle: Rectangle
    var flagRunner : Image
    var x = 0
    var y = 350

    func renderRectangleFoundation(canvas: Canvas, rect: Rect) {
        let lineWidth = LineWidth(width: 5)
        let strokeStyle = StrokeStyle(color:Color(.red))

        let rectangle = Rectangle(rect:rect, fillMode: .stroke)
        canvas.render(strokeStyle, lineWidth, rectangle)
    }

    init(rect:Rect) {

        guard let flagRunnerURL = URL(string:"https://lh3.googleusercontent.com/pw/AM-JKLWvcAlOKDrJ4YjD8N3QYsQNGTnnEOaxjstaXSTVu-Ueh3iR4CpWIdI7M9gT0f3SV9NFSjH02YynY-EauC9alWvi4vYKtNb2kL95aTJfnlZcZO8VkT6FAv0u4rhrr1Yk54SmTgYKEzPD8aA3tzcc52ih=w500-h499-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }

        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        flagRunner = Image(sourceURL:flagRunnerURL)
        // Using a meaningful name can be helpful for debugging
        super.init(name: "flagRunner")
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(flagRunner)
    }
    override func calculate(canvasSize:Size) {
        let canvasRect = Rect(size:canvasSize)

        if x < canvasRect.topLeft.x + canvasSize.width {
            x += 5
        } else {
            y = 350 //Int.random(in: 0 ..< canvasRect.topLeft.y + canvasSize.height + 300)
            x = 0
        }
    }
    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:2)
        if flagRunner.isReady {
            flagRunner.renderMode = .destinationRect(Rect(topLeft:Point(x:x, y:y), size:Size(width:200, height:200)))
            let border = StrokeStyle(color:Color(.red))
            canvas.render(strokeStyle, fillStyle, lineWidth, flagRunner)
        }

        //       canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)

    }
}


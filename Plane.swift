import Igis
import Scenes
import Foundation

class Plane: RenderableEntity {
    var rectangle: Rectangle
    var plane : Image
    var x = 0
    var y = 0

    func renderRectangleFoundation(canvas: Canvas, rect: Rect) {
        let lineWidth = LineWidth(width: 5)
        let strokeStyle = StrokeStyle(color:Color(.red))

        let rectangle = Rectangle(rect:rect, fillMode: .stroke)
        canvas.render(strokeStyle, lineWidth, rectangle)
    }

    init(rect:Rect) {

        guard let planeURL = URL(string:"https://lh3.googleusercontent.com/pw/AM-JKLWdH4o3QZUO9Kwx0byfqlL-od2FvfpLYW6S9Z564i4mWJHuqu4so4YZnJSEof_FHwkO6ddv1m_pZaqWbSi4iNC7w9c22QblhjfHwU9e0ydJ3muUb1N9mxDqF_m2lZHJE4OfXDuDOwAScddF6lENjm7r=w283-h178-no?authuser=0") else {
                                        fatalError("Failed to create URL for whitehouse")
        }

        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        plane = Image(sourceURL:planeURL)
        // Using a meaningful name can be helpful for debugging
        super.init(name: "Plane")
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(plane)
    }
    override func calculate(canvasSize:Size) {
        let canvasRect = Rect(size:canvasSize)

        if x < canvasRect.topLeft.x + canvasSize.width {
            x += 10
        } else {
            y = 0//Int.random(in: 0 ..< canvasRect.topLeft.y + canvasSize.height + 300)
            x = 0
        }
    }
    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        //        let x =
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:2)
        if plane.isReady {
            plane.renderMode = .destinationRect(Rect(topLeft:Point(x:x, y:y), size:Size(width:200, height:200)))
            let border = StrokeStyle(color:Color(.red))
            canvas.render(strokeStyle, fillStyle, lineWidth, plane)
        }

        //       canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)

    }
}

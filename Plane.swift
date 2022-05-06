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

        guard let planeURL = URL(string:"https://lh3.googleusercontent.com/MmUrhsgFU6jN6EZ9xx9vLfZBBl2r3asGFGF1VTxoONVNLuat8J31aPbefM8bvRpaoNpaWxRJd4eGfVMt2wzUf5eTENKikjAgMMjaT7QTATC3NlI7gkESxfDs_gSJPrddDaSyq6JflRPuzg8L8ml8ZJtrB6cFONQ3JU9mP_HRaWPotSzPOizRH9KcCf6GkmX2vw6iH4thUCOLfR21KIgC5jGfx6NZ4WLIDWShFY3yNZ_RwjAV45n1cQhk6_fwFrsM1n-ghXY40VIIgvunzbqIFLkrSsQDBkf_ZDMPLY8_RHqxYdboFUtWEaalD2JLPBiTwweJGbnVoKuexYecHhb-t_Q6ktWAeV4HATGUbd4FR1X-Yq0LhBZWMMSJ_VgKkHNDehd4dBqH8YeCTu0T0oJxPgdiZf6V9tv2er7qJOpFWPU0Qh_TqqJowWagGhnMzUs7nNHhz4zmGhc_hJOqzG4QcSoxxRin4_AcxRzCHzE7zqUlvkeBWCYty5PJh-bVvN5F-WCTNN5ICED5wuWdRdXG7OcVfmqC1yG6Sg_tLe3-dCqNDxCIZSd4y2VT5-pxabFkgCt5TvulR6KUg8y1TLkFx1pN9n01Z8h8oiBL0A5ecNjIORz3LGLiEgdw8Jrjv07yyFvujH0Q4j7ET72t_3XCumutQMN0JNj7evnyF--IwCUDzt7Rqna6JIVScUbgRXBkDcp7UZ4_28BpuH_tLdEBZGSpoKZCINq8MAql35cuaBIbTG6KrGPk4cKXHYA=w283-h178-no?authuser=0") else {
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

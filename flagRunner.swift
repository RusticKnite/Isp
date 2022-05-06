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

        guard let flagRunnerURL = URL(string:"https://lh3.googleusercontent.com/FNylr3cG5U7YmeW1l9L1xR26_R-aEJXIp6kHQG6jQ_Gmmi5EgSPJGx-e1COaqQKGZ_IKrn_5rSZtZ5uTyrunqaSs9Me9nutinZleZB8LDATgPrT9MPX7Gp7tDxrhLPjIw2SZDcFrmLQUESyd9EiRAvRrJQz1zLItJgF7aKqp4H-FO8_nZ63dDRULpKnfEIdy7EYYFzs7CZe83855gbkKJlN4ZtDMhXwLcjgw2FG2YG2b9tzympy5V-4D7nUCHkCcyid-MxCjj0LIZZwcfnx3fbKBSORxU-SuAyfV9-B5fw-kJ3fjsEtumVpgwqQElLNonuXguw2EcyQmNgHp9dTsmhTIYWj-S3H3ONinrGDGqTnVTs4KSqapNJNi2mSjDDIGzx_MlotSBHujHqQuoOdzsMQPhQGOxhqcyKC3fR7A7l9yNTJCmu6n2Ea9uC-Qlc5G8J8fsDV_Xt_Mibsk_r32V8vLS0drg-s5Qft5L8yQSNXk0dpC9BZod-exrzE1SANviZOn8HyrdtpJeFIiyrHAwfedhUEc0WyDD5KGT_2XGfIi9jzu-g-hW2qgTKZ2kFbfYCv6kpmti53Xc7RFCjam8XiMEAmBLowDmN2lMEPk3mB9uwjEAVGUoT9o0H8nq7cRBfCy6gBKfSpU1SHgHccMfVZPWOcmr_tO9UAEeHXfwI8LKWTKVk9zkuFIXRy2QWsXsSeNyiSZ2Fq8cqsz37x_H7c77sW_qSKVUDYR4Qwk4Yr5Ud2r54fiAp0W5uI=w500-h499-no?authuser=0") else {
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


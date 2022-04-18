import Foundation 
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let whitehouse : Image
    let whitehouse2: Image
    func clearCircle(canvas:Canvas, rect:Rect){
        let rectangle = Rectangle(rect:rect, fillMode:.clear)
        canvas.render(rectangle)
    }

    func renderRectangleG(canvas: Canvas, rect: Rect) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let fillStyle = FillStyle(color:Color(.green))
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(fillStyle, strokeStyle, rectangle)
    }

    func renderRectangleS(canvas: Canvas, rect:Rect) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let fillStyle = FillStyle(color:Color(.lightblue))
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(fillStyle, strokeStyle, rectangle)
    }

    func renderRectangleB1(canvas: Canvas, rect:Rect) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let fillStyle = FillStyle(color:Color(.lightgray))
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(fillStyle, strokeStyle, rectangle)
    }
    
      init() {
          guard let whitehouseURL = URL(string:"https://e0.365dm.com/21/02/2048x1152/skysports-manchester-city-fans_5281711.jpg") else {
              fatalError("Failed to create URL for whitehouse")
          }
          whitehouse = Image(sourceURL:whitehouseURL)
          guard let whitehouseURL = URL(string:"https://o.remove.bg/downloads/8d2fadf0-9c51-4b4a-8bf6-8053269938af/image-removebg-preview.png") else {
              fatalError("Failed to create URL for whitehouse")
          }
          whitehouse2 = Image(sourceURL:whitehouseURL)
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }
      override func setup(canvasSize:Size, canvas:Canvas) {
          canvas.setup(whitehouse)
          canvas.setup(whitehouse2)
      }
      override func render(canvas: Canvas) {
          let clears = Rect(topLeft:Point(x:0, y:0), size:Size(width:5000, height:5000))
          clearCircle(canvas: canvas, rect: clears)
          let ground = Rect(topLeft:Point(x:-10, y:450), size:Size(width:5000, height:5000))
          renderRectangleG(canvas: canvas, rect: ground)
          let sky = Rect(bottomLeft:Point(x:-10, y:450), size:Size(width:5000, height:5000))
          renderRectangleS(canvas:canvas, rect:sky)
          let sun = Ellipse(center:Point(x:55, y:55), radiusX:50, radiusY:50, fillMode:.fill)
          let sunColor = FillStyle(color:Color(.yellow))
          let building1 = Rect(bottomLeft:Point(x:0, y:450), size:Size(width: 3000, height: 250))
          renderRectangleB1(canvas:canvas, rect:building1)
          canvas.render(sunColor, sun)
          if whitehouse.isReady {
              whitehouse.renderMode = .destinationRect(Rect(topLeft:Point(x:100, y:150), size:Size(width:300, height:300)))
              canvas.render(whitehouse)
          }
          if whitehouse2.isReady {
              whitehouse2.renderMode = .destinationRect(Rect(topLeft:Point(x:450, y:150), size:Size(width:300, height:300)))
              canvas.render(whitehouse2)
          }
      }

      
}

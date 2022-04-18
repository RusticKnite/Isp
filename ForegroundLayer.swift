import Scenes
import Igis
  /*
     This class is responsible for the foreground Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class ForegroundLayer : Layer {

    let leftScoreBoardRect = Rect(topLeft: Point(x: 100, y: 50), size: Size(width: 50, height: 100))
    let rightScoreBoardRect = Rect(topLeft: Point(x: 900, y:50), size: Size(width: 50, height: 100))


    let leftScore : Scoreboard
    let rightScore : Scoreboard

    
      init() {
           //Using a meaningful name can be helpful for debugging
          leftScore = Scoreboard(rect: leftScoreBoardRect)
          rightScore = Scoreboard(rect: rightScoreBoardRect)
          super.init(name:"Foreground")

          // We insert our RenderableEntities in the constructor
          insert(entity:leftScore, at:.front)
          insert(entity:rightScore, at:.front)
          
          // We insert our RenderableEntities in the constructor

      }
      func incrementLeftScore() {
          leftScore.incrementScore()
      }
      func incrementRightScore() {
          rightScore.incrementScore()
      }
      override func preSetup(canvasSize: Size, canvas: Canvas) {
          leftScore.move(to:Point(x: 100, y: canvasSize.center.y))
          rightScore.move(to:Point(x: 900, y: canvasSize.center.y))
          print("canvasSize.width: \(canvasSize.width)")
      }
      
  }

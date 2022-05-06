// allows us to import renders and audio from outside the shell
import Foundation 
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */


class Background : RenderableEntity {
    var backgroundMusic : Audio
    let crowdStands : Image
    let rightNet : Image 
    let leftNet : Image
    let fireworks : Image
    let redPlayer : Image
    let bluePlayer : Image
    let scoreboard : Image
    func clearCircle(canvas:Canvas, rect:Rect){
        let rectangle = Rectangle(rect:rect, fillMode:.clear)
        canvas.render(rectangle)
    }
    
    // renders for our background for our game

    func renderRectangleGround(canvas: Canvas, rect: Rect) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let fillStyle = FillStyle(color:Color(.green))
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(fillStyle, strokeStyle, rectangle)
    }

    func renderRectangleSky(canvas: Canvas, rect:Rect) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let fillStyle = FillStyle(color:Color(.lightblue))
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(fillStyle, strokeStyle, rectangle)
    }

    func renderRectangleBackgroundFoundation(canvas: Canvas, rect:Rect) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let fillStyle = FillStyle(color:Color(.lightgray))
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(fillStyle, strokeStyle, rectangle)
    }
    
    //lays out a foundation border that gives refrence to our other renders

    init() {

        // rendering our image and audio links

        backgroundMusic = Audio(sourceURL: URL(string: "http://commondatastorage.googleapis.com/codeskulptor-demos/pyman_assets/ateapill.ogg")!, shouldLoop: true)

        guard let crowdStandsURL = URL(string:"https://media.istockphoto.com/illustrations/audience-in-stadium-background-outdoor-version-illustration-id96612496?k=20&m=96612496&s=612x612&w=0&h=oxunjhq6ADKp2voaqGrY0rjpiIf2Z1cUXDetU0-Glnw=") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let rightNetURL = URL(string:"https://lh3.googleusercontent.com/EEH2D8Mdmgkxh5hgvCT2J_yTiY3YxRdjw-9jovCN5enDgd7N42mwZ_P9eY4C02sIL5GudL2y-Rip45MOVh5bRCnZMLcuF-1Zw3wE0DpO1S1LJm99Z-nTix47FUlxHJPOBciJMgulQQnfXqeK6e1QUjGSt-0Bzs_npTj_0Ma-4EpUi9IzHDvgj87v58Wm1nhGe9hYk2mAy8AjJlTEDx17Xpcort239lgRFtPO4MlG0dK9oW-l31d6Luw35zjubG2dT17oufsAY_c6SFgs4UopJshgZGePFS6dcSVgFsrpWJVZALZFFbO9bs9Va11-kvlVmwSqDGNqkyma3wNd5FstuBMfvHhIOmaWGNpySBNG4uxSfXvR60MYlb1TPacdiOkL83P-bF7oD1L_J5WQod4ly7UqZo9pwZdjOE6UAENnr7eJylpMeOQFXmwin_Iijoqj_0WweT3FVPFX4AxTHQDBWpckG4REmI77xSSlSZswg8kxjOSwg1cHt5EpwVbICljQ9rSNv2cnxgqNS1dIlGr9zrMva9Zj92K_zTNikFR8BQnnztxYNLOWnTBsRlFl1DSgHkmsuJoO7fxW2pByPbZ2N6RmcshCGjDP_SFNIpV9EPYzsavtzFwHEU-_edn-a1P9AJdiDmPlLLcFJovssXt3eIFHqJmEzRjytgjJvgzkocPhdxzl_S7lz-Gl5Yf0vPeVQYoAlAx1iw5XGFBrRBNUsn9P9k8R-3DnMMOj3oouphJdUHYfmmxWvBp2-Jg=w298-h838-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let leftNetURL = URL(string:"https://lh3.googleusercontent.com/5Ut5J4V9iN5aj0EoGEO7cQ_vfYfwfo6neQ3Lo82SB5_0p1cSPS8cbT012TarcY2uHgM3XbT79gUUGbNfexyH_nIcu44DrTCraN4JJJzS88KL8xGeWqKHLLYiEuu6PnCnrxhdOV73k5dFuiQNgRMINkwSqcXc57oVPWzK1oBwJkN6B6tj3CPkV_wRznYjoYwCriSceKkF3txE7ynFDCyn1UcJS1eGnqq4gH-Xu9ELflTbqHVsAfnAJa6-DAiQUSAEcDjK_fEEcuYrZS5WBzZRKDseeUf8vqp64IufEVrqVEHtPoonb0PqKWdHDB09GhjCkXxZqCfATPUfjxoSF_ZWob8SoxOaE2tc3C4-VDrza6NABxgMoYdRmMD0PFl-aZyQb9SNJz-ySWC2rAL67-3V1BX-xjPeZWzJ2AfIhR4_7V4CicILnvoAjJJUHyAjpWBNxqh4fxq2GRx1__qWXmuIbh9eh1Rd4z6nGAogx3acAlhwmyWO_kp4I-cVvsbpRxLrmBJ_NIy2OJMCBTbcue3vPQflKcybYY4AlPbqNUXexhLM9JaZjwddloiNC-bzPCHO2DyCV4YDUWsDY6oVCLx-9EVB4GWciJ3llJci3tLHvY9P8EPa8itRKKFUH_rWK8J2dj_KbtNBHgh8aCsXIFTN-Zt3v7HwNOb_gBnJo4XQpZN-vE2iQleLqUvxQ_N6eWnjaZnySmvaY6HJCW2dnG9vufcc483qmmQYwxq9Wimyd_GxaO4UJX3KfLBGpAg=w298-h838-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let fireworksURL = URL(string:"https://lh3.googleusercontent.com/S4sz3MRYD9lZB_tY_QSJzdthHFmZMUCBVk2NqSWdMXz809saBnxO-TpMWm8MHDVDSTWgmddkNmnkxGaDp9iWvC5bIm6Ki0C_X3uR2a4-2DlZBXsr9Uc7ia5_ngwFANM0HXVOcvoDeshab9qppBa5JtLPmDJLNxmcfK7Pq4LRREJuQUtGcEh8EiSbMgrEJy5vLfQcJsoGlHx_qHtYC1rI5paummWnPDdCwI-uwhc1gfbJjzGy4MKrJdd7QRcvAQkKQZlhpwe_JETImHKfCwLbbu-iT_6oPyWbdo9ptENr4hNrBy8yVlUSbmTELwCqOtJktOm6lE6R0bxsfrFTMg7gu1peA2ohmS6p2NkoeyEfV4tjWG59xsX5TzvLJfvoG0bs65nIqDv4heWxD4JiVKcY4jKqYHNumU9eqKKCTdA5xIVoEGYIqtzVLn-log3ArhYDH5-YMy0ekG-wDWWhjcCphRvXWDkLInJZUxRYkqykIzkR1rCFbMdJWx6dWngiZX0WZM0etD4byNST74waaYVANNwB4DH3DqRxW7lnnpuiZg0ilQCb4NH9Ko_7CYZOjV65amSVKpxKGRumw_23yfOtk4TBMhSNHmCoHBAa8i06hqp50D3zTlvP1J2fbe2vYYLP0NINdIBJ7pzHm8Eg88n0WyCnu2V-HnMn8SVfICuuWlrwqjeUARaCy0GzyrTbhMRcIG7wZN2PjEWmoKCyZbCO9kaFvtcijcTUCaaFROsen9KO6sBhV0NcoS7poIY=w598-h417-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let scoreboardURL = URL(string:"https://lh3.googleusercontent.com/D-tf4SD26hHt_gtVOMy8fLUDzxWn3aUKVDRqqdgxZHcFCmigH2lV3_RHZId-yO4rogAjOqUq0DNQyB7B6fQ2F7_eXXIw-wGbH31xvUtzjY7gDivtV_nbIvR5tiEkKgoRse9eWblrqboRpJRvrOlNz1GzXVhHmVYEFaen83EbDxWOzcmuGGcHDFDcfHdAon75Jrn17RlvEXWNcqzGKh03EAvJw9yeoUT-_cX1JtuJBj4NhLSIbaQqNT4vGRCqWgOSJd9h8fyM0dn3od544-wLBNOTkwBQb3KJ_ChOOJpnhcdkT-hefIv4xOAN3h2LLzPZuPnhSUd-9DgwZEBRtIZ25K3a8OEkSiE4KSlvWpezxH3cVRVcCRQyNBC_mIew-O82nI6wSdeMPHyeVVI6g8LH7a5N_b-5SiL-JGq60CgoDsi6UZjBcBZuVqHzz_Qua193gyN8jVCnhNFenjsvBQXvDkCCJejBeokRfXQdXwy21wBch_sEyLQ178KOvbUH6Lxz6OpyxXnQZEeXkbS6kOFf6GU-tSLrICYc2_ypmuISZsPQTscK9fzZJv0m6c6qMVTFZPpQI-FMrLYK3bhtKq-23Tvoc3-TdInlopAAyk-FsLYmM039q5cVct0-h7N3eSeWeGK7WQYU-glyTMQ8fxGWb3T2nTv8KzF6b5cCf1P-Jo08ZEonHkFkrAEC92U-ZsgDiAQlEKQCZawiIA4bsQxijtlCKsESS2WrCIVVKi7Lrwnigye8-l2G0uA9TQc=w272-h185-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let redPlayerURL = URL(string:"https://lh3.googleusercontent.com/ERtQLpzB81VCcRZqNfRjd47nz7yKJSvQOSZSt_j7V9spStyXLxpZNDnxmm3JLQvT56Kd2a3vvceT9-6RO_Oa8_oUHqphZR8r9nKuPYjQGLOZdkYK17j3DqRMZqT4eAb5Po9ZbGnNagCi0iqYijEqDpbvXZbsaeTpRTRTOOVKHBO3vHYqZCTMPX03PNEYKL-ySNORWYeGtVvIbdH_y85PMvR-MID48jJHypTLUIG00-XB2Qm1avzNmOkzzhVczj5Rrqz-5bzCaJD2sWxwqqsuPyjLT5KE6bxUrM-qA5wAPhg8hvxvo76PRygVN6UBPfiYiz_6XewMDb6lGrZ31pphK8Y3llXCjln4lkZfV4k1dFir2QZzOBtFvCgLPahxtvSUQoqlt2jjSITbZZvSecLLTrTvxndvUz6YrijPFFEaYzJmT0_MVg0kCBwzS0GiH_1_2S0vYK-Jv2tTylaPVhb6q-AafMlhsheX5xPn7mBa06ynNXRSW5KUbHs7a8vftdmdF7-DhibOLhzMTvnrOOYRYhwV_Hyx5inOVvXqUJ6R1-kf7N9MGTmxVwaoarbdtNXUp5ufl9zAZCxSK07uyTb7ZcIoWHd9Yn9qzb_0IEYd5DhZ9Ch0ETS8705f0680I-JFTcdbmDTTmUgIupmjS8ME8FCcav7jNtjpZ9GmywSP_QH8GMZ0lAXQdt-WO73159_zm7InrLdS8BNRw2ZZblQ7hsX4aWgAdzl4xna3mpe-O4I_7YKaryIFj5obFaI=w186-h271-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        guard let bluePlayerURL = URL(string:"https://lh3.googleusercontent.com/Ww00mNtSiSURjz3MAq8z1vNk0kUA8T_UYMuwwYK5P1qPdT7BuZUGnRjFDyGmBrYJAKtNSXk5rZah5Mbmoc13LAei-6gVN8yJHQyiBZaPuM1oksGcHkmV3Bo3Y98Md7H-0QZsMa0h22mjHjWA9YY21j08jEf8Nx1YWtZ3TTav0puuN0Qj0mqCmcgcBi8YZ8l5Cfp9RrQvoEUxl_e1yUI0dtgCv94s-9gPJ4c7i5ksJUZ_3xR8bop5pNX4xfP6bflWw3ML9SX-qZg9PNh1P5tlgsIa3pN2Qavyym25GsJe1jeCtVqM4HgzvaNW1tCN4txOXJkJp9te7Sl5rzIPopUwSDQ9ezMHgQzKkvrDtBIQ5BHz74K9jFb3yF5HhFzIAdUzrnlnZHPhW8-gMGqIYbaMAFEB1rrIdoIMK1nJTv23HUn8Vttnknar-LhWcxHYLT6ykCPE-hmXFVNio3-vPokZlzDnGDQbNlHH1mih7tFT45zrK-YxnVOidK5Y9kuV2pdPQoPEXa2U83XwcpwwMaPd-qR-kuR6OoluWVQ1l7lqjdNsrkyBXtZOmk4g7L34wZIne3MShSMBMiqP0NXN_akljQvCv5wr7nRd6DA1xEQLEauLLuJPR5Mjd03HKmf5VOzSUOqSER-CVEaGAwF1SzzDsSwDd6keQKROA8ePlkTYO6BVYAHTgbReGEKaCN-Wu5kkQBmb6RpZErOpCsA_1_Y0_HmWFjb8GWFsKVRX72RJr_MlhAIdq5TRd22jFBI=w204-h248-no?authuser=0") else {
            fatalError("Failed to create URL for whitehouse")
        }
        
        crowdStands = Image(sourceURL:crowdStandsURL)
        rightNet = Image(sourceURL:rightNetURL)
        leftNet = Image(sourceURL:leftNetURL)
        fireworks = Image(sourceURL:fireworksURL)
        scoreboard = Image(sourceURL:scoreboardURL)
        redPlayer = Image(sourceURL:redPlayerURL)
        bluePlayer = Image(sourceURL:bluePlayerURL)
        // Using a meaningful name can be helpful for debugging

        super.init(name:"Background")
    }
    
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(backgroundMusic)
        canvas.setup(crowdStands)
        canvas.setup(rightNet)
        canvas.setup(leftNet)
        canvas.setup(fireworks)
        canvas.setup(scoreboard)
        canvas.setup(redPlayer)
        canvas.setup(bluePlayer)
    }
    
    override func render(canvas: Canvas) {
        // Shape renders

        let clears = Rect(topLeft:Point(x:0, y:0), size:Size(width:5000, height:5000))
        clearCircle(canvas: canvas, rect: clears)

        let ground = Rect(topLeft:Point(x:-10, y:450), size:Size(width:5000, height:5000))
        renderRectangleGround(canvas: canvas, rect: ground)

        let sky = Rect(bottomLeft:Point(x:-10, y:450), size:Size(width:5000, height:5000))
        renderRectangleSky(canvas:canvas, rect:sky)

        let sun = Ellipse(center:Point(x:55, y:55), radiusX:50, radiusY:50, fillMode:.fill)
        let sunColor = FillStyle(color:Color(.yellow))

        let building1 = Rect(bottomLeft:Point(x:0, y:450), size:Size(width: 3000, height: 250))
        renderRectangleBackgroundFoundation(canvas:canvas, rect:building1)

        canvas.render(sunColor, sun)

        // Rendering our audio and images

        if backgroundMusic.isReady {
            canvas.render(backgroundMusic)       
        }
        
        if crowdStands.isReady {
            crowdStands.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width:500, height:450)))
            canvas.render(crowdStands)
        }
        
        if crowdStands.isReady {
            crowdStands.renderMode = .destinationRect(Rect(topLeft:Point(x:450, y:0), size:Size(width:500, height:450)))
            canvas.render(crowdStands)
        }
        
        if crowdStands.isReady {
            crowdStands.renderMode = .destinationRect(Rect(topLeft:Point(x:900, y:0), size:Size(width:500, height:450)))
            canvas.render(crowdStands)
        }
        
        if crowdStands.isReady {
            crowdStands.renderMode = .destinationRect(Rect(topLeft:Point(x:1350, y:0), size:Size(width:500, height:450)))
            canvas.render(crowdStands)
        }
        
        if crowdStands.isReady {
            crowdStands.renderMode = .destinationRect(Rect(topLeft:Point(x:1800, y:0), size:Size(width:500, height:450)))
            canvas.render(crowdStands)
        }
        
        if scoreboard.isReady {
            scoreboard.renderMode = .destinationRect(Rect(topLeft:Point(x:700, y:275), size:Size(width:400, height:200)))
            canvas.render(scoreboard)
        }
        
        if redPlayer.isReady {
            redPlayer.renderMode = .destinationRect(Rect(topLeft:Point(x:650, y:275), size:Size(width:125, height:250)))
            canvas.render(redPlayer)
        }
        
        if bluePlayer.isReady {
            bluePlayer.renderMode = .destinationRect(Rect(topLeft:Point(x:1000, y:275), size:Size(width:150, height:250)))
            canvas.render(bluePlayer)
        }
        
        if rightNet.isReady {
            rightNet.renderMode = .destinationRect(Rect(topLeft:Point(x:1675, y:50), size:Size(width:250, height:950)))
            canvas.render(rightNet)
        }
        
        if leftNet.isReady {
            leftNet.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:50), size:Size(width:250, height:950)))
            canvas.render(leftNet)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:200, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:400, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:600, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:800, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:1000, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:1200, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        if fireworks.isReady {
            fireworks.renderMode = .destinationRect(Rect(topLeft:Point(x:1400, y:-20), size:Size(width:200, height:150)))
            canvas.render(fireworks)
        }
        
        canvas.render(sunColor, sun)
        
        
    }

    
}

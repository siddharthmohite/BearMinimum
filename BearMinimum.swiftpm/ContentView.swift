import SwiftUI
import AVFoundation




struct ContentView: View {
    
    
    @State private var audioPlayer: AVAudioPlayer?
    @State private var BlurAmount: CGFloat = 9.0
    @State private var InitialPopup = true
    @State private var gameState: Bool = false
    @State private var hideView: Bool = true
    @State private var hidetryAgain: Bool = true
    @State private var enteredCal=1000
    @State private var totalCalories=0
    @State private var pizzaCount=0
    @State private var placedEmojis: [EmojiItem] = []
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        
        ZStack{
            
            
            ZStack{
                ZStack(alignment: .center){
                    
                    VStack{
                        
                        
                        
                        
                        ZStack{
                            
                            
                            VStack{
                                
                                if hideView{
                                    VStack{
                                        
                                        Button(action: {
                                            gameState.toggle()
                                            hideView.toggle()
                                            print("pressed play")
                                        })
                                        {
                                            Text("PLAY")
                                                .foregroundColor(Color.blue)
                                                .font(.system( size: 45))
                                                .bold()
                                                
                                        }
                                        
                                        
                                    }
                                }    
                                
//                                VStack(alignment:.leading){
//                                    Text("Calories Consumed: \(totalCalories)")
//                                        .foregroundColor(Color.white)
//                                        .bold()
//                                         .font(.system( size: 15))
//                                    Text("Calories to Consume: \(enteredCal)")
//                                        .foregroundColor(Color.white)
//                                        .bold()
//                                         .font(.system( size: 15))
//                                    
//                                }
                                
                            }
                            
                            
                            
                            
                            
                        }
                        
                        if gameState{
                            ZStack(alignment:.center){
                                
                                Image("choppingboard")
                                    .aspectRatio(contentMode: .fit)
                                    .offset(x:120,y:-30)
                                
                                
                                
                                ZStack(alignment:.center){
                                    
                                    ForEach(placedEmojis) { item in
                                        Text(item.emoji)
                                            .font(.system(size: item.size))
                                            .position(x: item.x, y: item.y)
                                            .onTapGesture {
                                                playSound(sound: "eating")
                                                if item.emoji == "🍕" 
                                                {
                                                    totalCalories+=100
                                                    pizzaCount+=1
                                                } 
                                                else if item.emoji == "🍣"
                                                {
                                                    totalCalories += 50
                                                }
                                                else if item.emoji == "🍗"
                                                {
                                                    totalCalories += 25
                                                }
                                                else if item.emoji == "🍎"{
                                                    totalCalories += 10
                                                }
                                                else if item.emoji == "🥑"{
                                                    totalCalories += 10
                                                }
                                                else if item.emoji == "🍛"{
                                                    totalCalories += 150
                                                }
                                                else if item.emoji == "🥗"{
                                                    totalCalories += 100
                                                }
                                                // Remove emoji immediately upon tap
                                                placedEmojis.removeAll { $0.id == item.id }
                                            }
                                    }
                                }
                                //                        .background(Color.white)
                                //                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .frame(width: 550, height: 450)// Set the ZStack frame
                                .onAppear {
                                    
                                }
                                .onReceive(timer) { _ in
                                    
                                    checkGameStatus()
                                    let newEmojis = generateEmojis(count: Int.random(in: 1...3))
                                    placedEmojis.append(contentsOf: newEmojis)
                                    // Schedule to remove each new emoji after 1 second
                                    newEmojis.forEach { emoji in
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            placedEmojis.removeAll { $0.id == emoji.id }
                                        }
                                    }
                                    
                                }
                                
                                
                            }
                            
                            
                            .frame(width:1200,height:800)
                            //                    .background(Color.red)
                            
                        }
                        if hideView{
                            
                            VStack(alignment:.center){
                                Stepper("    Enter Calories to consume ",value: $enteredCal, in: 1000...4000, step: 25)
                                    .background(Color.white)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(15)
                            }
                            .frame(width:500,height:100)
                            Text("The calories you entered is: \(enteredCal)")
                                .foregroundColor(Color.white)
                            
                        }
                        VStack(alignment:.leading){
                            
                            
                            Text("Pizza Streak: \(pizzaCount) ")
                                .foregroundColor(Color.white)
                                .bold()
                                .font(.system(size:35))
                            Text("Calories Consumed: \(totalCalories)")
                                .foregroundColor(Color.white)
                                .bold()
                                .font(.system( size: 35))
                            Text("Calories to Consume: \(enteredCal)")
                                .foregroundColor(Color.white)
                                .bold()
                                .font(.system( size: 35))
                            
                            
                        }
                        
                        
                        
                        
                        if totalCalories>enteredCal || pizzaCount>=5 {
                            
                            macroInfoPopUp(hide:$hideView, hidetryAgain:$hidetryAgain, totalCalories: $totalCalories, enteredCalories: $enteredCal,pizzaCount: $pizzaCount)
                            
                        }
                        else if totalCalories==enteredCal{
                            
                            winpopUp()
                        }
                        
                        
                        
                    }
                    
                    
                }
                .blur(radius: BlurAmount)
                InitPopup(show:$InitialPopup, blur:$BlurAmount)

            }
            .frame(width:1200, height:950)
            .background(Color(red: 0x66 / 255, green: 0x23 / 255, blue: 0x23 / 255))
            .cornerRadius(150)

        }
        .frame(width:1200,height:1080)
        .background(Color.black)
        .cornerRadius(110)
        .onAppear{
            playSound(sound: "background-music")
        }
       
        
    
        }
    func checkGameStatus() {
        if totalCalories > enteredCal || pizzaCount >= 5 {
            
            gameState = false
            hideView=false
            hidetryAgain=true
        }
        else if totalCalories == enteredCal{
            
            gameState=false
            hideView=false
            
        }
    }
    
    
    }

func generateEmojis(count: Int) -> [EmojiItem] {
    let emojis = ["🍕", "🍣", "🍗", "🍎", "🥑", "🍛", "🥗"]
    return (0..<count).map { _ in
        EmojiItem(
            emoji: emojis.randomElement()!,
            x: CGFloat.random(in: 0...550),
            y: CGFloat.random(in: 0...450),
            size: CGFloat.random(in: 75...76)
        )
    }
}

struct EmojiItem: Identifiable {
    let id = UUID()
    let emoji: String
    let x: CGFloat
    let y: CGFloat
    let size: CGFloat
}

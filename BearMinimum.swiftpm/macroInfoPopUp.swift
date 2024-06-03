import SwiftUI

struct macroInfoPopUp: View{
    
    
    
    @Binding var hide: Bool
    @Binding var hidetryAgain: Bool
    @Binding var totalCalories : Int
    @Binding var enteredCalories : Int
    @Binding var pizzaCount: Int
    
    var body: some View{
            
            if hidetryAgain{
                
                ZStack{
                    
                    VStack{
                        
                        if pizzaCount>=5{
                            Text("Oh No! You ate too many pizzas")
                                .foregroundColor(Color.white)
                                .font(.system( size: 20))
                        }
                        else{
                            Text("Oh No! You ate too many calories than needed! ")
                            .foregroundColor(Color.white)
                            .font(.system( size: 20))
                        }
                        
                        
                        
                        
                        
                        ZStack{
                            List(items, id: \.id) { food in
                                HStack {
                                    Text(food.item)
                                        .font(.system(size:20))
                                    Spacer()
                                    Text(food.Source)
                                        .font(.system(size:20))
                                    Spacer()
                                    Text(food.calories)
                                        .font(.system(size:20))
                                }
                                
                            }
                            
                        }
                        
                        
                     
                        Spacer()
                        Button(action: {
                            withAnimation{
                                
                                hide=true
                                hidetryAgain=false
                                resetGame()
                                
                            }
                            
                        })
                        {
                            Text("Try Again")
                                .foregroundColor(Color.blue)
                                .font(.system( size: 45))
                                .bold()
                        }
                        Spacer()
                    }
                   
                    
                }
                .frame(width:800,height:650)
                
                
            }
            

        
            
    
    }
    func resetGame(){
        
        totalCalories=0
        enteredCalories=1000
        pizzaCount=0
        
    }         
    
}



struct Item {
    var id: Int
    var item: String
    var Source: String
    var calories: String
}


let items = [
    Item(id: 1, item: "🍕", Source: "Fats,Carbohydrates", calories: "100cal"),
    Item(id: 2, item: "🍣", Source: "Protein", calories: "50cal"),
    Item(id: 3, item: "🍗", Source: "Protein", calories: "25cal"),
    Item(id: 4, item: "🍎", Source: "Carbohydrates", calories: "20cal"),
    Item(id: 5, item: "🥑", Source: "Carbohydrates", calories: "10cal"),
    Item(id: 6, item: "🍛", Source: "Protein,Carbohydrates ", calories: "150cal"),
    Item(id: 7, item: "🥗", Source: "Protein,Carbohydrates", calories: "100cal"),
]


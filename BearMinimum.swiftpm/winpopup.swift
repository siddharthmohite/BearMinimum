import SwiftUI

struct winpopUp: View{
    
    
    var body: some View{
        
        ZStack{
            
            VStack{
                
                ZStack{
                    
                    
                    Text("Wooohoooooooooo!")
                        .foregroundColor(Color.black)
                    .font(.system( size: 35))
                }
                
                ZStack{
                    
                    Image("bear")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    
                }
                ZStack{
                    
                    Text("I'm getting bigger and stronger day by day")
                    .foregroundColor(Color.black)
                    .font(.system( size: 20))
                }
                ZStack{
                    
                    Text("Till then, Stay hungry Stay Foolish")
                    .foregroundColor(Color.black)
                    .font(.system( size: 20))
                    .bold()
                }
                
                
            }
            
        }
        .frame(width:600,height:650)
        .background(Color.white)
        .cornerRadius(75)
        
    }
}

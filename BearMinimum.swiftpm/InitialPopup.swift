import SwiftUI

struct InitPopup: View{
    
     @Binding var show: Bool
    @Binding var blur: CGFloat
    static let gradientStart=Color(red: 255 / 255, green: 249 / 255, blue: 196 / 255)
    static let gradientEnd=Color(red: 204 / 255, green: 198 / 255, blue: 150 / 255)
    @State private var isHovered = false

    var body: some View {
        
        if show{
            ZStack{
                
                Rectangle()
                    .fill(LinearGradient(
                        gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                        startPoint: .init(x: 0.5, y: 0),
                        endPoint: .init(x: 0.5, y: 0.6)))
                    .frame(width:1020, height:500,alignment:.center)
                    .transition(.scale)
                    .cornerRadius(30)
                
                VStack{
                    
                    Text("BEAR MINIMUM")
                        .font(.system( size: 40))
                        .bold()
                        .foregroundColor(Color.black)
                    HStack{
                        Spacer()
                        ProteinTileView(paddingTop: 50.0, paddingLeading: 0.0, paddingBottom: 50.00, paddingTrailing: 0.00)
                        Spacer()
                        CarbsTileView(paddingTop: 50.0, paddingLeading: 0.0, paddingBottom: 50.00, paddingTrailing: 0.00)
                        Spacer()
                        FatsTileView(paddingTop: 50.0, paddingLeading: 0.0, paddingBottom: 50.00, paddingTrailing: 0.00)
                        Spacer()
                        
                    }
                    ZStack{
                        
                        Button(action: {
                            withAnimation{
                                show.toggle()
                                blur=0.0
                            }
                            
                        }) {
                            
                            ZStack {
                                Rectangle()
                                    .fill(isHovered ? Color.white : Color.black )
                                    .stroke(Color.black, lineWidth: 2) 
                                    .frame(width: 50, height: 50)
                                Triangle()
                                    .fill(isHovered ? Color.black: Color.white) 
                                    .frame(width: 25, height: 25)
                                    .rotationEffect(.degrees(90)) 
                            }
                            
                            }
                            .onHover{hovering in
                                isHovered=hovering
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                        }
                    Spacer()
                    ZStack{
                        
                        Text("Let's get those calories for today! ")
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.system(size: 23))
                    }
                   Spacer()     
                        
                    }
                    
                    
                 
                    
                    
                    
                }
                .frame(width:1020,height:500)
            }
        }
    
}


struct ProteinTileView: View{
    
    var paddingTop: CGFloat
    var paddingLeading: CGFloat
    var paddingBottom: CGFloat
    var paddingTrailing: CGFloat
    
    var body: some View{
        
        ZStack{
            VStack(alignment: .center){
                HStack{
                    
                    Text("1g")
                        .padding(.leading)
                        .padding(.top)
                        .foregroundColor(.white)
                    Spacer()
                    Text("4cal")
                     .padding(.trailing)
                     .padding(.top)
                     .foregroundColor(.white)
                    
                    
                }
                Spacer()
                
                Text("Pr")
                    .font(.system(size: 39))
                    .bold()
                    .padding(.bottom)
                    .foregroundColor(.white)
                Text("protein")
                .foregroundColor(.white)
                Spacer()
            }
            .background(Color(red: 0x79 / 255, green: 0x59 / 255, blue: 0x4E / 255))
            .frame(width:150,height:200)
            .cornerRadius(9)
            .padding()
        }
        .padding(.leading, paddingLeading)
        .padding(.top, paddingTop)
        .padding(.bottom, paddingBottom)
        .padding(.trailing, paddingTrailing)
        
    }
}

struct CarbsTileView: View{
    
    var paddingTop: CGFloat
    var paddingLeading: CGFloat
    var paddingBottom: CGFloat
    var paddingTrailing: CGFloat
    
    var body: some View{
        
        ZStack{
            VStack(alignment: .center){
                HStack{
                    
                    Text("1g")
                        .padding(.leading)
                        .padding(.top)
                        .foregroundColor(.white)
                    Spacer()
                    Text("4cal")
                        .foregroundColor(.white)
                        .padding(.trailing)
                        .padding(.top)
                    
                    
                }
                Spacer()
                
                Text("Ca")
                    .font(.system(size: 39))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom)
                Text("carbohydrates")
                .foregroundColor(.white)
                Spacer()
            }
            .background(Color(red: 0x1A / 255, green: 0x47 / 255, blue: 0x8B / 255))
            .frame(width:150,height:200)
            .cornerRadius(9)
            .padding()
        }
        .padding(.leading, paddingLeading)
        .padding(.top, paddingTop)
        .padding(.bottom, paddingBottom)
        .padding(.trailing, paddingTrailing)
        
    }
}


struct FatsTileView: View{
    
    var paddingTop: CGFloat
    var paddingLeading: CGFloat
    var paddingBottom: CGFloat
    var paddingTrailing: CGFloat
    
    var body: some View{
        
        ZStack{
            VStack(alignment: .center){
                HStack{
                    
                    Text("1g")
                        .padding(.leading)
                        .padding(.top)
                        .foregroundColor(.white)
                    Spacer()
                    Text("9cal")
                        .padding(.trailing)
                        .padding(.top)
                        .foregroundColor(.white)

                    
                    
                }
                Spacer()
                
                Text("F")
                    .font(.system(size: 39))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom)
                Text("fats")
                    .foregroundColor(.white)
                Spacer()
            }
            .background(Color(red: 0x5E / 255, green: 0x3A / 255, blue: 0x9D / 255))
            .frame(width:150,height:200)
            .cornerRadius(9)
            .padding()
        }
        .padding(.leading, paddingLeading)
        .padding(.top, paddingTop)
        .padding(.bottom, paddingBottom)
        .padding(.trailing, paddingTrailing)
        
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startPoint = CGPoint(x: rect.midX, y: rect.minY)
        let leftPoint = CGPoint(x: rect.minX, y: rect.maxY)
        let rightPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        
        path.move(to: startPoint)
        path.addLine(to: leftPoint)
        path.addLine(to: rightPoint)
        path.addLine(to: startPoint)
        
        return path
    }
}

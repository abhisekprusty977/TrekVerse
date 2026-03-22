import SwiftUI

struct CardView: View {
    
    @State var imageNumber: Int = 1
    @State var randomNumber: Int = 1
    @State private var IsShowingSheet: Bool = false
    
    func imageUpdate(){
        repeat {
            self.randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
                    
                    imageNumber = randomNumber
    }
    var body: some View {
        ZStack {
            CustomBackground()
            
            VStack {
                VStack(alignment: .leading){
                    HStack {
                        Text("HIKING")
                            .fontWeight(.black)
                            .font(.system(size: 54))
                            .foregroundStyle(LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom))
                        Spacer()
                        Button {
                            IsShowingSheet.toggle()
                        } label: {
                            HikeButton()
                        }
                        .sheet(isPresented: $IsShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }

                    }
                    
                    Text("Fun and Adventure outdoor activities for friends and family")
                        .italic()
                }.padding(.horizontal,32)
                ZStack {
                   CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.bouncy, value: imageNumber)
                }
                //footer
                
                Button {
                    
                    imageUpdate()
                    
                } label: {
                    Text("Explore More")
                        .fontWeight(.heavy)
                        .font(.title2)
                        .foregroundColor(.white)
                        
                        
                }
                .buttonStyle(GradientButtonStyle())
               

            }
        }
        .frame(width: 350, height: 580)
    }
}

#Preview {
    CardView()
}

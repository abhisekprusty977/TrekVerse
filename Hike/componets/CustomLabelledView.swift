import SwiftUI

struct CustomLabelledView: View {
    
    @State var rowContent: String? = nil
    @State var rowImage: String?
    @State var rowTintColor: Color?
    @State var rowImageColor: Color?
    @State var rowLabel: String?
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
            }else if rowLinkLabel != nil && rowLinkDestination != nil{
                Link(rowLinkLabel ?? "", destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.black)
            }
            
            else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            HStack {
                ZStack {
                    Rectangle()
                        .fill()
                        .frame(width: 30,height: 30)
                        .cornerRadius(10)
                        .foregroundStyle(rowTintColor!)
                    Image(systemName: rowImage ?? "")
                        .foregroundStyle(rowImageColor!)
                }
                Text(rowLabel ?? "")
                    .fontWeight(.bold)
            }
            
        }
        
        
    }
}

#Preview {
    List() {
        CustomLabelledView( rowContent: nil,
                            rowImage: "star",
                            rowTintColor: .purple,
                            rowImageColor: .purple,
                            rowLabel: "Label",
                            rowLinkLabel: "sadf",
                            rowLinkDestination: "www.google.com"
        )
    }
    
}

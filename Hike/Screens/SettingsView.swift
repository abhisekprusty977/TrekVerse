import SwiftUI

struct SettingsView: View {
    private  var AlternateIcons : [String] = ["AppIcon-Bag","AppIcon-Camera","AppIcon-CampFire","AppIcon-MagGlass",
    "AppIcon-Map"
    ]
    var body: some View {
        List {
            HStack {
                Spacer()
                Image(systemName: "laurel.leading")
                    .font(.system(size: 80))
                VStack(spacing:-5){
                    Text("Hike")
                        .font(.system(size: 65, weight: .black))
                    Text("Editors Choice")
                        .fontWeight(.medium)
                }
                
                Image(systemName: "laurel.trailing")
                    .font(.system(size: 80))
                Spacer()
            }
            .foregroundStyle(LinearGradient(colors: [.colorGreenDark,.customGreenMedium,.colorGreenLight], startPoint: .top, endPoint: .bottom))
            .padding(.top, 8)
            
            VStack(spacing: 8) {
                Text("Where can you find a \nPerfect Tracks?")
                    .fontWeight(.heavy)
                Text("The hike is goregous in photos but its even better once you experience it yourself.\nFind the best ways in the app.")
                    .italic()
                    .font(.footnote)
                
                Text("Dust Off the boots. its time to hike!")
                    .fontWeight(.heavy)
                    .foregroundStyle(LinearGradient(colors: [.colorGreenDark,.customGreenMedium,.colorGreenLight], startPoint: .top, endPoint: .bottom))
            }
            .multilineTextAlignment(.center)
            .listRowSeparator(.hidden)
            .frame(maxWidth: .infinity)
            
            Section(header: Text("Alternate App Icons")){
                
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack {
                        
                        ForEach(AlternateIcons.indices, id: \.self) { item in
                                
                                Button {
                                    UIApplication.shared.setAlternateIconName(AlternateIcons[item]){
                                        error in
                                        
                                        if let error = error {
                                            print("error: \(error)")
                                        }else{
                                            
                                        }
                                        
                                      
                                    }
                                } label: {
                                    Image("\(AlternateIcons[item])-Preview")
                                        .resizable()
                                        .frame(width: 80,height: 80)
                                        .scaledToFit()
                                        .cornerRadius(15)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            
                        }
                    }
                    
                }
                
                Text("Choose Your Favorite Icon From Above")
                    .font(.caption)
                    .frame(minWidth: 0,maxWidth: .infinity)//to study
                    .multilineTextAlignment(.center)
                    .font(.footnote)
            }
            .listRowSeparator(.hidden)
            
            Section(
                
                header: Text("About the App"),
                
                footer:
                    
                    HStack {
                        Spacer()
                        Text("Copyright © 2026 Hike. All rights reserved.")
                        Spacer()
                    }
            ){
               CustomLabelledView( rowContent: "HIKE",
                                   rowImage: "iphone.gen2",
                                   rowTintColor: .blue,
                                   rowImageColor: .white,
                                   rowLabel: "Application",
                                   rowLinkLabel: "sadf",
                                   rowLinkDestination: "https://www.google.com")
                
                CustomLabelledView( rowContent: "Swift",
                                    rowImage: "swift",
                                    rowTintColor: .orange,
                                    rowImageColor: .white,
                                    rowLabel: "Technology",
                                    rowLinkLabel: nil,
                                    rowLinkDestination: nil)
                
                CustomLabelledView( rowContent: "1.0",
                                    rowImage: "gear",
                                    rowTintColor: .purple,
                                    rowImageColor: .white,
                                    rowLabel: "Version",
                                    rowLinkLabel: nil,
                                    rowLinkDestination: nil)
                
                CustomLabelledView( rowContent: "Abhisek Prusty",
                                    rowImage: "keyboard.badge.ellipsis",
                                    rowTintColor: .purple,
                                    rowImageColor: .white,
                                    rowLabel: "Developer",
                                    rowLinkLabel: nil,
                                    rowLinkDestination: nil)
                
                CustomLabelledView( rowContent: nil,
                                    rowImage: "globe",
                                    rowTintColor: .colorGreenDark,
                                    rowImageColor: .white,
                                    rowLabel: "Website",
                                    rowLinkLabel: "Linkdin.com",
                                    rowLinkDestination: "https://in.linkedin.com/in/abhisek-prusty-23876b191")
            }
        }
    }
}

#Preview {
    SettingsView()
}

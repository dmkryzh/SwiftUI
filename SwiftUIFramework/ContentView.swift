//
//  ContentView.swift
//  SwiftUIFramework
//
//  Created by Dmitrii KRY on 04.08.2021.
//

import SwiftUI

struct Fields: View {
    @State var loginText = ""
    @State var passwordText = ""
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            
            VStack(alignment: .center, spacing: 0) {
                
                
                TextField ("Login", text: $loginText)
                    .padding(.horizontal, 10)
                VStack{
                    Color.gray.frame(height:CGFloat(1.5) / UIScreen.main.scale)
                        .padding(.vertical, 12)
                }
                
                SecureField ("Password", text: $passwordText)
                    .padding(.horizontal, 10)
            }
            .frame(height: 100, alignment: .center)
            .addBorder(Color.gray, width: 1.5,cornerRadius: 10)
            .background(Color(.systemGray6)).cornerRadius(10)
            .font(.system(size: 16, weight: .regular, design: .default))
            .padding(.horizontal, 10)
        }
    }
}

struct ContentView: View {
    
    
    var body: some View {
        
        TabView {
            Fields()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Feed")
                }
            VStack {
                Text("Title")
                    .bold()
                    .background(Color.red)
                    .font(.title)
                    .padding()
                Text("Some text")
                    .padding()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
            Text("Test")
                .tabItem {
                    Image(systemName: "music.note")
                    Text("Player")
                }
            Text("Test")
                .tabItem {
                    Image(systemName: "play.rectangle.fill")
                    Text("Video")
                }
            Text("Test")
                .tabItem {
                    Image(systemName: "mic.fill")
                    Text("Recorder")
                }
            
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
            .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}

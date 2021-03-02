//
//  ContentView.swift
//  JumioSwiftUI
//
//  Created by Jordan Cassiano on 02/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                    .padding()
                
                NavigationLink(destination: NetverifyView(onComplete: self.onComplete).navigationBarHidden(true)) {
                    VStack {
                        Text("Validate")
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                    .frame(width: 200, height: 60)
                    .background(Color.blue)
                }
            }
        }
    }
    
    func onComplete(_ status: NetverifyStatus) {
        print("Status \(status)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

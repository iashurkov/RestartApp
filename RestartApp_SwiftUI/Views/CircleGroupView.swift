//
//  CircleGroupView.swift
//  RestartApp_SwiftUI
//
//  Created by Igor Ashurkov on 31.10.2022.
//

import SwiftUI

struct CircleGroupView: View {
    
    // MARK: Property
    
    @State var ShareColor: Color
    @State var ShareOpacity: Double
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(self.ShareColor.opacity(self.ShareOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(self.ShareColor.opacity(self.ShareOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: Circle ZStack
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(ShareColor: .white, ShareOpacity: 0.2)
        }
    }
}

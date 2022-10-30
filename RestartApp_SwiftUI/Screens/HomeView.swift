//
//  HomeView.swift
//  RestartApp_SwiftUI
//
//  Created by Igor Ashurkov on 30.10.2022.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: Property
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                self.isOnboardingViewActive = true
            }) {
                Text("Restart")
            }
        } //: VSTACK
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

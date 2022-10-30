//
//  OnboardingView.swift
//  RestartApp_SwiftUI
//
//  Created by Igor Ashurkov on 30.10.2022.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: Property
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button(action: {
                self.isOnboardingViewActive = false
            }) {
                Text("Start")
            }
        } //: VSTACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

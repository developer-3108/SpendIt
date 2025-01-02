import Foundation

class OnboardingManager: ObservableObject {
    @Published var onboardingState: Bool = false
    @Published var accountPageState: Bool = false
    @Published var iconPageState: Bool = false
}

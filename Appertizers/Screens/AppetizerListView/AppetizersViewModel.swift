import Foundation

class AppetizersViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetails: Bool = false
    @Published var selectedAppetizer: Appetizer? = nil
    
    var navigationTitle = "Appertizers"
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers() { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch (result) {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidReponse
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}

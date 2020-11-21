import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel: AppetizersViewModel = AppetizersViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(viewModel.appetizers) { appetizer in
                        AppetizerCell(appetizer: appetizer)
                            .onTapGesture {
                                viewModel.isShowingDetails = true
                                viewModel.selectedAppetizer = appetizer
                            }
                    }
                }
                .disabled(viewModel.isShowingDetails)
                .navigationTitle(viewModel.navigationTitle)
            }.onAppear() {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetails ? 20 : 0)
            
            if viewModel.isShowingDetails {
                AppetizerDetailsView(isShowingDetails: $viewModel.isShowingDetails, appetizer: viewModel.selectedAppetizer!)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }.alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

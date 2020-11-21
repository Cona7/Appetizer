import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var birthdate: Date = Date()
    
    @Published var extraNapkins: Bool = false
    @Published var frequentRefills: Bool = false
    
    @Published var alertItem: AlertItem?

    
    var isValidForm: Bool {
        guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        if (isValidForm) {
            print("yes")
        }
    }
}

struct AccountViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

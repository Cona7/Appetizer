import SwiftUI

class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func delete(at offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
    
    var buttonText: String {
        let orderPrice = items
            .reduce(0, { $0 + $1.price })
        
        return "$\(orderPrice) - Place Order"
    }
}

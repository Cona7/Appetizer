import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
        
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerCell(appetizer: appetizer)
                        }.onDelete(perform: order.delete)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                    } label : {
                        ApButton(title: order.buttonText)
                    }
                }

                if order.items.isEmpty {
                    EmptyState()
                }
            }
            .navigationTitle("Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

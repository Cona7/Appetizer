import SwiftUI

struct AppetizerDetailsView: View {

    @EnvironmentObject var order: Order
    
    @Binding var isShowingDetails: Bool
    var appetizer: Appetizer
    
    var body: some View {
        
        VStack(alignment: .center) {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", amountString: String(appetizer.calories))
                    NutritionInfo(title: "Carbs", amountString: String(appetizer.carbs) + " g")
                    NutritionInfo(title: "Protein", amountString: String(appetizer.protein) + " g")
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetails = false
            } label: {
                ApButton(title: "$\(String(appetizer.price)) - Add To Order")
            }
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowingDetails = false
            } label : {
                DismissButton()
            },
            alignment: .topTrailing)
    }
}

struct NutritionInfo: View {
    
    var title: String
    var amountString: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text(amountString)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .italic()
        }
    }
}

struct AppetizerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailsView(isShowingDetails: .constant(true), appetizer: Appetizer(id: 00, name: "Chicken breast", description: "More mor more moree more more more", price: 2.22, imageURL: "lock", calories: 13, protein: 14, carbs: 14))
    }
}


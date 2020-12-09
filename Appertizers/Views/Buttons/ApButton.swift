import SwiftUI

struct ApButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.body)
            .fontWeight(.semibold)
            .frame(width: 260, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.darkGreen)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.bottom, 40)    }
}

struct ApButton_Previews: PreviewProvider {
    static var previews: some View {
        ApButton(title: "Button text")
    }
}

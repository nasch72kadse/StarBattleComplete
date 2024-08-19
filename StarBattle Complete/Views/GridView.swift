import SwiftUI

struct GridView: View {
    @EnvironmentObject var viewModel: StarBattleViewModel
    let rows: Int
    let columns: Int
    let spacing: CGFloat = 4 // Abstand zwischen den Zellen
    
    var body: some View {
        VStack(spacing: spacing) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(0..<columns, id: \.self) { column in
                        CellView()
                    }
                }
            }
        }
        .padding(spacing)
        .background(Color.gray)
    }
}

struct CellView: View {
    @State private var content: String? = nil // Inhalt der Zelle, z.B. Mine oder Zahl
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 30, height: 30)
            .overlay(
                Rectangle()
                    .stroke(Color.black, lineWidth: 1)
            )
            .onTapGesture {
                            placeContent()
                        }
    }
    
    private func placeContent() {
        // Beispiel: Setzt einen Platzhalterinhalt bei Klick
        if content == nil {
            content = "X" // Beispiel: Eine Mine setzen
        }
        else if content == "X" {
            content = "⭐" // Beispiel: Eine Mine setzen
        }
        else {
            content = nil
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(rows: 10, columns: 10)
            .previewLayout(.sizeThatFits)
    }
}

import SwiftUI
import UIKit

struct ConfettiView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: -10)
        emitter.emitterShape = .line
        emitter.emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 2)

        var cells: [CAEmitterCell] = []
        let colors: [UIColor] = [.systemRed, .systemBlue, .systemGreen, .systemOrange, .systemPurple]
        for color in colors {
            let cell = CAEmitterCell()
            cell.birthRate = 4
            cell.lifetime = 7.0
            cell.velocity = 200
            cell.velocityRange = 50
            cell.emissionLongitude = .pi
            cell.spinRange = 4
            cell.scale = 0.05
            cell.scaleRange = 0.02
            cell.color = color.cgColor
            cell.contents = UIImage(systemName: "circle.fill")?.cgImage
            cells.append(cell)
        }

        emitter.emitterCells = cells
        view.layer.addSublayer(emitter)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

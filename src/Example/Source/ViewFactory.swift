import SwiftUI
import UIKit

internal enum ViewFactory {

    static func makeUIView(
        size: CGSize = .zero,
        withLabel: Bool,
        backgroundColor: UIColor? = .blue
    ) -> UIView {
        let view: UIView = .init()
        view.frame.size = size
        view.backgroundColor = backgroundColor
        if withLabel {
            view.addSubview(makeUILabel())
        }
        return view
    }

    static func makeUIViewController(
        withLabel: Bool,
        backgroundColor: UIColor? = .green,
        onViewWillAppear: ((UIViewController) -> Void)? = nil
    ) -> UIViewController {
        class CustomViewController: UIViewController {

            private var onViewWillAppear: ((UIViewController) -> Void)?

            init(onViewWillAppear: ((UIViewController) -> Void)? = nil) {
                self.onViewWillAppear = onViewWillAppear
                super.init(nibName: nil, bundle: nil)
            }

            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }

            override func viewWillAppear(_ animated: Bool) {
                onViewWillAppear?(self)
                onViewWillAppear = nil
                super.viewWillAppear(animated)
            }
        }
        let vc: CustomViewController = .init(onViewWillAppear: onViewWillAppear)
        vc.view.backgroundColor = backgroundColor
        if withLabel {
            vc.view.addSubview(makeUILabel())
        }
        return vc
    }

    static func makeSwiftUIView(
        withLabel: Bool,
        backgroundColor: Color? = .purple
    ) -> some View {
        struct CustomView: View {
            let withLabel: Bool
            let backgroundColor: Color?

            var body: some View {
                ZStack {
                    if let backgroundColor = backgroundColor {
                        backgroundColor
                    }
                    if withLabel {
                        Text("Example")
                    }
                }
            }
        }
        return CustomView(
            withLabel: withLabel,
            backgroundColor: backgroundColor)
    }

    private static func makeUILabel() -> UILabel {
        let label: UILabel = .init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        label.text = "Example text"
        label.numberOfLines = 2
        return label
    }
}

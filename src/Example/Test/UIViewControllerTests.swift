@testable import Example
import TestKit
import XCTest

final class UIViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        isRecording = false
    }

    func test_makeUIViewController_iPhone13() {
        // GIVEN
        let vc: UIViewController = ViewFactory.makeUIViewController(withLabel: false)

        // THEN
        assertSnapshot(
            matching: vc,
            as: .image(on: .iPhone13))
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription)
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription(on: .iPhone13))
    }

    func test_makeUIViewController_withLabel_iPhone13() {
        // GIVEN
        let vc: UIViewController = ViewFactory.makeUIViewController(withLabel: true)

        // THEN
        assertSnapshot(
            matching: vc,
            as: .image(on: .iPhone13))
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription)
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription(on: .iPhone13))
    }

    func test_makeUIViewController_withLabel_setGradientVertical_iPhone13() {
        // GIVEN
        let vc: UIViewController = ViewFactory.makeUIViewController(
            withLabel: true,
            backgroundColor: nil
        ) {
            $0.view.setGradient(direction: .vertical)
        }

        // THEN
        assertSnapshot(
            matching: vc,
            as: .image(on: .iPhone13))
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription)
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription(on: .iPhone13))
    }

    func test_makeUIViewController_withLabel_setGradientHorizontal_iPhone13() {
        // GIVEN
        let vc: UIViewController = ViewFactory.makeUIViewController(
            withLabel: true,
            backgroundColor: nil
        ) {
            $0.view.setGradient(direction: .horizontal)
        }

        // THEN
        assertSnapshot(
            matching: vc,
            as: .image(on: .iPhone13))
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription)
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription(on: .iPhone13))
    }

    func test_makeUIViewController_withLabel_backgroundColorWhite_iPhone13() {
        // GIVEN
        let vc: UIViewController = ViewFactory.makeUIViewController(
            withLabel: true,
            backgroundColor: .white)

        // THEN
        assertSnapshot(
            matching: vc,
            as: .image(on: .iPhone13))
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription)
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription(on: .iPhone13))
    }

    func test_makeUIViewController_withLabel_backgroundColorClear_iPhone13() {
        // GIVEN
        let vc: UIViewController = ViewFactory.makeUIViewController(
            withLabel: true,
            backgroundColor: .clear)

        // THEN
        assertSnapshot(
            matching: vc,
            as: .image(on: .iPhone13))
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription)
        assertSnapshot(
            matching: vc,
            as: .recursiveDescription(on: .iPhone13))
    }
}

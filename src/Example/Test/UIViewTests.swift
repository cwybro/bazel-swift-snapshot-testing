@testable import Example
import TestKit
import XCTest

final class UIViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
        isRecording = false
    }

    func makeSize() -> CGSize {
        .init(width: 100, height: 100)
    }

    func test_makeUIView() {
        // GIVEN
        let view: UIView = ViewFactory.makeUIView(withLabel: false)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(size: makeSize()))
        assertSnapshot(
            matching: view,
            as: .recursiveDescription)
        assertSnapshot(
            matching: view,
            as: .recursiveDescription(size: makeSize()))
    }

    func test_makeUIView_withLabel() {
        // GIVEN
        let view: UIView = ViewFactory.makeUIView(withLabel: true)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(size: makeSize()))
        assertSnapshot(
            matching: view,
            as: .recursiveDescription)
        assertSnapshot(
            matching: view,
            as: .recursiveDescription(size: makeSize()))
    }

    func test_makeUIView_withLabel_setGradientVertical() {
        // GIVEN
        let size: CGSize = makeSize()
        let view: UIView = ViewFactory.makeUIView(
            size: size,
            withLabel: true,
            backgroundColor: nil)
        view.setGradient(direction: .vertical)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(size: size))
        assertSnapshot(
            matching: view,
            as: .recursiveDescription)
        assertSnapshot(
            matching: view,
            as: .recursiveDescription(size: size))
    }

    func test_makeUIView_withLabel_setGradientHorizontal() {
        // GIVEN
        let size: CGSize = makeSize()
        let view: UIView = ViewFactory.makeUIView(
            size: size,
            withLabel: true,
            backgroundColor: nil)
        view.setGradient(direction: .horizontal)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(size: size))
        assertSnapshot(
            matching: view,
            as: .recursiveDescription)
        assertSnapshot(
            matching: view,
            as: .recursiveDescription(size: size))
    }

    func test_makeUIView_withLabel_backgroundColorWhite() {
        // GIVEN
        let view: UIView = ViewFactory.makeUIView(
            withLabel: true,
            backgroundColor: .white)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(size: makeSize()))
        assertSnapshot(
            matching: view,
            as: .recursiveDescription)
        assertSnapshot(
            matching: view,
            as: .recursiveDescription(size: makeSize()))
    }

    func test_makeUIView_withLabel_backgroundColorClear() {
        // GIVEN
        let view: UIView = ViewFactory.makeUIView(
            withLabel: true,
            backgroundColor: .clear)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(size: makeSize()))
        assertSnapshot(
            matching: view,
            as: .recursiveDescription)
        assertSnapshot(
            matching: view,
            as: .recursiveDescription(size: makeSize()))
    }
}

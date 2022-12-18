@testable import Example
import SwiftUI
import TestKit
import XCTest

final class SwiftUIViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
        isRecording = false
    }

    func test_makeSwiftUIView_iPhone13() {
        // GIVEN
        let view: some View = ViewFactory.makeSwiftUIView(withLabel: false)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(layout: .device(config: .iPhone13)))
    }

    func test_makeSwiftUIView_fixed() {
        // GIVEN
        let view: some View = ViewFactory.makeSwiftUIView(withLabel: false)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(layout: .fixed(width: 100, height: 100)))
    }

    func test_makeSwiftUIView_withLabel_iPhone13() {
        // GIVEN
        let view: some View = ViewFactory.makeSwiftUIView(withLabel: true)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(layout: .device(config: .iPhone13)))
    }

    func test_makeSwiftUIView_withLabel_fixed() {
        // GIVEN
        let view: some View = ViewFactory.makeSwiftUIView(withLabel: true)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(layout: .fixed(width: 100, height: 100)))
    }

    func test_makeSwiftUIView_withLabel_backgroundColorWhite_iPhone13() {
        // GIVEN
        let view: some View = ViewFactory.makeSwiftUIView(
            withLabel: true,
            backgroundColor: .white)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(layout: .device(config: .iPhone13)))
    }

    func test_makeSwiftUIView_withLabel_backgroundColorWhite_fixed() {
        // GIVEN
        let view: some View = ViewFactory.makeSwiftUIView(
            withLabel: true,
            backgroundColor: .white)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(layout: .fixed(width: 100, height: 100)))
    }

    func test_makeSwiftUIView_withLabel_backgroundColorClear_iPhone13() {
        // GIVEN
        let view: some View = ViewFactory.makeSwiftUIView(
            withLabel: true,
            backgroundColor: .clear)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(layout: .device(config: .iPhone13)))
    }

    func test_makeSwiftUIView_withLabel_backgroundColorClear_fixed() {
        // GIVEN
        let view: some View = ViewFactory.makeSwiftUIView(
            withLabel: true,
            backgroundColor: .clear)

        // THEN
        assertSnapshot(
            matching: view,
            as: .image(layout: .fixed(width: 100, height: 100)))
    }
}

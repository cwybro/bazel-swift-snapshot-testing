import Foundation
import PathKit
import SnapshotTesting
import XCTest

public var isRecording: Bool {
    get {
        SnapshotTesting.isRecording
    }
    set {
        SnapshotTesting.isRecording = newValue
    }
}

private enum AssertSnapshotError: Error, CustomStringConvertible {
    case missingEnvironmentKey(String)
    case missingPathComponent(path: String, component: String)

    var description: String {
        switch self {
            case let .missingEnvironmentKey(key):
                return "Missing key in environment: '\(key)'"
            case let .missingPathComponent(path, component):
                return """
                    Missing component in file path:
                    - component: \(component)
                    - path: \(path)
                    """
        }
    }
}

public func assertSnapshot<Value, Format>(
    matching value: @autoclosure () throws -> Value,
    as snapshotting: Snapshotting<Value, Format>,
    named name: String? = nil,
    record recording: Bool = false,
    timeout: TimeInterval = 5,
    file: StaticString = #file,
    testName: String = #function,
    line: UInt = #line
) {
    SnapshotTesting.diffTool = "ksdiff"
    do {
        let snapshotDirectory: Path = try makeSnapshotDirectory(file: file)
        try snapshotDirectory.mkpath()
        let failure = verifySnapshot(
            matching: try value(),
            as: snapshotting,
            named: name,
            record: recording,
            snapshotDirectory: snapshotDirectory.string,
            timeout: timeout,
            file: file,
            testName: testName)
        guard let message = failure else { return }
        XCTFail(message, file: file, line: line)
    } catch {
        XCTFail("\(error)", file: file, line: line)
    }
 }

private func environmentValue(key: String) throws -> String {
    guard let value: String = ProcessInfo.processInfo.environment[key] else {
        throw AssertSnapshotError.missingEnvironmentKey(key)
    }
    return value
}

private func makeSnapshotDirectory(file: StaticString) throws -> Path {
    let targetName: String = try environmentValue(key: "TARGET_NAME")
    let workspacePath: String = try environmentValue(key: "WORKSPACE_PATH")
    let testFilePath: Path = .init("\(workspacePath)/\(file)")
    let testPathComponent: String = "Test"
    guard let testIndex = testFilePath.components.firstIndex(of: testPathComponent) else {
        throw AssertSnapshotError.missingPathComponent(path: testFilePath.string, component: testPathComponent)
    }
    let newPathComponents: [String] = testFilePath.components.dropLast(testFilePath.components.count - testIndex)
    return  Path(components: newPathComponents) + "TestResources" + targetName + "__Snapshots__"
}

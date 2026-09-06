import Foundation

public enum QimenError: Error {
    case engineMissing
    case execution(String)
    case invalidOutput
}

private func runQimen(_ input: [String: Any]) throws -> [String: Any] {
    guard let url = Bundle.module.url(forResource: "engine", withExtension: "cjs") else {
        throw QimenError.engineMissing
    }
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    process.arguments = ["node", url.path]
    let stdin = Pipe()
    let stdout = Pipe()
    process.standardInput = stdin
    process.standardOutput = stdout
    process.standardError = Pipe()
    try process.run()
    stdin.fileHandleForWriting.write(try JSONSerialization.data(withJSONObject: input))
    stdin.fileHandleForWriting.closeFile()
    process.waitUntilExit()
    let output = stdout.fileHandleForReading.readDataToEndOfFile()
    guard let envelope = try JSONSerialization.jsonObject(with: output) as? [String: Any] else {
        throw QimenError.invalidOutput
    }
    if process.terminationStatus != 0 || (envelope["ok"] as? Bool) != true {
        throw QimenError.execution(envelope["error"] as? String ?? "engine failed")
    }
    return envelope
}

public func calculateQimen(_ input: [String: Any]) throws -> [String: Any] {
    guard let data = try runQimen(input)["data"] as? [String: Any] else {
        throw QimenError.invalidOutput
    }
    return data
}

public func canonicalQimen(_ input: [String: Any]) throws -> [String: Any] {
    guard let canonical = try runQimen(input)["canonical"] as? [String: Any] else {
        throw QimenError.invalidOutput
    }
    return canonical
}

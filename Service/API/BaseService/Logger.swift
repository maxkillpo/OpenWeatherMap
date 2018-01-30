import XCGLogger

class Logger: XCGLogger {

    private static var xcgLogger: XCGLogger? = nil

    private init(){}

    open static var sharedInstance: XCGLogger = {
        struct Statics {
            static let log = Logger.xcgLogger == nil ? setup() : Logger.xcgLogger
        }
        return Statics.log!
    }()

    private static func setup() -> XCGLogger {
        let log = XCGLogger.default
        #if DEBUG // Set via Build Settings, under Other Swift Flags
            log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true)
        #else
            log.setup(level: .severe, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true)
        #endif
        let emojiLogFormatter = PrePostFixLogFormatter()
        emojiLogFormatter.apply(prefix: "🗯🗯🗯 ", postfix: " 🗯🗯🗯", to: .verbose)
        emojiLogFormatter.apply(prefix: "🔹🔹🔹 ", postfix: " 🔹🔹🔹", to: .debug)
        emojiLogFormatter.apply(prefix: "ℹ️ℹ️ℹ️ ", postfix: " ℹ️ℹ️ℹ️", to: .info)
        emojiLogFormatter.apply(prefix: "⚠️⚠️⚠️ ", postfix: " ⚠️⚠️⚠️", to: .warning)
        emojiLogFormatter.apply(prefix: "‼️‼️‼️ ", postfix: " ‼️‼️‼️", to: .error)
        emojiLogFormatter.apply(prefix: "💣💣💣 ", postfix: " 💣💣💣", to: .severe)
        log.formatters = [emojiLogFormatter]
        return log
    }
}


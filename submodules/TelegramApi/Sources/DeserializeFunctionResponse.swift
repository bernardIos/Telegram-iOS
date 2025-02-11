import Foundation

public final class FunctionDescription {
    public let name: String
    public let parameters: [(String, Any)]
    
    init(name: String, parameters: [(String, Any)],_ file: StaticString = #file,
         _ function: StaticString = #function, _ line: UInt = #line) {
        
        let fileName = file.description.components(separatedBy: "/").last!
              let source = "\(fileName):\(line) - \(function)"
        
        print("🪓 API: \(name)"," params:",parameters," source:",source)
        self.name = name
        self.parameters = parameters
    }
}

public final class DeserializeFunctionResponse<T> {
    private let f: (Buffer) -> T?
    
    public init(_ f: @escaping (Buffer) -> T?) {
        self.f = f
    }
    
    public func parse(_ buffer: Buffer) -> T? {
        return self.f(buffer)
    }
}

public protocol TypeConstructorDescription {
    func descriptionFields() -> (String, [(String, Any)])
}

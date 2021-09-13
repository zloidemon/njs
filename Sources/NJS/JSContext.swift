import CNJS
import EmbeddingLanguage

public class JSContext {
    let vm: OpaquePointer
    let options: njs_vm_opt_t

    public convenience init() throws {
        var options = njs_vm_opt_t()
        options.`init` = 1
        options.backtrace = 1
        try self.init(options: options)
    }

    public init(options: njs_vm_opt_t) throws {
        var options = options
        guard let vm = njs_vm_create(&options) else {
            throw Error(
                message: "njs_vm_create() failed",
                source: "njs_vm_create")
        }
        self.vm = vm
        self.options = options
    }

    private init(vm: OpaquePointer, options: njs_vm_opt_t) {
        self.vm = vm
        self.options = options
    }

    deinit {
        njs_vm_destroy(vm)
    }

    // 1.
    private func compile(_ script: String) throws {
        try script.withCString { start in
            var start = UnsafeMutablePointer<UInt8>(start)
            let end = start?.advanced(by: script.count)
            guard njs_vm_compile(vm, &start, end) == NJS_OK else {
                throw Error(from: "njs_vm_compile", in: vm)
            }
        }
    }

    // 2.
    private func start() throws {
        guard njs_vm_start(vm) == NJS_OK else {
            throw Error(from: "njs_vm_start", in: vm)
        }
    }

    public func evaluate(_ script: String) throws -> JSValue {
        try compile(script)
        try start()
        guard let pointer = njs_vm_retval(vm) else {
            throw Error(from: "njs_vm_retval", in: vm)
        }
        return JSValue(pointer, in: vm)
    }

    public func clone() throws -> JSContext {
        guard let pointer = njs_vm_clone(vm, nil) else {
            throw Error(from: "njs_vm_clone", in: vm)
        }
        return JSContext(vm: pointer, options: options)
    }
}

extension UnsafeMutablePointer where Pointee == UInt8 {
    init?(_ pointer: UnsafePointer<Int8>) {
        self = UnsafeMutableRawPointer(mutating: pointer)
            .assumingMemoryBound(to: UInt8.self)
    }
}

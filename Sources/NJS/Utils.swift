import CNJS

extension String {
    init(retvalIn vm: OpaquePointer) {
        var s = njs_str_t()
        njs_vm_retval_string(vm, &s)
        self = String(s)
    }
}

extension String {
    init(_ s: njs_str_t) {
        let buffer = UnsafeBufferPointer(start: s.start, count: s.length)
        self.init(decoding: buffer, as: UTF8.self)
    }
}

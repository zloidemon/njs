import CNJS

extension String {
    init(retvalIn vm: OpaquePointer) {
        var s = nxt_str_t()
        njs_vm_retval_to_ext_string(vm, &s)
        self = String(s)
    }
}

extension String {
    init(_ s: nxt_str_t) {
        let buffer = UnsafeBufferPointer(start: s.start, count: s.length)
        self.init(decoding: buffer, as: UTF8.self)
    }
}

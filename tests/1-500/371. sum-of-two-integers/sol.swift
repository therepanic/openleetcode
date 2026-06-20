class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a & 0xffffffff
        var b = b & 0xffffffff
        while b != 0 {
            let c = (a & b) << 1
            a = (a ^ b) & 0xffffffff
            b = c & 0xffffffff
        }
        return a < 0x80000000 ? a : ~(a ^ 0xffffffff)
    }
}

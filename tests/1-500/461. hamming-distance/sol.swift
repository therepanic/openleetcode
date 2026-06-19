class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var count = 0
        var a = x
        var b = y
        if a == b {
            return count
        }
        while a > 0 || b > 0 {
            var a_bit = 0
            var b_bit = 0
            if a > 0 {
                a_bit = a % 2
                a = a / 2
            }
            if b > 0 {
                b_bit = b % 2
                b = b / 2
            }
            if a_bit != b_bit {
                count += 1
            }
        }
        return count
    }
}

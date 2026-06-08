class Solution {
    func reverse(_ x: Int) -> Int {
        var num = Int64(x)
        var res: Int64 = 0

        while num != 0 {
            res = res * 10 + num % 10
            num /= 10
            if res < Int64(Int32.min) || res > Int64(Int32.max) {
                return 0
            }
        }

        return Int(res)
    }
}

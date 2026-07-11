class Solution {
    func bitwiseComplement(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }
        let bitLength = String(n, radix: 2).count
        let mask = (1 << bitLength) - 1
        return n ^ mask
    }
}

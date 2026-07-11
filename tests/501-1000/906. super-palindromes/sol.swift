class Solution {
    func superpalindromesInRange(_ left: String, _ right: String) -> Int {
        let L = Int64(left)!
        let R = Int64(right)!
        var count = 0
        for i in 1...100000 {
            let s = String(i)
            let rev = String(s.reversed())
            let palindromes: [Int64] = [
                Int64(s + String(rev.dropFirst()))!,
                Int64(s + rev)!
            ]
            for root in palindromes {
                if root > 1_000_000_000 {
                    continue
                }
                let sq = root * root
                if sq < L {
                    continue
                }
                if sq > R {
                    continue
                }
                let str = String(sq)
                if str == String(str.reversed()) {
                    count += 1
                }
            }
            if Int64(i) * Int64(i) > R {
                break
            }
        }
        return count
    }
}

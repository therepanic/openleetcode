class Solution {
    func countPairs(_ deliciousness: [Int]) -> Int {
        let MOD = 1_000_000_007
        var maxVal = 0
        for d in deliciousness {
            maxVal = max(maxVal, d)
        }
        let powers = (0..<22).map { 1 << $0 }
        var count = [Int: Int]()
        var res = 0

        for val in deliciousness {
            for target in powers {
                let complement = target - val
                if let c = count[complement] {
                    res += c
                    res %= MOD
                }
            }
            count[val, default: 0] += 1
        }
        return res
    }
}

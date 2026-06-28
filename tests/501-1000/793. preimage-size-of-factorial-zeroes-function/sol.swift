class Solution {
    func preimageSizeFZF(_ k: Int) -> Int {
        func trailingZeroes(_ n: Int) -> Int {
            var count = 0
            var power = 5
            while power <= n {
                count += n / power
                power *= 5
            }
            return count
        }
        
        var start = k * 4
        while true {
            let H = trailingZeroes(start)
            if H == k {
                return 5
            }
            if H > k {
                break
            }
            start += 1
        }
        return 0
    }
}

class Solution {
    func countDifferentSubsequenceGCDs(_ nums: [Int]) -> Int {
        let seen = Set(nums)
        let maxi = nums.max() ?? 0
        var cnt = 0
        for i in 1...maxi {
            var gd = 0
            var j = i
            while j <= maxi {
                if seen.contains(j) {
                    gd = gcd(gd, j)
                }
                j += i
            }
            if gd == i {
                cnt += 1
            }
        }
        return cnt
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let temp = x % y
            x = y
            y = temp
        }
        return x
    }
}

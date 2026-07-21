class Solution {
    func isGoodArray(_ nums: [Int]) -> Bool {
        var g = nums[0]
        for num in nums[1...] {
            g = gcd(g, num)
        }
        return g == 1
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let t = y
            y = x % y
            x = t
        }
        return x
    }
}

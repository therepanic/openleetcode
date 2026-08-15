class Solution {
    func findGCD(_ nums: [Int]) -> Int {
        let a = nums.min()!
        let b = nums.max()!
        return gcd(a, b)
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        return x
    }
}

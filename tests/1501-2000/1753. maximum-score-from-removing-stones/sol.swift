class Solution {
    func maximumScore(_ a: Int, _ b: Int, _ c: Int) -> Int {
        let sum = a + b + c
        return min(sum - max(a, b, c), sum / 2)
    }
}

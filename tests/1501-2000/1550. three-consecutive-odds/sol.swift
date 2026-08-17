class Solution {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        return arr.map { String($0 & 1) }.joined().contains("111")
    }
}

class Solution {
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        let sorted = arr.sorted()
        let diff = sorted[1] - sorted[0]
        for i in 0..<sorted.count - 1 {
            if sorted[i+1] - sorted[i] != diff {
                return false
            }
        }
        return true
    }
}

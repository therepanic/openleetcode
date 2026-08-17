class Solution {
    func trimMean(_ arr: [Int]) -> Double {
        let n = arr.count
        let per5 = Int(0.05 * Double(n))
        let sorted = arr.sorted()
        let sum = sorted[per5..<(n-per5)].reduce(0, +)
        return Double(sum) / Double(n - per5 - per5)
    }
}

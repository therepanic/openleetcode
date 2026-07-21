class Solution {
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var mpp = [Int](repeating: 0, count: 100)
        var count = 0
        for d in dominoes {
            let a = d[0], b = d[1]
            let key = a <= b ? a * 10 + b : b * 10 + a
            count += mpp[key]
            mpp[key] += 1
        }
        return count
    }
}

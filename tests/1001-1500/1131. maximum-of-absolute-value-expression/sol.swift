class Solution {
    func maxAbsValExpr(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var res = 0
        let n = arr1.count
        let signs = [(1, 1), (1, -1), (-1, 1), (-1, -1)]

        for (p, q) in signs {
            var maxVal = Int.min
            var minVal = Int.max
            for i in 0..<n {
                let value = p * arr1[i] + q * arr2[i] + i
                maxVal = max(maxVal, value)
                minVal = min(minVal, value)
            }
            res = max(res, maxVal - minVal)
        }

        return res
    }
}

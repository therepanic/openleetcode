class Solution {
    func maxMatrixSum(_ matrix: [[Int]]) -> Int {
        var totalSum = 0
        var neg = 0
        var minAbs = Int.max
        for row in matrix {
            for v in row {
                if v < 0 { neg += 1 }
                let av = abs(v)
                totalSum += av
                minAbs = min(minAbs, av)
            }
        }
        return neg % 2 == 0 ? totalSum : totalSum - 2 * minAbs
    }
}

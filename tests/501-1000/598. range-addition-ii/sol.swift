class Solution {
    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        if ops.isEmpty {
            return m * n
        }
        var minM = m
        var minN = n
        for op in ops {
            minM = min(minM, op[0])
            minN = min(minN, op[1])
        }
        return minM * minN
    }
}

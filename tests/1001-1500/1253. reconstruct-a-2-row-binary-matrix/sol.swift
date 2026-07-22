class Solution {
    func reconstructMatrix(_ upper: Int, _ lower: Int, _ colsum: [Int]) -> [[Int]] {
        let sum = colsum.reduce(0, +)
        if upper + lower != sum { return [] }
        
        let n = colsum.count
        var row1 = Array(repeating: 0, count: n)
        var row2 = Array(repeating: 0, count: n)
        var u = upper
        var l = lower
        
        for i in 0..<n {
            if colsum[i] == 2 {
                row1[i] = 1
                row2[i] = 1
                u -= 1
                l -= 1
            } else if colsum[i] == 1 {
                if u > l {
                    row1[i] = 1
                    u -= 1
                } else {
                    row2[i] = 1
                    l -= 1
                }
            }
        }
        
        return l == 0 && u == 0 ? [row1, row2] : []
    }
}

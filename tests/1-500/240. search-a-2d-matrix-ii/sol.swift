class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var v = false
        for i in matrix {
            for j in 0..<i.count {
                if i[j] == target {
                    v = true
                }
            }
        }
        return v
    }
}

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || numRows >= s.count {
            return s
        }

        var rows = Array(repeating: "", count: numRows)
        var idx = 0
        var step = 1

        for ch in s {
            rows[idx].append(ch)
            if idx == 0 {
                step = 1
            } else if idx == numRows - 1 {
                step = -1
            }
            idx += step
        }

        return rows.joined()
    }
}

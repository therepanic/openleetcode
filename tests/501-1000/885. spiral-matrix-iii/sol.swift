class Solution {
    func spiralMatrixIII(_ rows: Int, _ cols: Int, _ rStart: Int, _ cStart: Int) -> [[Int]] {
        let total = rows * cols
        var res: [[Int]] = []
        res.append([rStart, cStart])
        var top = rStart, bottom = rStart
        var left = cStart, right = cStart
        while res.count < total {
            right += 1
            for i in (left + 1)...right {
                if top >= 0 && top < rows && i >= 0 && i < cols {
                    res.append([top, i])
                    if res.count == total { return res }
                }
            }
            bottom += 1
            for i in (top + 1)...bottom {
                if right >= 0 && right < cols && i >= 0 && i < rows {
                    res.append([i, right])
                    if res.count == total { return res }
                }
            }
            left -= 1
            for i in stride(from: right - 1, through: left, by: -1) {
                if i >= 0 && i < cols && bottom >= 0 && bottom < rows {
                    res.append([bottom, i])
                    if res.count == total { return res }
                }
            }
            top -= 1
            for i in stride(from: bottom - 1, through: top, by: -1) {
                if i >= 0 && i < rows && left >= 0 && left < cols {
                    res.append([i, left])
                    if res.count == total { return res }
                }
            }
        }
        return res
    }
}

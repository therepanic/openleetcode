class Solution {
    func rotateTheBox(_ boxGrid: [[Character]]) -> [[Character]] {
        let r = boxGrid.count
        let c = boxGrid[0].count
        var rotate = Array(repeating: Array(repeating: Character("."), count: r), count: c)
        for i in 0..<r {
            var bottom = c - 1
            for j in stride(from: c - 1, through: 0, by: -1) {
                if boxGrid[i][j] == "#" {
                    rotate[bottom][r - 1 - i] = "#"
                    bottom -= 1
                } else if boxGrid[i][j] == "*" {
                    rotate[j][r - 1 - i] = "*"
                    bottom = j - 1
                }
            }
        }
        return rotate
    }
}

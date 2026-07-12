class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var tower = Array(repeating: Array(repeating: 0.0, count: 102), count: 102)
        tower[0][0] = Double(poured)
        
        for r in 0...query_row {
            for c in 0...r {
                if tower[r][c] > 1 {
                    let excess = (tower[r][c] - 1.0) / 2.0
                    tower[r][c] = 1
                    tower[r+1][c] += excess
                    tower[r+1][c+1] += excess
                }
            }
        }
        
        return tower[query_row][query_glass]
    }
}

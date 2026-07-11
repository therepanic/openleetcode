impl Solution {
    pub fn champagne_tower(poured: i32, query_row: i32, query_glass: i32) -> f64 {
        let mut tower = vec![vec![0.0f64; 102]; 102];
        tower[0][0] = poured as f64;
        
        for r in 0..=query_row as usize {
            for c in 0..=r {
                if tower[r][c] > 1.0 {
                    let excess = (tower[r][c] - 1.0) / 2.0;
                    tower[r][c] = 1.0;
                    tower[r+1][c] += excess;
                    tower[r+1][c+1] += excess;
                }
            }
        }
        
        tower[query_row as usize][query_glass as usize]
    }
}

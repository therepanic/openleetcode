impl Solution {
    pub fn least_bricks(wall: Vec<Vec<i32>>) -> i32 {
        use std::collections::HashMap;
        let mut edge_counts = HashMap::new();
        for row in &wall {
            let mut edge = 0;
            for &brick in &row[..row.len()-1] {
                edge += brick;
                *edge_counts.entry(edge).or_insert(0) += 1;
            }
        }
        let max_edges = edge_counts.values().max().copied().unwrap_or(0);
        wall.len() as i32 - max_edges
    }
}

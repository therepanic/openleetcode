use std::collections::{HashMap, HashSet};

impl Solution {
    pub fn grid_illumination(n: i32, lamps: Vec<Vec<i32>>, queries: Vec<Vec<i32>>) -> Vec<i32> {
        let mut row_count: HashMap<i32, i32> = HashMap::new();
        let mut col_count: HashMap<i32, i32> = HashMap::new();
        let mut diag1: HashMap<i32, i32> = HashMap::new();
        let mut diag2: HashMap<i32, i32> = HashMap::new();
        let mut lamp_set: HashSet<(i32, i32)> = HashSet::new();
        let mut ans = vec![0; queries.len()];
        let dirs: [(i32, i32); 9] = [
            (-1,-1), (-1,0), (-1,1),
            (0,-1),  (0,0),  (0,1),
            (1,-1),  (1,0),  (1,1)
        ];
        
        for lamp in &lamps {
            let r = lamp[0];
            let c = lamp[1];
            if !lamp_set.contains(&(r, c)) {
                lamp_set.insert((r, c));
                *row_count.entry(r).or_insert(0) += 1;
                *col_count.entry(c).or_insert(0) += 1;
                *diag1.entry(r - c).or_insert(0) += 1;
                *diag2.entry(r + c).or_insert(0) += 1;
            }
        }
        
        for i in 0..queries.len() {
            let r = queries[i][0];
            let c = queries[i][1];
            if *row_count.get(&r).unwrap_or(&0) > 0 || 
               *col_count.get(&c).unwrap_or(&0) > 0 || 
               *diag1.get(&(r - c)).unwrap_or(&0) > 0 || 
               *diag2.get(&(r + c)).unwrap_or(&0) > 0 {
                ans[i] = 1;
                for &(dr, dc) in &dirs {
                    let nr = r + dr;
                    let nc = c + dc;
                    if lamp_set.contains(&(nr, nc)) {
                        lamp_set.remove(&(nr, nc));
                        *row_count.get_mut(&nr).unwrap() -= 1;
                        *col_count.get_mut(&nc).unwrap() -= 1;
                        *diag1.get_mut(&(nr - nc)).unwrap() -= 1;
                        *diag2.get_mut(&(nr + nc)).unwrap() -= 1;
                    }
                }
            }
        }
        ans
    }
}

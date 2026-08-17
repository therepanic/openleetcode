impl Solution {
    pub fn is_printable(target_grid: Vec<Vec<i32>>) -> bool {
        let mut grid = target_grid;
        let m = grid.len();
        let n = grid[0].len();
        use std::collections::HashMap;
        use std::collections::HashSet;
        let mut colors: HashMap<i32, Vec<(usize, usize)>> = HashMap::new();
        for i in 0..m {
            for j in 0..n {
                colors.entry(grid[i][j]).or_insert_with(Vec::new).push((i, j));
            }
        }
        
        fn can_remove(grid: &mut Vec<Vec<i32>>, color: i32, pos: &Vec<(usize, usize)>) -> bool {
            let mn_r = pos.iter().map(|&(r, _)| r).min().unwrap();
            let mx_r = pos.iter().map(|&(r, _)| r).max().unwrap();
            let mn_c = pos.iter().map(|&(_, c)| c).min().unwrap();
            let mx_c = pos.iter().map(|&(_, c)| c).max().unwrap();
            for i in mn_r..=mx_r {
                for j in mn_c..=mx_c {
                    if grid[i][j] != color && grid[i][j] > 0 { return false; }
                }
            }
            for i in mn_r..=mx_r {
                for j in mn_c..=mx_c {
                    grid[i][j] = 0;
                }
            }
            true
        }
        
        let mut color_set: HashSet<i32> = colors.keys().cloned().collect();
        while !color_set.is_empty() {
            let mut removable: HashSet<i32> = HashSet::new();
            for &c in &color_set {
                if can_remove(&mut grid, c, &colors[&c]) {
                    removable.insert(c);
                }
            }
            if removable.is_empty() { return false; }
            color_set = color_set.difference(&removable).cloned().collect();
        }
        true
    }
}

impl Solution {
    pub fn largest_overlap(img1: Vec<Vec<i32>>, img2: Vec<Vec<i32>>) -> i32 {
        let n = img1.len();
        let mut a = vec![];
        let mut b = vec![];
        for i in 0..n {
            for j in 0..n {
                if img1[i][j] == 1 {
                    a.push((i as i32, j as i32));
                }
                if img2[i][j] == 1 {
                    b.push((i as i32, j as i32));
                }
            }
        }
        let mut cnt = std::collections::HashMap::new();
        for &(x1, y1) in &a {
            for &(x2, y2) in &b {
                *cnt.entry((x1 - x2, y1 - y2)).or_insert(0) += 1;
            }
        }
        cnt.values().max().cloned().unwrap_or(0)
    }
}

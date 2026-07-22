impl Solution {
    pub fn kth_smallest(mat: Vec<Vec<i32>>, k: i32) -> i32 {
        let k = k as usize;
        let mut sums: Vec<i32> = mat[0].iter().take(k).cloned().collect();
        for row in mat.iter().skip(1) {
            let row_k: Vec<i32> = row.iter().take(k).cloned().collect();
            let mut next: Vec<i32> = Vec::with_capacity(sums.len() * row_k.len());
            for &a in &sums {
                for &b in &row_k {
                    next.push(a + b);
                }
            }
            next.sort_unstable();
            next.truncate(k);
            sums = next;
        }
        sums[k - 1]
    }
}

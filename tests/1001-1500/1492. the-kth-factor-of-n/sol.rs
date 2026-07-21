impl Solution {
    pub fn kth_factor(n: i32, k: i32) -> i32 {
        let mut ab = Vec::new();
        for i in 1..=n {
            if n % i == 0 {
                ab.push(i);
            }
        }
        if (ab.len() as i32) < k {
            -1
        } else {
            ab[(k - 1) as usize]
        }
    }
}

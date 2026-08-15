impl Solution {
    pub fn count_different_subsequence_gc_ds(nums: Vec<i32>) -> i32 {
        let seen: std::collections::HashSet<i32> = nums.iter().cloned().collect();
        let maxi = *nums.iter().max().unwrap_or(&0);
        let mut cnt = 0;
        for i in 1..=maxi {
            let mut gd = 0;
            let mut j = i;
            while j <= maxi {
                if seen.contains(&j) {
                    gd = Self::gcd(gd, j);
                }
                j += i;
            }
            if gd == i {
                cnt += 1;
            }
        }
        cnt
    }
    
    fn gcd(a: i32, b: i32) -> i32 {
        let mut x = a;
        let mut y = b;
        while y != 0 {
            let temp = x % y;
            x = y;
            y = temp;
        }
        x
    }
}

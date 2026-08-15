impl Solution {
    pub fn min_moves(nums: Vec<i32>, k: i32) -> i32 {
        let idx: Vec<usize> = nums.iter().enumerate().filter(|&(_, &v)| v == 1).map(|(i, _)| i).collect();
        let n = idx.len();
        let a: Vec<i64> = (0..n).map(|i| (idx[i] as i64 - i as i64)).collect();
        let mut prefix = vec![0i64; n];
        if n > 0 {
            prefix[0] = a[0];
            for i in 1..n {
                prefix[i] = prefix[i-1] + a[i];
            }
        }
        let mut ans = i64::MAX;
        let mut l = 0;
        for r in 0..n {
            while (r - l + 1) as i32 > k {
                l += 1;
            }
            if (r - l + 1) as i32 == k {
                let mid = (l + r) / 2;
                let med = a[mid];
                let left_sum = prefix[mid] - if l > 0 { prefix[l-1] } else { 0 };
                let right_sum = prefix[r] - prefix[mid];
                let cost = (med * ((mid - l + 1) as i64) - left_sum) + (right_sum - med * ((r - mid) as i64));
                if cost < ans {
                    ans = cost;
                }
            }
        }
        ans as i32
    }
}

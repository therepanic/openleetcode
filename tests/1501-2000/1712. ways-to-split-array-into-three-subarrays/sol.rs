impl Solution {
    pub fn ways_to_split(nums: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let n = nums.len();
        let mut prefix = vec![0i64; n];
        prefix[0] = nums[0] as i64;
        
        for i in 1..n {
            prefix[i] = prefix[i - 1] + nums[i] as i64;
        }
        
        let mut res: i64 = 0;
        for i in 0..(n - 2) {
            let left = prefix[i];
            let j = Self::lower_bound(&prefix, 2 * left, i + 1, n - 1);
            let k = Self::upper_bound(&prefix, (prefix[n - 1] + left) / 2, j, n - 1);
            if j < k {
                res = (res + (k - j) as i64) % MOD;
            }
        }
        res as i32
    }
    
    fn lower_bound(arr: &Vec<i64>, target: i64, lo: usize, hi: usize) -> usize {
        let mut l = lo;
        let mut h = hi;
        while l < h {
            let mid = (l + h) / 2;
            if arr[mid] < target {
                l = mid + 1;
            } else {
                h = mid;
            }
        }
        l
    }
    
    fn upper_bound(arr: &Vec<i64>, target: i64, lo: usize, hi: usize) -> usize {
        let mut l = lo;
        let mut h = hi;
        while l < h {
            let mid = (l + h) / 2;
            if arr[mid] <= target {
                l = mid + 1;
            } else {
                h = mid;
            }
        }
        l
    }
}

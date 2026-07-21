impl Solution {
    pub fn range_sum(nums: Vec<i32>, n: i32, left: i32, right: i32) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let n = n as usize;
        let mut sums = Vec::with_capacity(n * (n + 1) / 2);
        for i in 0..n {
            let mut total = 0i64;
            for &v in &nums[i..] {
                total += v as i64;
                sums.push(total);
            }
        }
        sums.sort();
        let mut result = 0i64;
        for i in (left as usize - 1)..(right as usize) {
            result = (result + sums[i]) % MOD;
        }
        result as i32
    }
}

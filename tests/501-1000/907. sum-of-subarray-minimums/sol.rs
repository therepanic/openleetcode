impl Solution {
    pub fn sum_subarray_mins(arr: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let n = arr.len();
        let mut stack: Vec<usize> = Vec::with_capacity(n);
        let mut res = vec![0_i64; n];
        for i in 0..n {
            while let Some(&top) = stack.last() {
                if arr[top] > arr[i] {
                    stack.pop();
                } else {
                    break;
                }
            }
            let j = stack.last().copied().map_or(-1, |v| v as i32);
            let prev = if j >= 0 { res[j as usize] } else { 0 };
            res[i] = (prev + (i as i32 - j) as i64 * arr[i] as i64) % MOD;
            stack.push(i);
        }
        let mut sum: i64 = 0;
        for v in res {
            sum = (sum + v) % MOD;
        }
        sum as i32
    }
}

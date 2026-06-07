impl Solution {
    pub fn get_permutation(n: i32, k: i32) -> String {
        let n = n as usize;
        let mut nums = Vec::new();
        let mut factorial = vec![1; n + 1];

        for i in 1..=n {
            nums.push(i);
            factorial[i] = factorial[i - 1] * i as i32;
        }

        let mut k = k - 1;
        let mut res = String::new();
        for remaining in (1..=n).rev() {
            let block = factorial[remaining - 1];
            let idx = (k / block) as usize;
            k %= block;
            res.push_str(&nums[idx].to_string());
            nums.remove(idx);
        }

        res
    }
}

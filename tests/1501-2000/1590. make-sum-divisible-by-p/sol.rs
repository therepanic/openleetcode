impl Solution {
    pub fn min_subarray(nums: Vec<i32>, p: i32) -> i32 {
        let total: i64 = nums.iter().map(|&x| x as i64).sum();
        let target = (total % p as i64) as i32;
        if target == 0 {
            return 0;
        }

        let mut mp = std::collections::HashMap::new();
        mp.insert(0, -1);
        let mut prefix = 0;
        let mut res = nums.len() as i32;

        for (i, &x) in nums.iter().enumerate() {
            prefix = (prefix + x) % p;
            let need = (prefix - target + p) % p;

            if let Some(&idx) = mp.get(&need) {
                res = res.min(i as i32 - idx);
            }

            mp.insert(prefix, i as i32);
        }

        if res == nums.len() as i32 {
            -1
        } else {
            res
        }
    }
}

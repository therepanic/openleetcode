impl Solution {
    pub fn subarrays_div_by_k(nums: Vec<i32>, k: i32) -> i32 {
        let mut s = 0;
        let mut res = 0;
        let mut hs = std::collections::HashMap::new();
        hs.insert(0, 1);
        for num in nums {
            s += num;
            let mut rem = s % k;
            if rem < 0 {
                rem += k;
            }
            let count = hs.get(&rem).copied().unwrap_or(0);
            res += count;
            hs.insert(rem, count + 1);
        }
        res
    }
}

impl Solution {
    pub fn sum_even_after_queries(nums: Vec<i32>, queries: Vec<Vec<i32>>) -> Vec<i32> {
        let mut nums = nums;
        let mut total: i32 = nums.iter().filter(|&&x| x % 2 == 0).sum();
        let mut ans = Vec::with_capacity(queries.len());
        for q in queries {
            let val = q[0];
            let idx = q[1] as usize;
            if nums[idx] % 2 == 0 {
                total -= nums[idx];
            }
            nums[idx] += val;
            if nums[idx] % 2 == 0 {
                total += nums[idx];
            }
            ans.push(total);
        }
        ans
    }
}

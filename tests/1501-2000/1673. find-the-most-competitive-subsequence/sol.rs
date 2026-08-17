impl Solution {
    pub fn most_competitive(nums: Vec<i32>, k: i32) -> Vec<i32> {
        let k = k as usize;
        let mut stack: Vec<i32> = Vec::with_capacity(k);
        let n = nums.len();
        for (i, &num) in nums.iter().enumerate() {
            while let Some(&top) = stack.last() {
                if top > num && stack.len() + (n - i) > k {
                    stack.pop();
                } else {
                    break;
                }
            }
            stack.push(num);
        }
        stack.truncate(k);
        stack
    }
}

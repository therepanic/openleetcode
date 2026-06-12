impl Solution {
    pub fn rob(nums: Vec<i32>) -> i32 {
        let mut next1 = 0;
        let mut next2 = 0;
        for &value in nums.iter().rev() {
            let curr = (value + next2).max(next1);
            next2 = next1;
            next1 = curr;
        }
        next1
    }
}

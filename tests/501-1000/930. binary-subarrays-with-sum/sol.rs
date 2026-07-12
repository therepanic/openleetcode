impl Solution {
    pub fn num_subarrays_with_sum(nums: Vec<i32>, goal: i32) -> i32 {
        let n = nums.len();
        let mut pos_of_1s: Vec<i32> = vec![-1];
        let mut total: i32 = 0;
        let mut count: i32 = 0;
        
        if goal == 0 {
            for &num in &nums {
                if num == 0 {
                    count += 1;
                    total += count;
                } else {
                    count = 0;
                }
            }
            return total;
        }
        
        for (i, &num) in nums.iter().enumerate() {
            if num == 1 {
                pos_of_1s.push(i as i32);
            }
        }
        pos_of_1s.push(n as i32);
        
        let goal_usize = goal as usize;
        for i in 1..(pos_of_1s.len() - goal_usize) {
            let left_choices = pos_of_1s[i] - pos_of_1s[i - 1];
            let right_choices = pos_of_1s[i + goal_usize] - pos_of_1s[i + goal_usize - 1];
            total += left_choices * right_choices;
        }
        
        total
    }
}

impl Solution {
    pub fn num_squareful_perms(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut nums = nums;
        nums.sort();

        fn is_squareful(curr_nums: &Vec<i32>, num: i32) -> bool {
            if curr_nums.is_empty() {
                return true;
            }
            let prev_num = curr_nums[curr_nums.len() - 1];
            let pair_sum = prev_num + num;
            if pair_sum < 0 {
                return false;
            }
            let sqrt_n = (pair_sum as f64).sqrt() as i32;
            sqrt_n * sqrt_n == pair_sum
        }

        fn backtrack(nums: &Vec<i32>, n: usize, nums_mask: usize, curr_nums: &mut Vec<i32>) -> i32 {
            if nums_mask != 0 && curr_nums.len() == n {
                return 1;
            }
            let mut total = 0;
            for idx in 0..n {
                let num = nums[idx];
                if idx > 0 && nums[idx] == nums[idx - 1] && (nums_mask & (1 << (idx - 1))) == 0 {
                    continue;
                }
                if (nums_mask & (1 << idx)) == 0 && is_squareful(curr_nums, num) {
                    curr_nums.push(num);
                    total += backtrack(nums, n, nums_mask | (1 << idx), curr_nums);
                    curr_nums.pop();
                }
            }
            total
        }

        backtrack(&nums, n, 0, &mut vec![])
    }
}

impl Solution {
    fn helper(nums: &Vec<i32>, per_k: i32, k: i32) -> bool {
        let mut count = 1;
        let mut curr_sum = 0;
        for &num in nums {
            if curr_sum + num > per_k {
                count += 1;
                curr_sum = num;
            } else {
                curr_sum += num;
            }
        }
        count <= k
    }

    pub fn split_array(nums: Vec<i32>, k: i32) -> i32 {
        let high: i32 = nums.iter().sum();
        let low: i32 = *nums.iter().max().unwrap();
        let mut soln = 0;
        let mut l = low;
        let mut h = high;
        while l <= h {
            let mid = l + (h - l) / 2;
            if Self::helper(&nums, mid, k) {
                soln = mid;
                h = mid - 1;
            } else {
                l = mid + 1;
            }
        }
        soln
    }
}

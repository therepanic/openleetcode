impl Solution {
    pub fn next_greater_elements(nums: Vec<i32>) -> Vec<i32> {
        let n = nums.len();
        let mut res = vec![-1; n];
        for i in 0..n {
            for j in i+1..n {
                if nums[j] > nums[i] {
                    res[i] = nums[j];
                    break;
                }
            }
            if res[i] == -1 {
                for j in 0..i {
                    if nums[j] > nums[i] {
                        res[i] = nums[j];
                        break;
                    }
                }
            }
        }
        res
    }
}

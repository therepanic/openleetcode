impl Solution {
    pub fn minimum_mountain_removals(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut lis = vec![1; n];
        let mut lds = vec![1; n];

        for i in 0..n {
            for j in 0..i {
                if nums[i] > nums[j] {
                    lis[i] = lis[i].max(lis[j] + 1);
                }
            }
        }

        for i in (0..n).rev() {
            for j in ((i+1)..n).rev() {
                if nums[i] > nums[j] {
                    lds[i] = lds[i].max(lds[j] + 1);
                }
            }
        }

        let mut max_len = 0;
        for i in 1..(n-1) {
            if lis[i] > 1 && lds[i] > 1 {
                max_len = max_len.max(lis[i] + lds[i] - 1);
            }
        }

        (n - max_len) as i32
    }
}

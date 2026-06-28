impl Solution {
    pub fn find_length_of_lcis(nums: Vec<i32>) -> i32 {
        let mut ptr1 = 0;
        let mut ptr2 = 1;
        let n = nums.len();
        if n == 0 {
            return 0;
        }
        let mut max_len_subseq = 1;
        while ptr2 < n {
            while ptr2 < n && nums[ptr2] > nums[ptr2 - 1] {
                ptr2 += 1;
            }
            max_len_subseq = max_len_subseq.max(ptr2 - ptr1);
            ptr1 = ptr2;
            ptr2 += 1;
        }
        max_len_subseq as i32
    }
}

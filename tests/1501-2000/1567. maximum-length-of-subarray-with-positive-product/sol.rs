impl Solution {
    pub fn get_max_len(nums: Vec<i32>) -> i32 {
        let (mut pos_len, mut neg_len, mut max_len) = (0, 0, 0);
        for &num in nums.iter() {
            if num == 0 {
                pos_len = 0;
                neg_len = 0;
            } else if num > 0 {
                pos_len += 1;
                neg_len = if neg_len > 0 { neg_len + 1 } else { 0 };
            } else {
                let temp = pos_len;
                pos_len = if neg_len > 0 { neg_len + 1 } else { 0 };
                neg_len = temp + 1;
            }
            max_len = max_len.max(pos_len);
        }
        max_len
    }
}

impl Solution {
    pub fn k_length_apart(nums: Vec<i32>, k: i32) -> bool {
        if k == 0 {
            return true;
        }
        let mut prev: Option<usize> = None;
        for (i, &num) in nums.iter().enumerate() {
            if num == 1 {
                if let Some(p) = prev {
                    if (i - p) as i32 <= k {
                        return false;
                    }
                }
                prev = Some(i);
            }
        }
        true
    }
}

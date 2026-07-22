impl Solution {
    pub fn decompress_rl_elist(nums: Vec<i32>) -> Vec<i32> {
        let mut a = Vec::new();
        let mut i = 0;
        while i < nums.len() {
            let freq = nums[i] as usize;
            let val = nums[i + 1];
            a.extend(std::iter::repeat(val).take(freq));
            i += 2;
        }
        a
    }
}

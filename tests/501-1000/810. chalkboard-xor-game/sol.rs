impl Solution {
    pub fn xor_game(nums: Vec<i32>) -> bool {
        let mut total_xor = 0;
        for value in &nums {
            total_xor ^= value;
        }
        
        let is_xor_zero = total_xor == 0;
        let has_even_length = nums.len() % 2 == 0;
        
        is_xor_zero || has_even_length
    }
}

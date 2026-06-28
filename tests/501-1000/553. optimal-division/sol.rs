impl Solution {
    pub fn optimal_division(nums: Vec<i32>) -> String {
        let mut result = nums[0].to_string();
        
        if nums.len() == 1 {
            return result;
        }
        
        if nums.len() == 2 {
            return result + "/" + &nums[1].to_string();
        }
        
        result += "/(";
        result += &nums[1].to_string();
        for i in 2..nums.len() {
            result += "/";
            result += &nums[i].to_string();
        }
        
        result + ")"
    }
}

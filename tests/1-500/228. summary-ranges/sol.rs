impl Solution {
    pub fn summary_ranges(nums: Vec<i32>) -> Vec<String> {
        let mut result = Vec::new();
        let mut i = 0;
        
        while i < nums.len() {
            let start = nums[i];
            let mut j = i;
            while j + 1 < nums.len() && nums[j + 1] == nums[j] + 1 {
                j += 1;
            }
            
            if nums[j] == start {
                result.push(start.to_string());
            } else {
                result.push(format!("{}->{}", start, nums[j]));
            }
            
            i = j + 1;
        }
        
        result
    }
}

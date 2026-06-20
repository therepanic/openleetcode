impl Solution {
    pub fn largest_number(nums: Vec<i32>) -> String {
        let mut parts: Vec<String> = nums.into_iter().map(|num| num.to_string()).collect();
        parts.sort_by(|a, b| {
            let ab = format!("{}{}", a, b);
            let ba = format!("{}{}", b, a);
            ba.cmp(&ab)
        });
        if !parts.is_empty() && parts[0] == "0" {
            return "0".to_string();
        }
        parts.concat()
    }
}

impl Solution {
    pub fn is_possible_divide(nums: Vec<i32>, k: i32) -> bool {
        if nums.len() % k as usize != 0 {
            return false;
        }
        let mut count = std::collections::HashMap::new();
        for &num in &nums {
            *count.entry(num).or_insert(0) += 1;
        }
        let mut nums = nums;
        nums.sort();
        for &num in &nums {
            if count.get(&num) == Some(&0) {
                continue;
            }
            for i in 0..k {
                let cur = num + i;
                if count.get(&cur).unwrap_or(&0) == &0 {
                    return false;
                }
                *count.get_mut(&cur).unwrap() -= 1;
            }
        }
        true
    }
}

impl Solution {
    pub fn kth_largest_number(nums: Vec<String>, k: i32) -> String {
        let mut arr = nums;
        arr.sort_by(|a, b| b.len().cmp(&a.len()).then_with(|| b.cmp(a)));
        arr[(k - 1) as usize].clone()
    }
}

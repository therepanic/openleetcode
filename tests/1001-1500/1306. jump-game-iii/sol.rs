impl Solution {
    pub fn can_reach(arr: Vec<i32>, start: i32) -> bool {
        use std::collections::{HashSet, VecDeque};
        let mut seen = HashSet::new();
        let mut queue = VecDeque::new();
        queue.push_back(start as usize);
        while let Some(index) = queue.pop_front() {
            if index >= arr.len() || seen.contains(&index) {
                continue;
            }
            if arr[index] == 0 {
                return true;
            }
            seen.insert(index);
            let val = arr[index] as usize;
            if index >= val {
                queue.push_back(index - val);
            }
            if index + val < arr.len() {
                queue.push_back(index + val);
            }
        }
        false
    }
}

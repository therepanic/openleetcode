impl Solution {
    pub fn contains_pattern(arr: Vec<i32>, m: i32, k: i32) -> bool {
        let m = m as usize;
        let k = k as usize;
        if m * k > arr.len() {
            return false;
        }
        for i in 0..=arr.len() - m * k {
            let mut match_found = true;
            for j in 0..m * (k - 1) {
                if arr[i + j] != arr[i + j + m] {
                    match_found = false;
                    break;
                }
            }
            if match_found {
                return true;
            }
        }
        false
    }
}

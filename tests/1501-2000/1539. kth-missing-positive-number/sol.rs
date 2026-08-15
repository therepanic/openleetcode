impl Solution {
    pub fn find_kth_positive(arr: Vec<i32>, k: i32) -> i32 {
        let mut low = 0;
        let mut high = arr.len() as i32 - 1;
        while low <= high {
            let mid = (low + high) / 2;
            let missing = arr[mid as usize] - (mid + 1);
            if missing < k {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return high + 1 + k;
    }
}

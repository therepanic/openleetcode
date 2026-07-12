impl Solution {
    pub fn peak_index_in_mountain_array(arr: Vec<i32>) -> i32 {
        let mut l = 0;
        let mut r = arr.len() - 1;
        while l < r {
            let mid = (l + r) / 2;
            if arr[mid] < arr[mid + 1] {
                l = mid + 1;
            } else {
                r = mid;
            }
        }
        l as i32
    }
}

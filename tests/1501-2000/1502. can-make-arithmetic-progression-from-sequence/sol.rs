impl Solution {
    pub fn can_make_arithmetic_progression(arr: Vec<i32>) -> bool {
        let mut arr = arr;
        arr.sort();
        let diff = arr[1] - arr[0];
        for i in 0..arr.len() - 1 {
            if arr[i+1] - arr[i] != diff {
                return false;
            }
        }
        true
    }
}

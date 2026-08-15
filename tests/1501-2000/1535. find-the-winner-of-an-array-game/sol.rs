impl Solution {
    pub fn get_winner(arr: Vec<i32>, k: i32) -> i32 {
        let mut candidate = arr[0];
        let mut streak = 0;
        for i in 1..arr.len() {
            if candidate > arr[i] {
                streak += 1;
            } else {
                candidate = arr[i];
                streak = 1;
            }
            if streak == k { return candidate; }
        }
        candidate
    }
}

impl Solution {
    pub fn max_chunks_to_sorted(arr: Vec<i32>) -> i32 {
        let n = arr.len();
        let mut min_right = vec![0; n];
        let mut current_min = i32::MAX;
        for i in (0..n).rev() {
            if arr[i] < current_min {
                current_min = arr[i];
            }
            min_right[i] = current_min;
        }
        
        let mut chunks = 0;
        let mut current_max = i32::MIN;
        for i in 0..n - 1 {
            if arr[i] > current_max {
                current_max = arr[i];
            }
            if current_max <= min_right[i + 1] {
                chunks += 1;
            }
        }
        chunks + 1
    }
}

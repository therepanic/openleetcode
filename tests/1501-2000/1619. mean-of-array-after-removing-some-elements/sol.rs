impl Solution {
    pub fn trim_mean(arr: Vec<i32>) -> f64 {
        let n = arr.len();
        let per5 = (0.05 * n as f64) as usize;
        let mut arr = arr;
        arr.sort();
        let sum: i32 = arr[per5..n-per5].iter().sum();
        sum as f64 / (n - per5 - per5) as f64
    }
}

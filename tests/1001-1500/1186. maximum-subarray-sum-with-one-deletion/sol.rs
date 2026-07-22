impl Solution {
    pub fn maximum_sum(arr: Vec<i32>) -> i32 {
        let n = arr.len();
        if n == 1 {
            return arr[0];
        }
        
        let mut max_no_delete = arr[0];
        let mut max_one_delete = arr[0];
        let mut result = arr[0];
        
        for i in 1..n {
            let prev_no_delete = max_no_delete;
            max_no_delete = std::cmp::max(max_no_delete + arr[i], arr[i]);
            max_one_delete = std::cmp::max(max_one_delete + arr[i], prev_no_delete);
            result = std::cmp::max(result, std::cmp::max(max_no_delete, max_one_delete));
        }
        
        result
    }
}

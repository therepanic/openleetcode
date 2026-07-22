impl Solution {
    pub fn find_best_value(arr: Vec<i32>, target: i32) -> i32 {
        let get_mutated_sum = |value: i32| -> i32 {
            arr.iter().map(|&x| x.min(value)).sum()
        };
        
        let mut low = 0;
        let mut high = *arr.iter().max().unwrap();
        let mut result = high;
        let mut min_diff = i32::MAX;
        
        while low <= high {
            let mid = low + (high - low) / 2;
            let curr_sum = get_mutated_sum(mid);
            let diff = (curr_sum - target).abs();
            
            if diff < min_diff || (diff == min_diff && mid < result) {
                min_diff = diff;
                result = mid;
            }
            
            if curr_sum < target {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        
        result
    }
}

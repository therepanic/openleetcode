impl Solution {
    pub fn pancake_sort(arr: Vec<i32>) -> Vec<i32> {
        let mut arr = arr;
        let n = arr.len();
        let mut result = Vec::new();
        
        for i in 0..n {
            let target = (n - i) as i32;
            let mut position = 0;
            
            for j in 0..n - i {
                if arr[j] == target {
                    position = j;
                    break;
                }
            }
            
            if position == n - i - 1 {
                continue;
            }
            
            if position > 0 {
                result.push((position + 1) as i32);
                arr[0..=position].reverse();
            }
            
            result.push((n - i) as i32);
            arr[0..n - i].reverse();
        }
        
        result
    }
}

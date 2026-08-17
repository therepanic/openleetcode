impl Solution {
    pub fn min_operations(target: Vec<i32>, arr: Vec<i32>) -> i32 {
        let target_index_map: std::collections::HashMap<i32, usize> = target.iter().enumerate().map(|(i, &num)| (num, i)).collect();
        
        let transformed_arr: Vec<usize> = arr.iter().filter_map(|num| target_index_map.get(num).copied()).collect();
        
        let mut lis: Vec<usize> = Vec::new();
        for index in transformed_arr {
            let pos = lis.binary_search(&index).unwrap_or_else(|p| p);
            if pos == lis.len() {
                lis.push(index);
            } else {
                lis[pos] = index;
            }
        }
        
        (target.len() - lis.len()) as i32
    }
}

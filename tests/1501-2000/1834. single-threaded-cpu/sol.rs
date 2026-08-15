impl Solution {
    pub fn get_order(tasks: Vec<Vec<i32>>) -> Vec<i32> {
        let n = tasks.len();
        let mut indexed: Vec<(i32, i32, i32)> = tasks.iter().enumerate()
            .map(|(i, task)| (task[0], task[1], i as i32))
            .collect();
        indexed.sort_by_key(|&(a, _, _)| a);
        
        let mut result = Vec::with_capacity(n);
        let mut heap: std::collections::BinaryHeap<std::cmp::Reverse<(i32, i32)>> = 
            std::collections::BinaryHeap::new();
        let mut time: i64 = 0;
        let mut idx = 0;
        
        while idx < n || !heap.is_empty() {
            if heap.is_empty() && (time as i32) < indexed[idx].0 {
                time = indexed[idx].0 as i64;
            }
            
            while idx < n && (indexed[idx].0 as i64) <= time {
                heap.push(std::cmp::Reverse((indexed[idx].1, indexed[idx].2)));
                idx += 1;
            }
            
            if let Some(std::cmp::Reverse((process, index))) = heap.pop() {
                result.push(index);
                time += process as i64;
            }
        }
        
        result
    }
}

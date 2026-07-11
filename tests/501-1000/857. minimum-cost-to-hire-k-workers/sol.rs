impl Solution {
    pub fn mincost_to_hire_workers(quality: Vec<i32>, wage: Vec<i32>, k: i32) -> f64 {
        use std::collections::BinaryHeap;
        
        let n = quality.len();
        let mut workers: Vec<(f64, i32)> = (0..n)
            .map(|i| (wage[i] as f64 / quality[i] as f64, quality[i]))
            .collect();
        workers.sort_by(|a, b| a.0.partial_cmp(&b.0).unwrap());
        
        let mut min_cost = f64::MAX;
        let mut current_quality_sum: i64 = 0;
        let mut max_heap = BinaryHeap::new();
        
        let k = k as usize;
        
        for (ratio, q) in workers {
            current_quality_sum += q as i64;
            max_heap.push(q);
            
            if max_heap.len() > k {
                current_quality_sum -= max_heap.pop().unwrap() as i64;
            }
            
            if max_heap.len() == k {
                let cost = ratio * current_quality_sum as f64;
                if cost < min_cost {
                    min_cost = cost;
                }
            }
        }
        
        min_cost
    }
}

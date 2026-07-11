impl Solution {
    pub fn last_stone_weight(stones: Vec<i32>) -> i32 {
        let mut heap = std::collections::BinaryHeap::from(stones);
        
        while heap.len() > 1 {
            let max_stone1 = heap.pop().unwrap();
            let max_stone2 = heap.pop().unwrap();
            
            if max_stone1 != max_stone2 {
                heap.push(max_stone1 - max_stone2);
            }
        }
        
        heap.pop().unwrap_or(0)
    }
}

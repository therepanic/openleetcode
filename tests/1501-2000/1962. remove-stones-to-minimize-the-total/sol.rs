use std::collections::BinaryHeap;

impl Solution {
    pub fn min_stone_sum(piles: Vec<i32>, k: i32) -> i32 {
        let mut heap = BinaryHeap::new();
        for p in piles {
            heap.push(p);
        }
        for _ in 0..k {
            let x = heap.pop().unwrap();
            let reduced = (x + 1) / 2;
            heap.push(reduced);
        }
        heap.iter().sum()
    }
}

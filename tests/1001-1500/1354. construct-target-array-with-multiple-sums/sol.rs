use std::collections::BinaryHeap;

impl Solution {
    pub fn is_possible(target: Vec<i32>) -> bool {
        let mut heap: BinaryHeap<i64> = BinaryHeap::new();
        let mut total: i64 = 0;
        for &v in &target {
            heap.push(v as i64);
            total += v as i64;
        }
        loop {
            let largest = heap.pop().unwrap();
            let rest = total - largest;
            if largest == 1 || rest == 1 {
                return true;
            }
            if rest == 0 || rest >= largest {
                return false;
            }
            let previous = largest % rest;
            if previous == 0 {
                return false;
            }
            total = rest + previous;
            heap.push(previous);
        }
    }
}

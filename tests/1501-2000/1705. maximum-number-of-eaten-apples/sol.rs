use std::collections::BinaryHeap;
use std::cmp::Reverse;

impl Solution {
    pub fn eaten_apples(apples: Vec<i32>, days: Vec<i32>) -> i32 {
        let mut heap: BinaryHeap<(Reverse<i32>, i32)> = BinaryHeap::new();
        let n = apples.len();
        let mut res = 0;
        let mut day = 0;
        while !heap.is_empty() || day < n {
            if day < n && apples[day] > 0 {
                heap.push((Reverse(day as i32 + days[day]), apples[day]));
            }
            while !heap.is_empty() && heap.peek().unwrap().0.0 <= day as i32 {
                heap.pop();
            }
            if let Some((Reverse(expire), count)) = heap.pop() {
                res += 1;
                if count - 1 > 0 {
                    heap.push((Reverse(expire), count - 1));
                }
            }
            day += 1;
        }
        res
    }
}

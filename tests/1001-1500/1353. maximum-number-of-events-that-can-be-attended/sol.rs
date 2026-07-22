use std::collections::BinaryHeap;
use std::cmp::Reverse;

impl Solution {
    pub fn max_events(events: Vec<Vec<i32>>) -> i32 {
        let mut events = events;
        events.sort_by_key(|e| e[0]);
        let mut min_heap = BinaryHeap::new();
        let mut day = 0;
        let mut i = 0;
        let n = events.len();
        let mut result = 0;
        
        while !min_heap.is_empty() || i < n {
            if min_heap.is_empty() {
                day = events[i][0];
            }
            while i < n && events[i][0] <= day {
                min_heap.push(Reverse(events[i][1]));
                i += 1;
            }
            min_heap.pop();
            result += 1;
            day += 1;
            while let Some(&Reverse(top)) = min_heap.peek() {
                if top < day {
                    min_heap.pop();
                } else {
                    break;
                }
            }
        }
        result
    }
}

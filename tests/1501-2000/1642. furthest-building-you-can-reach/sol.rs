use std::collections::BinaryHeap;
use std::cmp::Reverse;

impl Solution {
    pub fn furthest_building(heights: Vec<i32>, bricks: i32, ladders: i32) -> i32 {
        let mut heap = BinaryHeap::new();
        let n = heights.len();
        let mut bricks = bricks;
        let mut ladders = ladders;
        for i in 1..n {
            let climb = heights[i] - heights[i-1];
            if climb <= 0 { continue; }
            heap.push(Reverse(climb));
            if heap.len() > ladders as usize {
                if let Some(Reverse(diff)) = heap.pop() {
                    if bricks >= diff {
                        bricks -= diff;
                    } else {
                        return i as i32 - 1;
                    }
                }
            }
        }
        n as i32 - 1
    }
}

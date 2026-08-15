use std::collections::BinaryHeap;
use std::cmp::Ordering;

#[derive(Debug, Copy, Clone)]
struct Item {
    gain: f64,
    p: i32,
    t: i32,
}

impl PartialEq for Item {
    fn eq(&self, other: &Self) -> bool {
        self.gain == other.gain
    }
}

impl Eq for Item {}

impl PartialOrd for Item {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        self.gain.partial_cmp(&other.gain)
    }
}

impl Ord for Item {
    fn cmp(&self, other: &Self) -> Ordering {
        self.gain.partial_cmp(&other.gain).unwrap_or(Ordering::Equal)
    }
}

impl Solution {
    pub fn max_average_ratio(classes: Vec<Vec<i32>>, extra_students: i32) -> f64 {
        let mut heap = BinaryHeap::new();
        for c in &classes {
            let p = c[0];
            let t = c[1];
            let gain = (p as f64 + 1.0) / (t as f64 + 1.0) - p as f64 / t as f64;
            heap.push(Item { gain, p, t });
        }
        for _ in 0..extra_students {
            let top = heap.pop().unwrap();
            let p = top.p + 1;
            let t = top.t + 1;
            let gain = (p as f64 + 1.0) / (t as f64 + 1.0) - p as f64 / t as f64;
            heap.push(Item { gain, p, t });
        }
        let mut sum = 0.0;
        for item in &heap {
            sum += item.p as f64 / item.t as f64;
        }
        sum / classes.len() as f64
    }
}

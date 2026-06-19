use std::collections::{BinaryHeap, HashMap};
use std::cmp::Reverse;

struct DualHeap {
    small: BinaryHeap<i32>,
    large: BinaryHeap<Reverse<i32>>,
    delayed: HashMap<i32, i32>,
    k: usize,
    small_size: usize,
    large_size: usize,
}

impl DualHeap {
    fn new(k: i32) -> Self {
        DualHeap {
            small: BinaryHeap::new(),
            large: BinaryHeap::new(),
            delayed: HashMap::new(),
            k: k as usize,
            small_size: 0,
            large_size: 0,
        }
    }

    fn prune_small(&mut self) {
        while let Some(&num) = self.small.peek() {
            let val = num;
            if self.delayed.get(&val).copied().unwrap_or(0) == 0 { break; }
            *self.delayed.get_mut(&val).unwrap() -= 1;
            if self.delayed[&val] == 0 { self.delayed.remove(&val); }
            self.small.pop();
        }
    }

    fn prune_large(&mut self) {
        while let Some(&Reverse(num)) = self.large.peek() {
            if self.delayed.get(&num).copied().unwrap_or(0) == 0 { break; }
            *self.delayed.get_mut(&num).unwrap() -= 1;
            if self.delayed[&num] == 0 { self.delayed.remove(&num); }
            self.large.pop();
        }
    }

    fn make_balance(&mut self) {
        if self.small_size > self.large_size + 1 {
            let val = self.small.pop().unwrap();
            self.large.push(Reverse(val));
            self.small_size -= 1;
            self.large_size += 1;
            self.prune_small();
        } else if self.small_size < self.large_size {
            let Reverse(val) = self.large.pop().unwrap();
            self.small.push(val);
            self.small_size += 1;
            self.large_size -= 1;
            self.prune_large();
        }
    }

    fn insert(&mut self, num: i32) {
        if self.small.is_empty() || num <= *self.small.peek().unwrap() {
            self.small.push(num);
            self.small_size += 1;
        } else {
            self.large.push(Reverse(num));
            self.large_size += 1;
        }
        self.make_balance();
    }

    fn erase(&mut self, num: i32) {
        *self.delayed.entry(num).or_insert(0) += 1;
        if num <= *self.small.peek().unwrap() {
            self.small_size -= 1;
            if num == *self.small.peek().unwrap() { self.prune_small(); }
        } else {
            self.large_size -= 1;
            if let Some(&Reverse(top)) = self.large.peek() {
                if num == top { self.prune_large(); }
            }
        }
        self.make_balance();
    }

    fn median(&self) -> f64 {
        if self.k % 2 == 1 {
            return *self.small.peek().unwrap() as f64;
        }
        (*self.small.peek().unwrap() as f64 + self.large.peek().unwrap().0 as f64) / 2.0
    }
}

impl Solution {
    pub fn median_sliding_window(nums: Vec<i32>, k: i32) -> Vec<f64> {
        let mut dh = DualHeap::new(k);
        for i in 0..k as usize {
            dh.insert(nums[i]);
        }
        let mut ans = vec![dh.median()];
        for i in k as usize..nums.len() {
            dh.insert(nums[i]);
            dh.erase(nums[i - k as usize]);
            ans.push(dh.median());
        }
        ans
    }
}

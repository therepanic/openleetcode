impl Solution {
    pub fn is_n_straight_hand(hand: Vec<i32>, group_size: i32) -> bool {
        use std::collections::{BinaryHeap, HashMap};
        use std::cmp::Reverse;
        
        let mut hashmap: HashMap<i32, i32> = HashMap::new();
        for &h in &hand {
            *hashmap.entry(h).or_insert(0) += 1;
        }
        
        let mut min_heap: BinaryHeap<Reverse<i32>> = BinaryHeap::new();
        for &k in hashmap.keys() {
            min_heap.push(Reverse(k));
        }
        
        while let Some(&Reverse(first)) = min_heap.peek() {
            for i in first..first + group_size {
                if let Some(count) = hashmap.get_mut(&i) {
                    *count -= 1;
                    if *count == 0 {
                        if let Some(&Reverse(peek)) = min_heap.peek() {
                            if i != peek {
                                return false;
                            }
                            min_heap.pop();
                        }
                    }
                } else {
                    return false;
                }
            }
        }
        true
    }
}

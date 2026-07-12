impl Solution {
    pub fn car_pooling(trips: Vec<Vec<i32>>, capacity: i32) -> bool {
        use std::collections::BinaryHeap;
        use std::cmp::Reverse;
        
        let mut trips = trips;
        trips.sort_by_key(|trip| trip[1]);
        let mut heap: BinaryHeap<Reverse<(i32, i32)>> = BinaryHeap::new();
        let mut current_passengers = 0;
        for trip in trips {
            let num = trip[0];
            let src = trip[1];
            let dest = trip[2];
            while let Some(Reverse((top_dest, top_num))) = heap.peek() {
                if *top_dest <= src {
                    current_passengers -= top_num;
                    heap.pop();
                } else {
                    break;
                }
            }
            if current_passengers + num > capacity {
                return false;
            }
            current_passengers += num;
            heap.push(Reverse((dest, num)));
        }
        true
    }
}

impl Solution {
    pub fn min_refuel_stops(target: i32, start_fuel: i32, stations: Vec<Vec<i32>>) -> i32 {
        use std::collections::BinaryHeap;
        let mut fuel = start_fuel;
        let mut count = 0;
        let mut heap = BinaryHeap::new();
        let mut stations = stations;
        stations.push(vec![target, 0]);
        let mut i = 0;
        while i < stations.len() {
            if fuel >= target {
                return count;
            }
            while i < stations.len() && stations[i][0] <= fuel {
                heap.push(stations[i][1]);
                i += 1;
            }
            if heap.is_empty() {
                return -1;
            }
            fuel += heap.pop().unwrap();
            count += 1;
        }
        -1
    }
}

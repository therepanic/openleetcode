impl Solution {
    pub fn num_buses_to_destination(routes: Vec<Vec<i32>>, source: i32, target: i32) -> i32 {
        if source == target {
            return 0;
        }
        use std::collections::{HashMap, HashSet, VecDeque};
        let mut adj: HashMap<i32, HashSet<usize>> = HashMap::new();
        for (bus, locations) in routes.iter().enumerate() {
            for &location in locations {
                adj.entry(location).or_insert_with(HashSet::new).insert(bus);
            }
        }
        let mut queue: VecDeque<usize> = VecDeque::new();
        if let Some(buses) = adj.get(&target) {
            for &bus in buses {
                queue.push_back(bus);
            }
        }
        let mut cost = 0;
        let mut visited: HashSet<usize> = HashSet::new();
        while !queue.is_empty() {
            cost += 1;
            let size = queue.len();
            for _ in 0..size {
                let node = queue.pop_front().unwrap();
                visited.insert(node);
                if routes[node].contains(&source) {
                    return cost;
                }
                for &location in &routes[node] {
                    if let Some(buses) = adj.get(&location) {
                        for &bus in buses {
                            if !visited.contains(&bus) {
                                queue.push_back(bus);
                            }
                        }
                    }
                }
            }
        }
        -1
    }
}

use std::collections::BinaryHeap;
use std::cmp::Ordering;

#[derive(Eq, PartialEq)]
struct Item {
    cost: i32,
    node: usize,
}

impl Ord for Item {
    fn cmp(&self, other: &Self) -> Ordering {
        other.cost.cmp(&self.cost)
    }
}

impl PartialOrd for Item {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

impl Solution {
    pub fn min_cost_connect_points(points: Vec<Vec<i32>>) -> i32 {
        let n = points.len();
        let mut min_cost = 0;
        let mut visited = vec![false; n];
        let mut pq = BinaryHeap::new();
        pq.push(Item { cost: 0, node: 0 });
        let mut cache: Vec<i32> = vec![i32::MAX; n];
        cache[0] = 0;
        
        while let Some(item) = pq.pop() {
            if visited[item.node] { continue; }
            visited[item.node] = true;
            min_cost += item.cost;
            for v in 0..n {
                if !visited[v] {
                    let dist = (points[item.node][0] - points[v][0]).abs() + (points[item.node][1] - points[v][1]).abs();
                    if dist < cache[v] {
                        cache[v] = dist;
                        pq.push(Item { cost: dist, node: v });
                    }
                }
            }
        }
        min_cost
    }
}

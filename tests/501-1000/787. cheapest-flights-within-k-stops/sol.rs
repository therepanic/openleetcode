use std::collections::VecDeque;

impl Solution {
    pub fn find_cheapest_price(n: i32, flights: Vec<Vec<i32>>, src: i32, dst: i32, k: i32) -> i32 {
        let n = n as usize;
        let mut matrix: Vec<Vec<(usize, i32)>> = vec![vec![]; n];
        for flight in flights {
            let u = flight[0] as usize;
            let v = flight[1] as usize;
            let w = flight[2];
            matrix[u].push((v, w));
        }

        let mut distance = vec![i32::MAX; n];
        distance[src as usize] = 0;

        let mut queue = VecDeque::new();
        queue.push_back((src as usize, 0));
        let mut steps = 0;

        while !queue.is_empty() {
            let level = queue.len();
            if steps == k + 1 {
                break;
            }
            steps += 1;

            for _ in 0..level {
                if let Some((node, dist)) = queue.pop_front() {
                    for &(v, w) in &matrix[node] {
                        if w.saturating_add(dist) < distance[v] {
                            distance[v] = w + dist;
                            queue.push_back((v, dist + w));
                        }
                    }
                }
            }
        }

        if distance[dst as usize] == i32::MAX {
            -1
        } else {
            distance[dst as usize]
        }
    }
}

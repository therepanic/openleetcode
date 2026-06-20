impl Solution {
    pub fn get_skyline(buildings: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let mut events: Vec<(i32, i32)> = Vec::new();
        for b in &buildings {
            let (L, R, H) = (b[0], b[1], b[2]);
            events.push((L, -H));
            events.push((R, H));
        }
        events.sort_by(|a, b| {
            if a.0 != b.0 { a.0.cmp(&b.0) }
            else { a.1.cmp(&b.1) }
        });

        let mut result: Vec<Vec<i32>> = Vec::new();
        let mut live_buildings: std::collections::BinaryHeap<i32> = std::collections::BinaryHeap::new();
        live_buildings.push(0);
        let mut past_buildings: std::collections::HashMap<i32, i32> = std::collections::HashMap::new();
        let mut prev_max = 0;

        for (x, h) in events {
            if h < 0 {
                live_buildings.push(-h);
            } else {
                *past_buildings.entry(h).or_insert(0) += 1;
            }

            while let Some(&top) = live_buildings.peek() {
                if past_buildings.contains_key(&top) {
                    live_buildings.pop();
                    let entry = past_buildings.get_mut(&top).unwrap();
                    *entry -= 1;
                    if *entry == 0 {
                        past_buildings.remove(&top);
                    }
                } else {
                    break;
                }
            }

            let curr_max = *live_buildings.peek().unwrap_or(&0);
            if curr_max != prev_max {
                result.push(vec![x, curr_max]);
                prev_max = curr_max;
            }
        }

        result
    }
}

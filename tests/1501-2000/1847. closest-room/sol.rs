impl Solution {
    pub fn closest_room(rooms: Vec<Vec<i32>>, queries: Vec<Vec<i32>>) -> Vec<i32> {
        let mut rooms = rooms;
        rooms.sort_by(|a, b| b[1].cmp(&a[1]));

        let mut idx: Vec<usize> = (0..queries.len()).collect();
        idx.sort_by(|&a, &b| queries[b][1].cmp(&queries[a][1]));

        let mut active = std::collections::BTreeSet::new();
        let mut result = vec![-1; queries.len()];
        let mut room_ptr = 0;

        for qi in idx {
            let preferred = queries[qi][0];
            let minimum = queries[qi][1];

            while room_ptr < rooms.len() && rooms[room_ptr][1] >= minimum {
                active.insert(rooms[room_ptr][0]);
                room_ptr += 1;
            }

            let mut candidates = Vec::new();
            if let Some(&pos) = active.range(preferred..).next() {
                candidates.push(pos);
            }
            if let Some(&prev) = active.range(..=preferred).next_back() {
                candidates.push(prev);
            }

            if !candidates.is_empty() {
                let mut best = candidates[0];
                for &id in candidates.iter().skip(1) {
                    let diff = (id - preferred).abs();
                    let best_diff = (best - preferred).abs();
                    if diff < best_diff || (diff == best_diff && id < best) {
                        best = id;
                    }
                }
                result[qi] = best;
            }
        }
        result
    }
}

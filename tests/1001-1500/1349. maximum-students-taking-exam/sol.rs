impl Solution {
    pub fn max_students(seats: Vec<Vec<char>>) -> i32 {
        let m = seats.len();
        let n = seats[0].len();
        let mut available = Vec::with_capacity(m);
        for row in &seats {
            let mut mask: i32 = 0;
            for (col, &seat) in row.iter().enumerate() {
                if seat == '.' {
                    mask |= 1 << col;
                }
            }
            available.push(mask);
        }

        let mut valid_masks = Vec::new();
        for mask in 0i32..(1i32 << n) {
            if mask & (mask << 1) == 0 {
                valid_masks.push(mask);
            }
        }

        let mut dp: HashMap<i32, i32> = HashMap::new();
        dp.insert(0, 0);
        for row in 0..m {
            let mut next_dp: HashMap<i32, i32> = HashMap::new();
            for &current in &valid_masks {
                if current & !available[row] != 0 {
                    continue;
                }
                let count = current.count_ones() as i32;
                for (&previous, &total) in &dp {
                    if current & ((previous << 1) | (previous >> 1)) != 0 {
                        continue;
                    }
                    let entry = next_dp.entry(current).or_insert(0);
                    *entry = (*entry).max(total + count);
                }
            }
            dp = next_dp;
        }

        dp.values().max().cloned().unwrap_or(0)
    }
}

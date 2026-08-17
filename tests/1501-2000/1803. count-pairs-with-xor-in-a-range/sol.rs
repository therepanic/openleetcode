impl Solution {
    pub fn count_pairs(nums: Vec<i32>, low: i32, high: i32) -> i32 {
        let max_val = nums.iter().copied().max().unwrap_or(0);
        let mut bits = 1usize;
        while (1i32 << bits) <= std::cmp::max(max_val, high + 1) { bits += 1; }

        fn count_less(nums: &[i32], bits: usize, bound: i32) -> i32 {
            if bound <= 0 { return 0; }
            let mut child: Vec<[i32; 2]> = vec![[-1, -1]];
            let mut counts: Vec<i32> = vec![0];
            let mut total = 0;
            for &value in nums {
                let mut node: i32 = 0;
                for bit in (0..bits).rev() {
                    let v = (value >> bit) & 1;
                    let b = (bound >> bit) & 1;
                    if b == 1 {
                        let same = child[node as usize][v as usize];
                        if same != -1 { total += counts[same as usize]; }
                        let nxt = child[node as usize][(1 - v) as usize];
                        if nxt == -1 { node = -1; break; }
                        node = nxt;
                    } else {
                        let nxt = child[node as usize][v as usize];
                        if nxt == -1 { node = -1; break; }
                        node = nxt;
                    }
                }
                node = 0;
                for bit in (0..bits).rev() {
                    let v = (value >> bit) & 1;
                    let nxt = child[node as usize][v as usize];
                    if nxt == -1 {
                        let new_idx = child.len() as i32;
                        child[node as usize][v as usize] = new_idx;
                        child.push([-1, -1]);
                        counts.push(0);
                    }
                    node = child[node as usize][v as usize];
                    counts[node as usize] += 1;
                }
            }
            total
        }

        count_less(&nums, bits, high + 1) - count_less(&nums, bits, low)
    }
}

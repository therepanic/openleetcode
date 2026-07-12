impl Solution {
    pub fn three_sum_multi(arr: Vec<i32>, target: i32) -> i32 {
        use std::collections::HashMap;
        let mut cnt = HashMap::new();
        for x in arr {
            *cnt.entry(x).or_insert(0i64) += 1;
        }
        let mut vals: Vec<i32> = cnt.keys().copied().collect();
        vals.sort();
        let mut res: i64 = 0;
        let modu: i64 = 1_000_000_007;

        for i in 0..vals.len() {
            for j in i..vals.len() {
                let a = vals[i];
                let b = vals[j];
                let c = target - a - b;
                if c < b {
                    continue;
                }
                let Some(&cc) = cnt.get(&c) else {
                    continue;
                };
                let ca = cnt[&a];
                let cb = cnt[&b];
                if a == b && b == c {
                    if ca >= 3 {
                        res += ca * (ca - 1) * (ca - 2) / 6;
                    }
                } else if a == b && b != c {
                    if ca >= 2 {
                        res += ca * (ca - 1) / 2 * cc;
                    }
                } else if a < b && b == c {
                    if cb >= 2 {
                        res += ca * cb * (cb - 1) / 2;
                    }
                } else if a < b && b < c {
                    res += ca * cb * cc;
                }
            }
        }

        (res % modu) as i32
    }
}

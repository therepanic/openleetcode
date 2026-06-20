use std::collections::HashMap;

impl Solution {
    pub fn find_max_form(strs: Vec<String>, m: i32, n: i32) -> i32 {
        let mut dp: HashMap<(i32, i32), i32> = HashMap::new();
        dp.insert((0, 0), 0);
        for s in &strs {
            let zeros = s.chars().filter(|&c| c == '0').count() as i32;
            let ones = s.chars().filter(|&c| c == '1').count() as i32;
            let mut new_dp = dp.clone();
            for (&(z, o), &size) in &dp {
                let new_z = z + zeros;
                let new_o = o + ones;
                if new_z <= m && new_o <= n {
                    let entry = new_dp.entry((new_z, new_o)).or_insert(0);
                    *entry = (*entry).max(size + 1);
                }
            }
            dp = new_dp;
        }
        dp.values().cloned().max().unwrap_or(0)
    }
}

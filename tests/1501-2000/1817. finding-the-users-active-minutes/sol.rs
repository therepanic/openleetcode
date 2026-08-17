impl Solution {
    pub fn finding_users_active_minutes(logs: Vec<Vec<i32>>, k: i32) -> Vec<i32> {
        use std::collections::HashMap;
        use std::collections::HashSet;
        let mut mp: HashMap<i32, HashSet<i32>> = HashMap::new();
        for log in &logs {
            mp.entry(log[0]).or_insert_with(HashSet::new).insert(log[1]);
        }
        let mut ans = vec![0; k as usize];
        for set in mp.values() {
            let size = set.len();
            if (size as i32) <= k {
                ans[size - 1] += 1;
            }
        }
        ans
    }
}

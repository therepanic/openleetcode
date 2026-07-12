impl Solution {
    pub fn flipgame(fronts: Vec<i32>, backs: Vec<i32>) -> i32 {
        let mut bad = std::collections::HashSet::new();
        for i in 0..fronts.len() {
            if fronts[i] == backs[i] {
                bad.insert(fronts[i]);
            }
        }
        let mut best = 2001;
        for i in 0..fronts.len() {
            if !bad.contains(&fronts[i]) && fronts[i] < best {
                best = fronts[i];
            }
            if !bad.contains(&backs[i]) && backs[i] < best {
                best = backs[i];
            }
        }
        if best <= 2000 { best } else { 0 }
    }
}

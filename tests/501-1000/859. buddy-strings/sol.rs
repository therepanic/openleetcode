impl Solution {
    pub fn buddy_strings(s: String, goal: String) -> bool {
        if s.len() != goal.len() {
            return false;
        }
        if s == goal {
            let mut seen = std::collections::HashSet::new();
            for c in s.chars() {
                if !seen.insert(c) {
                    return true;
                }
            }
            return false;
        }
        let s_bytes = s.as_bytes();
        let g_bytes = goal.as_bytes();
        let mut diffs = Vec::new();
        for i in 0..s.len() {
            if s_bytes[i] != g_bytes[i] {
                diffs.push(i);
            }
        }
        diffs.len() == 2 && s_bytes[diffs[0]] == g_bytes[diffs[1]] && s_bytes[diffs[1]] == g_bytes[diffs[0]]
    }
}

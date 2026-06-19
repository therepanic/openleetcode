impl Solution {
    pub fn find_content_children(g: Vec<i32>, s: Vec<i32>) -> i32 {
        let mut g = g;
        let mut s = s;
        g.sort();
        s.sort();
        let mut i = 0;
        let mut j = 0;
        let mut count = 0;
        while i < g.len() && j < s.len() {
            if s[j] >= g[i] {
                count += 1;
                i += 1;
            }
            j += 1;
        }
        count
    }
}

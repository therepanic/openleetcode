impl Solution {
    pub fn largest_merge(word1: String, word2: String) -> String {
        let w1: Vec<char> = word1.chars().collect();
        let w2: Vec<char> = word2.chars().collect();
        let mut res = String::new();
        let mut i = 0;
        let mut j = 0;
        while i < w1.len() && j < w2.len() {
            if w1[i] > w2[j] {
                res.push(w1[i]);
                i += 1;
            } else if w1[i] < w2[j] {
                res.push(w2[j]);
                j += 1;
            } else {
                let mut p = i;
                let mut q = j;
                while p < w1.len() && q < w2.len() && w1[p] == w2[q] {
                    p += 1;
                    q += 1;
                }
                if q == w2.len() || (p < w1.len() && w1[p] > w2[q]) {
                    res.push(w1[i]);
                    i += 1;
                } else {
                    res.push(w2[j]);
                    j += 1;
                }
            }
        }
        while i < w1.len() {
            res.push(w1[i]);
            i += 1;
        }
        while j < w2.len() {
            res.push(w2[j]);
            j += 1;
        }
        res
    }
}

impl Solution {
    pub fn num_smaller_by_frequency(queries: Vec<String>, words: Vec<String>) -> Vec<i32> {
        fn f(s: &str) -> usize {
            let mut min_char = 'z';
            let mut count = 0;
            for c in s.chars() {
                if c < min_char {
                    min_char = c;
                    count = 1;
                } else if c == min_char {
                    count += 1;
                }
            }
            count
        }
        
        let mut buckets = vec![0usize; 12];
        for w in &words {
            buckets[f(w)] += 1;
        }
        for i in (0..=9).rev() {
            buckets[i] += buckets[i + 1];
        }
        
        queries.iter().map(|q| buckets[f(q) + 1] as i32).collect()
    }
}

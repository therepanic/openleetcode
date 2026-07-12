impl Solution {
    pub fn orderly_queue(s: String, k: i32) -> String {
        if k > 1 {
            let mut chars: Vec<char> = s.chars().collect();
            chars.sort();
            return chars.into_iter().collect();
        }
        
        let mut res = s.clone();
        let mut current = s;
        for _ in 0..current.len() {
            current = format!("{}{}", &current[1..], &current[..1]);
            if current < res {
                res = current.clone();
            }
        }
        
        res
    }
}

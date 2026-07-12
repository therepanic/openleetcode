impl Solution {
    pub fn longest_wpi(hours: Vec<i32>) -> i32 {
        let mut score: i32 = 0;
        let mut longest_interval: i32 = 0;
        let mut seen_at: std::collections::HashMap<i32, i32> = std::collections::HashMap::new();
        seen_at.insert(0, -1);
        
        for (i, &h) in hours.iter().enumerate() {
            score += if h > 8 { 1 } else { -1 };
            
            if score > 0 {
                longest_interval = i as i32 + 1;
            } else if let Some(&prev_index) = seen_at.get(&(score - 1)) {
                longest_interval = longest_interval.max(i as i32 - prev_index);
            }
            
            if !seen_at.contains_key(&score) {
                seen_at.insert(score, i as i32);
            }
        }
        
        longest_interval
    }
}

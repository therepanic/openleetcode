impl Solution {
    pub fn max_score(s: String) -> i32 {
        let total_ones = s.chars().filter(|&c| c == '1').count() as i32;
        let mut zeros_count = 0i32;
        let mut ones_count = 0i32;
        let mut best_score = i32::MIN;
        let chars: Vec<char> = s.chars().collect();
        
        for i in 0..(chars.len() - 1) {
            if chars[i] == '0' {
                zeros_count += 1;
            } else {
                ones_count += 1;
            }
            
            let current_score = zeros_count + (total_ones - ones_count);
            best_score = best_score.max(current_score);
        }
        
        best_score
    }
}

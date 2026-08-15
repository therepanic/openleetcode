impl Solution {
    pub fn min_operations(boxes: String) -> Vec<i32> {
        let n = boxes.len();
        let mut distances = vec![0; n];
        let chars: Vec<char> = boxes.chars().collect();
        
        let mut prefix_count = 0;
        let mut prefix_sum = 0;
        
        for i in 0..n {
            distances[i] = prefix_count * i as i32 - prefix_sum;
            if chars[i] == '1' {
                prefix_count += 1;
                prefix_sum += i as i32;
            }
        }
        
        let mut suffix_count = 0;
        let mut suffix_sum = 0;
        
        for i in (0..n).rev() {
            distances[i] += suffix_sum - suffix_count * i as i32;
            if chars[i] == '1' {
                suffix_count += 1;
                suffix_sum += i as i32;
            }
        }
        
        distances
    }
}

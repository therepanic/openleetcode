impl Solution {
    pub fn beauty_sum(s: String) -> i32 {
        let n = s.len();
        let chars: Vec<char> = s.chars().collect();
        let mut sum_of_beauty = 0;
        for i in 0..n {
            let mut freq = vec![0; 26];
            for j in i..n {
                freq[chars[j] as usize - 97] += 1;
                let mut maxi = -1;
                let mut mini = i32::MAX;
                for &diff in &freq {
                    if diff > 0 {
                        maxi = maxi.max(diff);
                        mini = mini.min(diff);
                    }
                }
                sum_of_beauty += maxi - mini;
            }
        }
        sum_of_beauty
    }
}

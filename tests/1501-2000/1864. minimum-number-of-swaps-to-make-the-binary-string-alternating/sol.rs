impl Solution {
    pub fn min_swaps(s: String) -> i32 {
        let count0 = s.chars().filter(|&c| c == '0').count() as i32;
        let count1 = s.chars().filter(|&c| c == '1').count() as i32;
        
        if (count0 - count1).abs() > 1 {
            return -1;
        }
        
        let chars: Vec<char> = s.chars().collect();
        let mut mismatch0 = 0;
        let mut mismatch1 = 0;
        
        for (i, &c) in chars.iter().enumerate() {
            let expected0 = if i % 2 == 0 { '0' } else { '1' };
            let expected1 = if i % 2 == 0 { '1' } else { '0' };
            if c != expected0 { mismatch0 += 1; }
            if c != expected1 { mismatch1 += 1; }
        }
        
        if count0 == count1 {
            return (mismatch0 / 2).min(mismatch1 / 2);
        } else if count0 > count1 {
            return mismatch0 / 2;
        } else {
            return mismatch1 / 2;
        }
    }
}

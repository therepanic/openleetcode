impl Solution {
    pub fn max_happy_groups(batch_size: i32, groups: Vec<i32>) -> i32 {
        let b = batch_size as usize;
        let mut counts = vec![0i32; b];
        let mut happy_count = 0;
        for g in groups {
            let rem = (g % batch_size) as usize;
            if rem == 0 {
                happy_count += 1;
            } else {
                counts[rem] += 1;
            }
        }
        
        for i in 1..=(b / 2) {
            if i == b - i {
                let pair_count = counts[i] / 2;
                happy_count += pair_count;
                counts[i] %= 2;
            } else {
                let pair_count = std::cmp::min(counts[i], counts[b - i]);
                happy_count += pair_count;
                counts[i] -= pair_count;
                counts[b - i] -= pair_count;
            }
        }
        
        let state: Vec<i32> = counts[1..].to_vec();
        let mut memo = std::collections::HashMap::new();
        happy_count + Self::viterbi(&state, 0, batch_size, &mut memo)
    }
    
    fn viterbi(counts: &[i32], leftover: i32, batch_size: i32, memo: &mut std::collections::HashMap<String, i32>) -> i32 {
        let key = format!("{:?},{:?}", counts, leftover);
        if let Some(&val) = memo.get(&key) {
            return val;
        }
        
        if counts.iter().sum::<i32>() == 0 {
            memo.insert(key, 0);
            return 0;
        }
        
        let mut res = 0;
        for i in 0..counts.len() {
            if counts[i] > 0 {
                let rem = (i + 1) as i32;
                let mut next = counts.to_vec();
                next[i] -= 1;
                
                let is_happy = if leftover == 0 { 1 } else { 0 };
                let new_leftover = (leftover + rem) % batch_size;
                
                let val = is_happy + Self::viterbi(&next, new_leftover, batch_size, memo);
                if val > res {
                    res = val;
                }
            }
        }
        memo.insert(key, res);
        res
    }
}

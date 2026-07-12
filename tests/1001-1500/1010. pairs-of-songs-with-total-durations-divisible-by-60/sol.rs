impl Solution {
    pub fn num_pairs_divisible_by60(time: Vec<i32>) -> i32 {
        let mut remainders = vec![0i64; 60];
        for t in time {
            remainders[(t % 60) as usize] += 1;
        }
        
        let mut count = 0i64;
        count += remainders[0] * (remainders[0] - 1) / 2;
        count += remainders[30] * (remainders[30] - 1) / 2;
        
        for i in 1..30 {
            count += remainders[i] * remainders[60 - i];
        }
        
        count as i32
    }
}

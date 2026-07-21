impl Solution {
    pub fn max_performance(n: i32, speed: Vec<i32>, efficiency: Vec<i32>, k: i32) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let n = n as usize;
        let k = k as usize;
        let mut engineers: Vec<(i32, i32)> = efficiency.into_iter().zip(speed.into_iter()).collect();
        engineers.sort_unstable_by(|a, b| b.0.cmp(&a.0));
        
        let mut pq: std::collections::BinaryHeap<i32> = std::collections::BinaryHeap::new();
        let mut cur_sum: i64 = 0;
        let mut ans: i64 = 0;
        
        for (e, s) in engineers {
            while pq.len() > k - 1 {
                cur_sum -= -pq.pop().unwrap() as i64;
            }
            pq.push(-s);
            cur_sum += s as i64;
            ans = ans.max(cur_sum * e as i64);
        }
        
        (ans % MOD) as i32
    }
}

impl Solution {
    pub fn max_profit_assignment(difficulty: Vec<i32>, profit: Vec<i32>, worker: Vec<i32>) -> i32 {
        let mut jobs: Vec<(i32, i32)> = difficulty.into_iter().zip(profit.into_iter()).collect();
        jobs.sort_by_key(|&(d, _)| d);
        let mut worker = worker;
        worker.sort_unstable();
        let mut ans = 0;
        let mut best = 0;
        let mut i = 0;
        let n = jobs.len();
        for ability in worker {
            while i < n && jobs[i].0 <= ability {
                best = best.max(jobs[i].1);
                i += 1;
            }
            ans += best;
        }
        ans
    }
}

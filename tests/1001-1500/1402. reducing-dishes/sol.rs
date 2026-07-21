impl Solution {
    pub fn max_satisfaction(mut satisfaction: Vec<i32>) -> i32 {
        satisfaction.sort_unstable_by(|a, b| b.cmp(a));
        let mut presum = 0;
        let mut res = 0;
        for s in satisfaction {
            presum += s;
            if presum < 0 {
                break;
            }
            res += presum;
        }
        res
    }
}

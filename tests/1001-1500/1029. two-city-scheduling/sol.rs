impl Solution {
    pub fn two_city_sched_cost(costs: Vec<Vec<i32>>) -> i32 {
        let mut costs = costs;
        costs.sort_by_key(|x| x[0] - x[1]);
        let n = costs.len();
        let mut res = 0;
        for i in 0..n {
            if i < n / 2 {
                res += costs[i][0];
            } else {
                res += costs[i][1];
            }
        }
        res
    }
}

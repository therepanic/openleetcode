impl Solution {
    pub fn min_cost(houses: Vec<i32>, cost: Vec<Vec<i32>>, m: i32, n: i32, target: i32) -> i32 {
        let m = m as usize;
        let n = n as usize;
        let target = target as usize;
        let inf = 1_000_000_000;
        let mut prev = vec![vec![inf; target + 1]; n];
        if houses[0] != 0 {
            let c = (houses[0] - 1) as usize;
            prev[c][1] = 0;
        } else {
            for c in 0..n {
                prev[c][1] = cost[0][c];
            }
        }
        for i in 1..m {
            let mut curr = vec![vec![inf; target + 1]; n];
            if houses[i] != 0 {
                let c = (houses[i] - 1) as usize;
                let add = 0;
                for k in 1..=target {
                    if prev[c][k] < inf {
                        if prev[c][k] + add < curr[c][k] {
                            curr[c][k] = prev[c][k] + add;
                        }
                    }
                    if k > 1 {
                        let mut best = inf;
                        for pc in 0..n {
                            if pc != c && prev[pc][k - 1] < best {
                                best = prev[pc][k - 1];
                            }
                        }
                        if best < inf && best + add < curr[c][k] {
                            curr[c][k] = best + add;
                        }
                    }
                }
            } else {
                for c in 0..n {
                    let add = cost[i][c];
                    for k in 1..=target {
                        if prev[c][k] < inf {
                            if prev[c][k] + add < curr[c][k] {
                                curr[c][k] = prev[c][k] + add;
                            }
                        }
                        if k > 1 {
                            let mut best = inf;
                            for pc in 0..n {
                                if pc != c && prev[pc][k - 1] < best {
                                    best = prev[pc][k - 1];
                                }
                            }
                            if best < inf && best + add < curr[c][k] {
                                curr[c][k] = best + add;
                            }
                        }
                    }
                }
            }
            prev = curr;
        }
        let mut ans = inf;
        for c in 0..n {
            if prev[c][target] < ans {
                ans = prev[c][target];
            }
        }
        if ans >= inf {
            -1
        } else {
            ans
        }
    }
}

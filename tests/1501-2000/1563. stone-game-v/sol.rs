impl Solution {
    pub fn stone_game_v(stone_value: Vec<i32>) -> i32 {
        let n = stone_value.len();
        let mut sv = vec![0; n + 1];
        for i in 0..n {
            sv[i + 1] = sv[i] + stone_value[i];
        }
        let mut memo = vec![vec![-1; n + 1]; n + 1];
        Self::helper(&sv, 0, n, &mut memo)
    }
    
    fn helper(sv: &Vec<i32>, fro: usize, to: usize, memo: &mut Vec<Vec<i32>>) -> i32 {
        if to - fro == 1 { return 0; }
        if memo[fro][to] != -1 { return memo[fro][to]; }
        
        let target = (sv[to] + sv[fro]) / 2;
        let mut lo = fro;
        let mut hi = to;
        while lo < hi {
            let mid = (lo + hi) / 2;
            if sv[mid] < target { lo = mid + 1; } else { hi = mid; }
        }
        let mid = lo;
        
        let mut dist = 0;
        let mut res = 0;
        let mut explore_more = true;
        while explore_more {
            explore_more = false;
            for i in [mid - dist, mid + dist] {
                if fro < i && i <= to {
                    let left = sv[i] - sv[fro];
                    let right = sv[to] - sv[i];
                    if res / 2 <= left && left <= right {
                        res = res.max(left + Self::helper(sv, fro, i, memo));
                        explore_more = true;
                    }
                    if left >= right && right >= res / 2 {
                        res = res.max(right + Self::helper(sv, i, to, memo));
                        explore_more = true;
                    }
                }
            }
            dist += 1;
        }
        memo[fro][to] = res;
        res
    }
}

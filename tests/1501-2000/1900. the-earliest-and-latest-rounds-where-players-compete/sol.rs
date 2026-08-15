impl Solution {
    pub fn earliest_and_latest(n: i32, first_player: i32, second_player: i32) -> Vec<i32> {
        Self::dfs(n, first_player, second_player)
    }
    
    fn dfs(n: i32, p1: i32, p2: i32) -> Vec<i32> {
        if p1 + p2 == n + 1 {
            return vec![1, 1];
        }
        let (mut p1, mut p2) = (p1, p2);
        if p1 > p2 {
            std::mem::swap(&mut p1, &mut p2);
        }
        if n <= 4 {
            return vec![2, 2];
        }
        
        let m = (n + 1) / 2;
        let mut min_r = i32::MAX;
        let mut max_r = i32::MIN;
        
        if p1 - 1 > n - p2 {
            let t = n + 1 - p1;
            p1 = n + 1 - p2;
            p2 = t;
        }
        
        if p2 * 2 <= n + 1 {
            let a = p1 - 1;
            let b = p2 - p1 - 1;
            for i in 0..=a {
                for j in 0..=b {
                    let r = Self::dfs(m, i + 1, i + j + 2);
                    min_r = min_r.min(r[0] + 1);
                    max_r = max_r.max(r[1] + 1);
                }
            }
        } else {
            let p4 = n + 1 - p2;
            let a = p1 - 1;
            let b = p4 - p1 - 1;
            let c = p2 - p4 - 1;
            for i in 0..=a {
                for j in 0..=b {
                    let offset = i + j + 1 + (c + 1) / 2 + 1;
                    let r = Self::dfs(m, i + 1, offset);
                    min_r = min_r.min(r[0] + 1);
                    max_r = max_r.max(r[1] + 1);
                }
            }
        }
        
        vec![min_r, max_r]
    }
}

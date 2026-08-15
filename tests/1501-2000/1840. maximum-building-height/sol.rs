impl Solution {
    pub fn max_building(n: i32, restrictions: Vec<Vec<i32>>) -> i32 {
        let mut r = restrictions.clone();
        r.push(vec![1, 0]);
        r.sort_by(|a, b| a[0].cmp(&b[0]));
        let m = r.len();
        
        for i in 1..m {
            let y = r[i-1][1] + (r[i][0] - r[i-1][0]).abs();
            if r[i][1] > y {
                r[i][1] = y;
            }
        }
        
        for i in (0..m-1).rev() {
            let y = r[i+1][1] + (r[i+1][0] - r[i][0]).abs();
            if r[i][1] > y {
                r[i][1] = y;
            }
        }
        
        let mut res = 0;
        for i in 1..m {
            let peak = (r[i-1][1] + r[i][1] + r[i][0] - r[i-1][0]) / 2;
            if peak > res {
                res = peak;
            }
        }
        
        let last = r[m-1][1] + n - r[m-1][0];
        if last > res {
            return last;
        }
        res
    }
}

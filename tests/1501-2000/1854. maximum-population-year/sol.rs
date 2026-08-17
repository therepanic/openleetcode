impl Solution {
    pub fn maximum_population(logs: Vec<Vec<i32>>) -> i32 {
        let l = logs.len();
        let mut a: Vec<i32> = Vec::new();
        let mut r = 0;
        let mut y = 0;
        for i in &logs {
            a.push(i[0]);
        }
        for j in 0..l {
            let mut c = 0;
            for k in 0..l {
                if a[j] >= logs[k][0] && a[j] < logs[k][1] && j != k {
                    c += 1;
                }
            }
            if c > r {
                r = c;
                y = a[j];
            }
            if c == r && r > 0 {
                if a[j] < y {
                    y = a[j];
                }
            }
        }
        if y == 0 {
            return *a.iter().min().unwrap();
        }
        y
    }
}

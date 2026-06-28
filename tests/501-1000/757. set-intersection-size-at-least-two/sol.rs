impl Solution {
    pub fn intersection_size_two(intervals: Vec<Vec<i32>>) -> i32 {
        let mut intervals = intervals;
        intervals.sort_by(|x, y| {
            if x[1] != y[1] {
                x[1].cmp(&y[1])
            } else {
                y[0].cmp(&x[0])
            }
        });
        let mut ans = 0;
        let mut a = -1;
        let mut b = -1;
        for interval in &intervals {
            let l = interval[0];
            let r = interval[1];
            if l > b {
                a = r - 1;
                b = r;
                ans += 2;
            } else if l > a {
                a = b;
                b = r;
                ans += 1;
            }
        }
        ans
    }
}

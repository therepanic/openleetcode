impl Solution {
    pub fn remove_covered_intervals(intervals: Vec<Vec<i32>>) -> i32 {
        let mut intervals = intervals;
        intervals.sort_by(|a, b| a[0].cmp(&b[0]).then(b[1].cmp(&a[1])));
        let mut res = 0;
        let mut r = 0;
        for interval in intervals {
            if interval[1] > r {
                res += 1;
            }
            r = r.max(interval[1]);
        }
        res
    }
}

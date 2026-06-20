impl Solution {
    pub fn erase_overlap_intervals(intervals: Vec<Vec<i32>>) -> i32 {
        if intervals.is_empty() {
            return 0;
        }
        let mut intervals = intervals;
        intervals.sort_by_key(|i| i[1]);
        let mut count = 0;
        let mut end = intervals[0][1];
        for i in 1..intervals.len() {
            if end > intervals[i][0] {
                count += 1;
            } else {
                end = intervals[i][1];
            }
        }
        count
    }
}

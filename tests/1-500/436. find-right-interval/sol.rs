impl Solution {
    pub fn find_right_interval(intervals: Vec<Vec<i32>>) -> Vec<i32> {
        let n = intervals.len();
        let mut starts: Vec<(i32, usize)> = intervals.iter().enumerate().map(|(i, interval)| (interval[0], i)).collect();
        starts.sort_by_key(|k| k.0);
        let mut res = Vec::with_capacity(n);
        for interval in &intervals {
            let end = interval[1];
            let mut left = 0;
            let mut right = n;
            let mut idx = -1i32;
            while left < right {
                let mid = (left + right) / 2;
                if starts[mid].0 >= end {
                    idx = starts[mid].1 as i32;
                    right = mid;
                } else {
                    left = mid + 1;
                }
            }
            res.push(idx);
        }
        res
    }
}

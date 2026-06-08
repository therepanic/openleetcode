impl Solution {
    pub fn insert(intervals: Vec<Vec<i32>>, new_interval: Vec<i32>) -> Vec<Vec<i32>> {
        let mut res = Vec::new();
        let mut i = 0usize;
        let n = intervals.len();
        let mut current = new_interval;

        while i < n && intervals[i][1] < current[0] {
            res.push(intervals[i].clone());
            i += 1;
        }

        while i < n && intervals[i][0] <= current[1] {
            if intervals[i][0] < current[0] {
                current[0] = intervals[i][0];
            }
            if intervals[i][1] > current[1] {
                current[1] = intervals[i][1];
            }
            i += 1;
        }
        res.push(current);

        while i < n {
            res.push(intervals[i].clone());
            i += 1;
        }

        res
    }
}

impl Solution {
    pub fn merge(mut intervals: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        intervals.sort();
        let mut merged: Vec<Vec<i32>> = Vec::new();

        for interval in intervals {
            if merged.is_empty() || merged.last().unwrap()[1] < interval[0] {
                merged.push(interval);
            } else {
                let last = merged.last_mut().unwrap();
                if interval[1] > last[1] {
                    last[1] = interval[1];
                }
            }
        }

        merged
    }
}

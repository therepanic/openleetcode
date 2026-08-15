impl Solution {
    pub fn minimum_effort(tasks: Vec<Vec<i32>>) -> i32 {
        let mut tasks = tasks;
        tasks.sort_by(|a, b| (b[1] - b[0]).cmp(&(a[1] - a[0])));
        let test = |bal: i32| -> bool {
            let mut b = bal;
            for t in &tasks {
                if b < t[1] { return false; }
                b -= t[0];
            }
            true
        };
        let (mut lo, mut hi) = (0, 1_000_000_001);
        while lo < hi {
            let mid = (lo + hi) / 2;
            if test(mid) {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        lo
    }
}

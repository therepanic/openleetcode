impl Solution {
    pub fn longest_obstacle_course_at_each_position(obstacles: Vec<i32>) -> Vec<i32> {
        let mut tails: Vec<i32> = Vec::new();
        let mut res = Vec::with_capacity(obstacles.len());
        for &x in &obstacles {
            let idx = upper_bound(&tails, x);
            res.push((idx + 1) as i32);
            if idx == tails.len() {
                tails.push(x);
            } else {
                tails[idx] = x;
            }
        }
        res
    }
}

fn upper_bound(arr: &Vec<i32>, target: i32) -> usize {
    let mut lo = 0;
    let mut hi = arr.len();
    while lo < hi {
        let mid = lo + (hi - lo) / 2;
        if arr[mid] <= target {
            lo = mid + 1;
        } else {
            hi = mid;
        }
    }
    lo
}

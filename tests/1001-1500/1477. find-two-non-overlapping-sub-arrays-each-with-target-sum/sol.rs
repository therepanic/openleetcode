impl Solution {
    pub fn min_sum_of_lengths(arr: Vec<i32>, target: i32) -> i32 {
        let n = arr.len();
        let mut best_left = vec![n as i32; n];
        let mut min_total = i32::MAX;
        let mut left = 0;
        let mut curr = 0;
        for right in 0..n {
            curr += arr[right];
            while curr > target {
                curr -= arr[left];
                left += 1;
            }
            if curr == target {
                let length = (right - left + 1) as i32;
                if right > 0 {
                    best_left[right] = best_left[right - 1].min(length);
                } else {
                    best_left[right] = length;
                }
                if left > 0 && best_left[left - 1] != n as i32 {
                    min_total = min_total.min(best_left[left - 1] + length);
                }
            } else if right > 0 {
                best_left[right] = best_left[right - 1];
            }
        }
        if min_total == i32::MAX { -1 } else { min_total }
    }
}

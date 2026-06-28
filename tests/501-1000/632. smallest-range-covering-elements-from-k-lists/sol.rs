use std::collections::BinaryHeap;
use std::cmp::Reverse;

impl Solution {
    pub fn smallest_range(nums: Vec<Vec<i32>>) -> Vec<i32> {
        let mut heap = BinaryHeap::new();
        let mut cur_max = i32::MIN;
        for (i, arr) in nums.iter().enumerate() {
            let val = arr[0];
            heap.push(Reverse((val, i, 0usize)));
            cur_max = cur_max.max(val);
        }
        let mut small = vec![i32::MIN, i32::MAX];
        while let Some(Reverse((cur_min, list_idx, i))) = heap.pop() {
            if (cur_max as i64 - cur_min as i64) < (small[1] as i64 - small[0] as i64) {
                small = vec![cur_min, cur_max];
            }
            if i + 1 < nums[list_idx].len() {
                let nxt = nums[list_idx][i + 1];
                heap.push(Reverse((nxt, list_idx, i + 1)));
                cur_max = cur_max.max(nxt);
            } else {
                break;
            }
        }
        small
    }
}

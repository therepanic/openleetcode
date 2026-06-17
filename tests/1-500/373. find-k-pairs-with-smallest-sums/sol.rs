use std::collections::BinaryHeap;
use std::collections::HashSet;
use std::cmp::Reverse;

impl Solution {
    pub fn k_smallest_pairs(nums1: Vec<i32>, nums2: Vec<i32>, k: i32) -> Vec<Vec<i32>> {
        let mut result: Vec<Vec<i32>> = vec![];
        if nums1.is_empty() || nums2.is_empty() {
            return result;
        }

        let k = k as usize;
        let mut heap = BinaryHeap::new();
        let mut visited = HashSet::new();

        heap.push(Reverse((nums1[0] + nums2[0], 0, 0)));
        visited.insert((0, 0));

        while let Some(Reverse((_, i, j))) = heap.pop() {
            if result.len() >= k {
                break;
            }
            result.push(vec![nums1[i], nums2[j]]);

            if j + 1 < nums2.len() && !visited.contains(&(i, j + 1)) {
                visited.insert((i, j + 1));
                heap.push(Reverse((nums1[i] + nums2[j + 1], i, j + 1)));
            }

            if i + 1 < nums1.len() && !visited.contains(&(i + 1, j)) {
                visited.insert((i + 1, j));
                heap.push(Reverse((nums1[i + 1] + nums2[j], i + 1, j)));
            }
        }

        result
    }
}

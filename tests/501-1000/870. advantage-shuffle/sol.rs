impl Solution {
    pub fn advantage_count(nums1: Vec<i32>, nums2: Vec<i32>) -> Vec<i32> {
        let n = nums1.len();
        let mut nums1 = nums1;
        nums1.sort_unstable();
        
        let mut nums2_sorted: Vec<(i32, usize)> = nums2.into_iter().enumerate().map(|(i, v)| (v, i)).collect();
        nums2_sorted.sort_unstable_by_key(|&(v, _)| v);
        
        let mut res = vec![0; n];
        let mut left = 0;
        let mut right = n - 1;
        
        for i in (0..n).rev() {
            if nums1[right] > nums2_sorted[i].0 {
                res[nums2_sorted[i].1] = nums1[right];
                right -= 1;
            } else {
                res[nums2_sorted[i].1] = nums1[left];
                left += 1;
            }
        }
        
        res
    }
}

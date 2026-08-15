impl Solution {
    pub fn max_distance(nums1: Vec<i32>, nums2: Vec<i32>) -> i32 {
        let mut i = 0;
        let mut j = 0;
        let mut ans = 0;
        while i < nums1.len() && j < nums2.len() {
            if nums1[i] <= nums2[j] {
                ans = ans.max(j - i);
                j += 1;
            } else {
                i += 1;
                if i > j { j = i; }
            }
        }
        ans as i32
    }
}

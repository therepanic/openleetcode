impl Solution {
    pub fn max_sum(nums1: Vec<i32>, nums2: Vec<i32>) -> i32 {
        let (mut p1, mut p2) = (0, 0);
        let (mut sum1, mut sum2, mut result) = (0i64, 0i64, 0i64);
        while p1 < nums1.len() && p2 < nums2.len() {
            if nums1[p1] == nums2[p2] {
                result += sum1.max(sum2) + nums1[p1] as i64;
                sum1 = 0;
                sum2 = 0;
                p1 += 1;
                p2 += 1;
            } else if nums1[p1] < nums2[p2] {
                sum1 += nums1[p1] as i64;
                p1 += 1;
            } else {
                sum2 += nums2[p2] as i64;
                p2 += 1;
            }
        }
        while p1 < nums1.len() {
            sum1 += nums1[p1] as i64;
            p1 += 1;
        }
        while p2 < nums2.len() {
            sum2 += nums2[p2] as i64;
            p2 += 1;
        }
        ((result + sum1.max(sum2)) % 1_000_000_007) as i32
    }
}

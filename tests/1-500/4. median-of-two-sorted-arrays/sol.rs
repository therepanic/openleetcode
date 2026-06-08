impl Solution {
    pub fn find_median_sorted_arrays(mut nums1: Vec<i32>, mut nums2: Vec<i32>) -> f64 {
        if nums1.len() > nums2.len() {
            std::mem::swap(&mut nums1, &mut nums2);
        }

        let m = nums1.len();
        let n = nums2.len();
        let total_left = (m + n + 1) / 2;
        let mut left = 0usize;
        let mut right = m;

        while left <= right {
            let i = (left + right) / 2;
            let j = total_left - i;

            let max_left1 = if i == 0 { i64::MIN } else { nums1[i - 1] as i64 };
            let min_right1 = if i == m { i64::MAX } else { nums1[i] as i64 };
            let max_left2 = if j == 0 { i64::MIN } else { nums2[j - 1] as i64 };
            let min_right2 = if j == n { i64::MAX } else { nums2[j] as i64 };

            if max_left1 <= min_right2 && max_left2 <= min_right1 {
                let left_max = if max_left1 > max_left2 { max_left1 } else { max_left2 };
                if (m + n) % 2 == 1 {
                    return left_max as f64;
                }
                let right_min = if min_right1 < min_right2 { min_right1 } else { min_right2 };
                return (left_max + right_min) as f64 / 2.0;
            }

            if max_left1 > min_right2 {
                if i == 0 {
                    break;
                }
                right = i - 1;
            } else {
                left = i + 1;
            }
        }

        0.0
    }
}

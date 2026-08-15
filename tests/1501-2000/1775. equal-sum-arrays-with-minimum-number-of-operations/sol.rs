impl Solution {
    pub fn min_operations(nums1: Vec<i32>, nums2: Vec<i32>) -> i32 {
        let x: i32 = nums1.iter().sum();
        let y: i32 = nums2.iter().sum();
        if x == y { return 0; }
        if x < y {
            if 6 * (nums1.len() as i32) < nums2.len() as i32 { return -1; }
            let mut gains: Vec<i32> = nums1.iter().map(|v| 6-v).chain(nums2.iter().map(|v| v-1)).collect();
            gains.sort_by(|a,b| b.cmp(a));
            let mut diff = y - x;
            let mut ops = 0;
            for g in gains {
                if diff <= 0 { break; }
                diff -= g;
                ops += 1;
            }
            if diff <= 0 { return ops; }
            return -1;
        } else {
            if 6 * (nums2.len() as i32) < nums1.len() as i32 { return -1; }
            let mut gains: Vec<i32> = nums1.iter().map(|v| v-1).chain(nums2.iter().map(|v| 6-v)).collect();
            gains.sort_by(|a,b| b.cmp(a));
            let mut diff = x - y;
            let mut ops = 0;
            for g in gains {
                if diff <= 0 { break; }
                diff -= g;
                ops += 1;
            }
            if diff <= 0 { return ops; }
            return -1;
        }
    }
}

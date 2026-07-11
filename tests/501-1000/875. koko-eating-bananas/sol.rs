impl Solution {
    pub fn min_eating_speed(piles: Vec<i32>, h: i32) -> i32 {
        fn can_finish(piles: &Vec<i32>, h: i32, k: i32) -> bool {
            let mut hours: i64 = 0;
            for &pile in piles {
                hours += (pile as i64) / (k as i64);
                if pile % k != 0 {
                    hours += 1;
                }
                if hours > h as i64 {
                    return false;
                }
            }
            true
        }

        let mut left = 1;
        let mut right = *piles.iter().max().unwrap();
        let mut ans = right;
        while left <= right {
            let mid = left + (right - left) / 2;
            if can_finish(&piles, h, mid) {
                ans = mid;
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }
        ans
    }
}

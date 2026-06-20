impl Solution {
    pub fn count_range_sum(nums: Vec<i32>, lower: i32, upper: i32) -> i32 {
        let mut prefix = vec![0i64; nums.len() + 1];
        for i in 0..nums.len() {
            prefix[i + 1] = prefix[i] + nums[i] as i64;
        }

        let n = prefix.len();
        let mut buffer = vec![0i64; n];
        Self::count_while_merge_sort(
            &mut prefix,
            &mut buffer,
            0,
            n,
            lower as i64,
            upper as i64,
        ) as i32
    }

    fn count_while_merge_sort(
        prefix: &mut Vec<i64>,
        buffer: &mut Vec<i64>,
        left: usize,
        right: usize,
        lower: i64,
        upper: i64,
    ) -> i64 {
        if right - left <= 1 {
            return 0;
        }

        let mid = left + (right - left) / 2;
        let mut count = Self::count_while_merge_sort(prefix, buffer, left, mid, lower, upper)
            + Self::count_while_merge_sort(prefix, buffer, mid, right, lower, upper);

        let mut low = mid;
        let mut high = mid;
        for i in left..mid {
            while low < right && prefix[low] - prefix[i] < lower {
                low += 1;
            }
            while high < right && prefix[high] - prefix[i] <= upper {
                high += 1;
            }
            count += (high - low) as i64;
        }

        let mut p1 = left;
        let mut p2 = mid;
        let mut idx = left;
        while p1 < mid && p2 < right {
            if prefix[p1] <= prefix[p2] {
                buffer[idx] = prefix[p1];
                p1 += 1;
            } else {
                buffer[idx] = prefix[p2];
                p2 += 1;
            }
            idx += 1;
        }
        while p1 < mid {
            buffer[idx] = prefix[p1];
            p1 += 1;
            idx += 1;
        }
        while p2 < right {
            buffer[idx] = prefix[p2];
            p2 += 1;
            idx += 1;
        }
        for i in left..right {
            prefix[i] = buffer[i];
        }

        count
    }
}

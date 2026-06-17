impl Solution {
    pub fn count_range_sum(nums: Vec<i32>, lower: i32, upper: i32) -> i32 {
        let mut psum: Vec<i64> = vec![0];
        for num in nums {
            let last = *psum.last().unwrap();
            psum.push(last + num as i64);
        }

        let mut slist: Vec<i64> = Vec::new();
        let mut result = 0i32;
        for pval in psum.iter().rev() {
            let lo = *pval + lower as i64;
            let hi = *pval + upper as i64;

            let left = slist.binary_search_by(|x| {
                if *x < lo { std::cmp::Ordering::Less } else { std::cmp::Ordering::Greater }
            }).unwrap_or_else(|i| i);

            let right = slist.binary_search_by(|x| {
                if *x <= hi { std::cmp::Ordering::Less } else { std::cmp::Ordering::Greater }
            }).unwrap_or_else(|i| i);

            result += (right - left) as i32;

            let idx = slist.binary_search_by(|x| {
                if *x < *pval { std::cmp::Ordering::Less } else { std::cmp::Ordering::Greater }
            }).unwrap_or_else(|i| i);

            slist.insert(idx, *pval);
        }

        result
    }
}

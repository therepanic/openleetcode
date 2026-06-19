impl Solution {
    pub fn reverse_pairs(nums: Vec<i32>) -> i32 {
        fn sort_count(arr: Vec<i32>) -> (Vec<i32>, i32) {
            let n = arr.len();
            if n <= 1 {
                return (arr, 0);
            }

            let mid = n / 2;
            let (left, left_count) = sort_count(arr[..mid].to_vec());
            let (right, right_count) = sort_count(arr[mid..].to_vec());

            let mut count = left_count + right_count;

            let mut j = 0;
            for &x in &left {
                while j < right.len() && x as i64 > 2 * right[j] as i64 {
                    j += 1;
                }
                count += j as i32;
            }

            let mut merged = Vec::with_capacity(n);
            let mut i = 0;
            let mut k = 0;
            while i < left.len() && k < right.len() {
                if left[i] <= right[k] {
                    merged.push(left[i]);
                    i += 1;
                } else {
                    merged.push(right[k]);
                    k += 1;
                }
            }

            if i < left.len() {
                merged.extend_from_slice(&left[i..]);
            }
            if k < right.len() {
                merged.extend_from_slice(&right[k..]);
            }

            (merged, count)
        }

        sort_count(nums).1
    }
}

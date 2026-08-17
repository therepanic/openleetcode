impl Solution {
    pub fn sum_odd_length_subarrays(arr: Vec<i32>) -> i32 {
        let mut s: i32 = arr.iter().sum();
        let l = arr.len() - 1;
        let mut i = 2;
        while l >= i {
            let mut j = 0;
            let mut e = i;
            while e <= l {
                for k in j..=e {
                    s += arr[k];
                }
                j += 1;
                e += 1;
            }
            i += 2;
        }
        s
    }
}

impl Solution {
    pub fn reinitialize_permutation(n: i32) -> i32 {
        let n = n as usize;
        let original: Vec<usize> = (0..n).collect();
        let mut permut = original.clone();
        let mut arr = vec![0usize; n];
        let mut count = 0;
        loop {
            for i in 0..n {
                if i % 2 == 0 {
                    arr[i] = permut[i / 2];
                } else {
                    arr[i] = permut[n / 2 + (i - 1) / 2];
                }
            }
            permut = arr.clone();
            count += 1;
            if permut == original {
                break;
            }
        }
        count
    }
}

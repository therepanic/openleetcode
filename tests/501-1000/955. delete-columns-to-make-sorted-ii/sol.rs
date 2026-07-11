impl Solution {
    pub fn min_deletion_size(strs: Vec<String>) -> i32 {
        let n = strs.len();
        let m = strs[0].len();
        let mut sorted_pairs = vec![false; n - 1];
        let mut del_count = 0;
        let strs_bytes: Vec<Vec<u8>> = strs.iter().map(|s| s.bytes().collect()).collect();

        for col in 0..m {
            let mut bad = false;
            for i in 0..n - 1 {
                if !sorted_pairs[i] && strs_bytes[i][col] > strs_bytes[i + 1][col] {
                    bad = true;
                    break;
                }
            }

            if bad {
                del_count += 1;
                continue;
            }

            for i in 0..n - 1 {
                if !sorted_pairs[i] && strs_bytes[i][col] < strs_bytes[i + 1][col] {
                    sorted_pairs[i] = true;
                }
            }

            if sorted_pairs.iter().all(|&b| b) {
                break;
            }
        }

        del_count
    }
}

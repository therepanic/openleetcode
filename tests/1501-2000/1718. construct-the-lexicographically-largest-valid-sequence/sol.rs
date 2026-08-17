impl Solution {
    pub fn construct_distanced_sequence(n: i32) -> Vec<i32> {
        let n = n as usize;
        let mut result = vec![0; 2 * n - 1];
        let mut used = vec![false; n + 1];
        Self::backtrack(&mut result, &mut used, n, 0);
        result
    }

    fn backtrack(result: &mut Vec<i32>, used: &mut Vec<bool>, n: usize, index: usize) -> bool {
        let mut idx = index;
        while idx < result.len() && result[idx] != 0 {
            idx += 1;
        }
        if idx == result.len() {
            return true;
        }

        for i in (1..=n).rev() {
            if used[i] {
                continue;
            }

            if i == 1 {
                result[idx] = 1;
                used[1] = true;
                if Self::backtrack(result, used, n, idx + 1) {
                    return true;
                }
                result[idx] = 0;
                used[1] = false;
            } else if idx + i < result.len() && result[idx + i] == 0 {
                result[idx] = i as i32;
                result[idx + i] = i as i32;
                used[i] = true;
                if Self::backtrack(result, used, n, idx + 1) {
                    return true;
                }
                result[idx] = 0;
                result[idx + i] = 0;
                used[i] = false;
            }
        }

        false
    }
}

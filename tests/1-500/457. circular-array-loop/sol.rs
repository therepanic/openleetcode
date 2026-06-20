impl Solution {
    pub fn circular_array_loop(nums: Vec<i32>) -> bool {
        let n = nums.len();
        let mut done = vec![false; n];
        let mut seen = vec![-1_i32; n];
        let mut stamp = 0_i32;

        for i in 0..n {
            if done[i] {
                continue;
            }

            stamp += 1;
            let dir = nums[i] > 0;
            let mut path = Vec::new();
            let mut cur = i;

            while (nums[cur] > 0) == dir && !done[cur] {
                if seen[cur] == stamp {
                    let next = Self::next_index(&nums, cur);
                    return next != cur;
                }
                seen[cur] = stamp;
                path.push(cur);
                let next = Self::next_index(&nums, cur);
                if next == cur {
                    break;
                }
                cur = next;
            }

            for idx in path {
                done[idx] = true;
            }
        }

        false
    }

    fn next_index(nums: &Vec<i32>, i: usize) -> usize {
        let n = nums.len() as i32;
        (((i as i32 + nums[i]) % n + n) % n) as usize
    }
}

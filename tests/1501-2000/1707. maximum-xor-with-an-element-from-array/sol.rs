impl Solution {
    pub fn maximize_xor(nums: Vec<i32>, queries: Vec<Vec<i32>>) -> Vec<i32> {
        let mut trie: Vec<Vec<i32>> = vec![vec![-1, -1]];
        fn insert(num: i32, trie: &mut Vec<Vec<i32>>) {
            let mut node = 0usize;
            for i in (0..=31).rev() {
                let bit = ((num >> i) & 1) as usize;
                if trie[node][bit] == -1 {
                    trie[node][bit] = trie.len() as i32;
                    trie.push(vec![-1, -1]);
                }
                node = trie[node][bit] as usize;
            }
        }
        fn maxor(num: i32, trie: &Vec<Vec<i32>>) -> i32 {
            if trie[0][0] == -1 && trie[0][1] == -1 { return -1; }
            let mut node = 0usize;
            let mut ans = 0i32;
            for i in (0..=31).rev() {
                let bit = ((num >> i) & 1) as usize;
                let opp = 1 - bit;
                if trie[node][opp] != -1 {
                    ans |= 1 << i;
                    node = trie[node][opp] as usize;
                } else {
                    node = trie[node][bit] as usize;
                }
            }
            ans
        }

        let mut nums = nums.clone();
        nums.sort();
        let mut q: Vec<(i32, i32, usize)> = Vec::new();
        for (i, qv) in queries.iter().enumerate() {
            q.push((qv[1], qv[0], i));
        }
        q.sort();
        let mut res = vec![-1; queries.len()];
        let mut idx = 0usize;
        let n = nums.len();
        for (m, x, i) in q {
            while idx < n && nums[idx] <= m {
                insert(nums[idx], &mut trie);
                idx += 1;
            }
            res[i] = maxor(x, &trie);
        }
        res
    }
}

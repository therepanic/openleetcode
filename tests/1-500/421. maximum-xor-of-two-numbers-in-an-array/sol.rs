impl Solution {
    pub fn find_maximum_xor(nums: Vec<i32>) -> i32 {
        let max_num = *nums.iter().max().unwrap();
        let mx_bit = 32 - max_num.leading_zeros() as usize;
        
        let mut trie: Vec<Vec<i32>> = vec![vec![-1, -1]];
        
        fn insert(trie: &mut Vec<Vec<i32>>, num: i32, mx_bit: usize) {
            let mut node = 0;
            for i in (0..mx_bit).rev() {
                let bit = ((num >> i) & 1) as usize;
                if trie[node][bit] == -1 {
                    trie[node][bit] = trie.len() as i32;
                    trie.push(vec![-1, -1]);
                }
                node = trie[node][bit] as usize;
            }
        }
        
        fn get_max(trie: &Vec<Vec<i32>>, num: i32, mx_bit: usize) -> i32 {
            let mut node = 0;
            let mut ans = 0;
            for i in (0..mx_bit).rev() {
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
        
        for &num in &nums {
            insert(&mut trie, num, mx_bit);
        }
        
        let mut res = 0;
        for &num in &nums {
            res = res.max(get_max(&trie, num, mx_bit));
        }
        
        res
    }
}

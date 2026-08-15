impl Solution {
    pub fn stone_game_viii(stones: Vec<i32>) -> i32 {
        let n = stones.len();
        let mut prefix = stones.clone();
        for i in 1..n {
            prefix[i] += prefix[i-1];
        }
        let mut memo = vec![i32::MIN; n];
        
        fn rec(i: usize, n: usize, prefix: &Vec<i32>, memo: &mut Vec<i32>) -> i32 {
            if i == n - 2 {
                return prefix[i+1];
            }
            if memo[i] != i32::MIN {
                return memo[i];
            }
            let alice_cont = rec(i+1, n, prefix, memo);
            let alice_done = prefix[i+1] - rec(i+1, n, prefix, memo);
            memo[i] = alice_cont.max(alice_done);
            memo[i]
        }
        
        rec(0, n, &prefix, &mut memo)
    }
}

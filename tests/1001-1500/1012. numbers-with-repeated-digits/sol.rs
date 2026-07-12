impl Solution {
    pub fn num_dup_digits_at_most_n(n: i32) -> i32 {
        let s = (n + 1).to_string();
        let digits: Vec<usize> = s.chars().map(|c| c.to_digit(10).unwrap() as usize).collect();
        let nl = digits.len();
        let mut res = 0;
        for i in 0..nl - 1 {
            res += 9 * Self::perm(9, i);
        }
        let mut used = vec![false; 10];
        for i in 0..nl {
            let x = digits[i];
            let start = if i == 0 { 1 } else { 0 };
            for y in start..x {
                if !used[y] {
                    res += Self::perm(9 - i, nl - i - 1);
                }
            }
            if used[x] {
                break;
            }
            used[x] = true;
        }
        n - res as i32
    }
    
    fn perm(n: usize, k: usize) -> i32 {
        if k > n { return 0; }
        let mut ans = 1;
        for i in 0..k {
            ans *= (n - i) as i32;
        }
        ans
    }
}

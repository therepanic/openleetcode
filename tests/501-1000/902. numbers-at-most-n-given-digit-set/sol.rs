impl Solution {
    pub fn at_most_n_given_digit_set(digits: Vec<String>, n: i32) -> i32 {
        let d = digits.len() as i32;
        let s = n.to_string();
        let k = s.len() as i32;
        let vals: Vec<u8> = digits.iter().map(|d| d.as_bytes()[0]).collect();

        fn pow_int(base: i32, exp: i32) -> i32 {
            let mut out = 1;
            for _ in 0..exp {
                out *= base;
            }
            out
        }

        let mut ans = 0;
        for len in 1..k {
            ans += pow_int(d, len);
        }

        for (i, ch) in s.bytes().enumerate() {
            let cnt = vals.iter().filter(|&&digit| digit < ch).count() as i32;
            ans += cnt * pow_int(d, k - i as i32 - 1);

            if !vals.contains(&ch) {
                return ans;
            }
            if i == s.len() - 1 {
                ans += 1;
            }
        }

        ans
    }
}

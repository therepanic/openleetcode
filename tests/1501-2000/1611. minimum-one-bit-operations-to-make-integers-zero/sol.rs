impl Solution {
    pub fn minimum_one_bit_operations(n: i32) -> i32 {
        let mut highest = 0;
        for i in 0..32 {
            if (n & (1 << i)) != 0 {
                highest = i;
            }
        }

        let mut ans = 0;
        let mut add = true;
        for i in (0..=highest).rev() {
            if (n & (1 << i)) != 0 {
                let val = (1 << (i + 1)) - 1;
                if add {
                    ans += val;
                } else {
                    ans -= val;
                }
                add = !add;
            }
        }

        ans
    }
}

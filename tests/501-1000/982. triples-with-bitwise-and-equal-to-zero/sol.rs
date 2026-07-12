impl Solution {
    pub fn count_triplets(nums: Vec<i32>) -> i32 {
        let mut most = 0;
        for &num in &nums {
            if num > most {
                most = num;
            }
        }
        if most == 0 {
            return (nums.len() * nums.len() * nums.len()) as i32;
        }

        let bits = 32 - most.leading_zeros() as usize;
        let n = 1 << bits;

        let mut c = vec![0i32; n];
        for &num in &nums {
            c[num as usize] += 1;
        }

        let mut h = 1;
        while h < n {
            let mut s = 0;
            while s < n {
                for i in s..s + h {
                    c[i] += c[i + h];
                }
                s += h << 1;
            }
            h <<= 1;
        }

        for i in 0..n {
            c[i] = c[i] * c[i] * c[i];
        }

        h = 1;
        while h < n {
            let mut s = 0;
            while s < n {
                for i in s..s + h {
                    c[i] -= c[i + h];
                }
                s += h << 1;
            }
            h <<= 1;
        }

        c[0]
    }
}

impl Solution {
    pub fn sum_four_divisors(nums: Vec<i32>) -> i32 {
        if nums.is_empty() {
            return 0;
        }
        let max_num = *nums.iter().max().unwrap() as usize;
        if max_num < 2 {
            return 0;
        }

        let mut sieve = vec![true; max_num + 1];
        if max_num >= 0 {
            sieve[0] = false;
        }
        if max_num >= 1 {
            sieve[1] = false;
        }

        let mut p = 2;
        while p * p <= max_num {
            if sieve[p] {
                let mut multiple = p * p;
                while multiple <= max_num {
                    sieve[multiple] = false;
                    multiple += p;
                }
            }
            p += 1;
        }

        let mut total = 0;
        for &x in &nums {
            let x = x as i64;
            // p^3 case
            let p = (x as f64).cbrt().round() as i64;
            if p >= 0 && p <= max_num as i64 && p * p * p == x && sieve[p as usize] {
                total += (1 + p + p * p + x) as i32;
                continue;
            }

            // p * q case
            let mut i = 2i64;
            while i * i <= x {
                if x % i == 0 {
                    let j = x / i;
                    if i != j && i <= max_num as i64 && j <= max_num as i64 && sieve[i as usize] && sieve[j as usize] {
                        total += (1 + i + j + x) as i32;
                    }
                    break;
                }
                i += 1;
            }
        }
        total
    }
}

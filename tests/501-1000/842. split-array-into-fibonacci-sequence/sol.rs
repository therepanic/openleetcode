impl Solution {
    pub fn split_into_fibonacci(num: String) -> Vec<i32> {
        fn invalid(x: &str) -> bool {
            if x.starts_with('0') && x.len() > 1 {
                return true;
            }
            if x.len() > 10 {
                return true;
            }
            x.parse::<i64>().map(|v| v >= (1 << 31)).unwrap_or(true)
        }
        
        fn check(a0: &str, a1: &str, num: &str) -> Vec<i32> {
            let mut i = 0;
            let mut ret = vec![a0.parse::<i32>().unwrap(), a1.parse::<i32>().unwrap()];
            let mut cur_a0 = a0.to_string();
            let mut cur_a1 = a1.to_string();
            let num_chars: Vec<char> = num.chars().collect();
            while i < num_chars.len() {
                let a0_val = cur_a0.parse::<i64>().unwrap();
                let a1_val = cur_a1.parse::<i64>().unwrap();
                let res = (a0_val + a1_val).to_string();
                let res_chars: Vec<char> = res.chars().collect();
                let mut j = 0;
                while i < num_chars.len() && j < res_chars.len() && res_chars[j] == num_chars[i] {
                    j += 1;
                    i += 1;
                }
                if j < res_chars.len() || invalid(&res) {
                    return vec![];
                }
                cur_a0 = cur_a1;
                cur_a1 = res.clone();
                ret.push(res.parse::<i32>().unwrap());
            }
            ret
        }
        
        let n = num.len();
        for j in 1..n-1 {
            for i in 0..j {
                let a0 = &num[0..=i];
                let a1 = &num[i+1..=j];
                if invalid(a0) || invalid(a1) {
                    continue;
                }
                let ret = check(a0, a1, &num[j+1..]);
                if !ret.is_empty() {
                    return ret;
                }
            }
        }
        vec![]
    }
}

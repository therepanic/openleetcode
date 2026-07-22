impl Solution {
    pub fn min_integer(num: String, k: i32) -> String {
        let n = num.len();
        let mut dict: std::collections::HashMap<char, std::collections::VecDeque<usize>> = std::collections::HashMap::new();
        for (i, ch) in num.chars().enumerate() {
            dict.entry(ch).or_default().push_back(i);
        }
        
        let mut bit = vec![0i32; n + 1];
        fn update(bit: &mut Vec<i32>, mut i: usize, val: i32) {
            while i < bit.len() {
                bit[i] += val;
                i += i & (!i + 1);
            }
        }
        fn query(bit: &Vec<i32>, mut i: usize) -> i32 {
            let mut total = 0;
            while i > 0 {
                total += bit[i];
                i -= i & (!i + 1);
            }
            total
        }
        
        for i in 1..=n {
            update(&mut bit, i, 1);
        }
        
        let mut kk = k;
        let mut res = String::with_capacity(n);
        for _ in 0..n {
            for v in '0'..='9' {
                if let Some(dq) = dict.get_mut(&v) {
                    if let Some(&idx) = dq.front() {
                        let cnt = query(&bit, idx);
                        if cnt <= kk {
                            dq.pop_front();
                            kk -= cnt;
                            res.push(v);
                            update(&mut bit, idx + 1, -1);
                            break;
                        }
                    }
                }
            }
        }
        res
    }
}

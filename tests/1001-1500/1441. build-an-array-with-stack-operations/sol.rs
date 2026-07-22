impl Solution {
    pub fn build_array(target: Vec<i32>, n: i32) -> Vec<String> {
        let mut s: Vec<i32> = Vec::new();
        let mut res: Vec<String> = Vec::new();
        let mut a = 0;
        for i in 1..=n {
            if s == target {
                return res;
            }
            s.push(i);
            res.push("Push".to_string());
            if s[a] != target[a] {
                s.pop();
                res.push("Pop".to_string());
            } else {
                a += 1;
            }
        }
        res
    }
}

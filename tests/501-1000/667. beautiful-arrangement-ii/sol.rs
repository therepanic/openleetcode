impl Solution {
    pub fn construct_array(n: i32, k: i32) -> Vec<i32> {
        let mut ans: Vec<i32> = (1..=n - k).collect();
        for i in 0..k {
            let diff = i / 2 + 1;
            if i % 2 == 0 {
                ans.push(n - diff + 1);
            } else {
                ans.push(n - k + diff);
            }
        }
        ans
    }
}

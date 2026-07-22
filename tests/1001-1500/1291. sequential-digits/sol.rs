impl Solution {
    pub fn sequential_digits(low: i32, high: i32) -> Vec<i32> {
        let mut q: Vec<i32> = (1..=9).collect();
        let mut i = 0;
        while i < q.len() {
            let x = q[i];
            let d = x % 10;
            if d < 9 {
                q.push(x * 10 + d + 1);
            }
            i += 1;
        }
        q.into_iter().filter(|&x| low <= x && x <= high).collect()
    }
}

impl Solution {
    pub fn daily_temperatures(temperatures: Vec<i32>) -> Vec<i32> {
        let n = temperatures.len();
        let mut ans = vec![0; n];
        let mut stack: Vec<usize> = Vec::with_capacity(n);

        for i in 0..n {
            while let Some(&last) = stack.last() {
                if temperatures[i] > temperatures[last] {
                    let prev = stack.pop().unwrap();
                    ans[prev] = (i - prev) as i32;
                } else {
                    break;
                }
            }
            stack.push(i);
        }

        ans
    }
}

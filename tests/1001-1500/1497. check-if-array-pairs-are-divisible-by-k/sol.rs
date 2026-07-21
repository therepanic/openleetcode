impl Solution {
    pub fn can_arrange(arr: Vec<i32>, k: i32) -> bool {
        let mut a: Vec<i32> = arr.iter().map(|&v| ((v % k) + k) % k).collect();
        a.sort();
        let j = a.iter().take_while(|&&x| x == 0).count();
        if j % 2 != 0 {
            return false;
        }
        let b = &a[j..];
        for l in 0..b.len() / 2 {
            if (b[l] + b[b.len() - 1 - l]) % k != 0 {
                return false;
            }
        }
        true
    }
}

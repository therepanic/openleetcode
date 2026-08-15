impl Solution {
    pub fn get_maximum_generated(n: i32) -> i32 {
        if n == 0 {
            return 0;
        } else if n == 1 || n == 2 {
            return 1;
        } else {
            let n = n as usize;
            let mut a = vec![0; n + 1];
            a[0] = 0;
            a[1] = 1;
            let mut v = 1;
            for i in 2..=n {
                if i % 2 == 0 {
                    a[i] = a[v];
                } else {
                    a[i] = a[v] + a[v + 1];
                    v += 1;
                }
            }
            return *a.iter().max().unwrap();
        }
    }
}

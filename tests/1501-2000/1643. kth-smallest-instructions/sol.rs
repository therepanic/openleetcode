impl Solution {
    pub fn kth_smallest_path(destination: Vec<i32>, k: i32) -> String {
        let mut rows = destination[0];
        let mut cols = destination[1];
        let mut path = String::new();
        let mut k_local = k - 1;

        while rows > 0 || cols > 0 {
            let paths_with_h: i64;
            if cols > 0 {
                paths_with_h = Self::combination((rows + cols - 1) as usize, (cols - 1) as usize);
            } else {
                paths_with_h = 0;
            }

            if (k_local as i64) < paths_with_h {
                path.push('H');
                cols -= 1;
            } else {
                path.push('V');
                k_local -= paths_with_h as i32;
                rows -= 1;
            }
        }
        path
    }

    fn combination(n: usize, r: usize) -> i64 {
        if r == 0 || r == n {
            return 1;
        }
        let r = r.min(n - r);
        let mut result: i64 = 1;
        for i in 1..=r {
            result = result * (n - r + i) as i64 / i as i64;
        }
        result
    }
}

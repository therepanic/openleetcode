impl Solution {
    pub fn get_smallest_string(n: i32, k: i32) -> String {
        let mut res: Vec<char> = vec!['a'; n as usize];
        let mut kk = k - n;

        let mut i = (n - 1) as usize;
        while kk > 0 {
            let add = std::cmp::min(25, kk);
            res[i] = (b'a' + add as u8) as char;
            kk -= add;
            i -= 1;
        }

        res.into_iter().collect()
    }
}

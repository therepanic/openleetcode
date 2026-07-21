impl Solution {
    pub fn find_the_longest_substring(s: String) -> i32 {
        let mut mapy = [-2i32; 32];
        mapy[0] = -1;

        let mut res = 0i32;
        let mut mask = 0i32;

        for (i, c) in s.chars().enumerate() {
            match c {
                'a' => mask ^= 1,
                'e' => mask ^= 2,
                'i' => mask ^= 4,
                'o' => mask ^= 8,
                'u' => mask ^= 16,
                _ => {}
            }

            let prev = mapy[mask as usize];
            if prev == -2 {
                mapy[mask as usize] = i as i32;
            } else {
                let len = i as i32 - prev;
                if len > res {
                    res = len;
                }
            }
        }

        res
    }
}

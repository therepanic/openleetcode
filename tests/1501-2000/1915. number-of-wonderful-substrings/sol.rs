impl Solution {

    pub fn wonderful_substrings(word: String) -> i64 {

        let mut count = vec![0i64; 1024];

        count[0] = 1;

        let mut mask = 0i32;

        let mut res = 0i64;

        for ch in word.bytes() {

            let bit = (ch - b'a') as i32;

            mask ^= 1 << bit;

            res += count[mask as usize];

            for i in 0..10 {

                res += count[(mask ^ (1 << i)) as usize];

            }

            count[mask as usize] += 1;

        }

        res

    }

}

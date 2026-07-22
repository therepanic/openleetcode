impl Solution {
    pub fn get_kth(lo: i32, hi: i32, k: i32) -> i32 {
        let mut vc: Vec<(i32, i32)> = Vec::new();
        for i in lo..=hi {
            let mut num = i;
            let mut count = 0;
            while num != 1 {
                if num % 2 == 0 {
                    num /= 2;
                } else {
                    num = 3 * num + 1;
                }
                count += 1;
            }
            vc.push((i, count));
        }
        vc.sort_by_key(|x| (x.1, x.0));
        vc[(k - 1) as usize].0
    }
}

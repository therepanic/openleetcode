impl Solution {
    pub fn max_coins(piles: Vec<i32>) -> i32 {
        let mut piles = piles;
        piles.sort();
        let mut l = 0;
        let mut r = piles.len();
        let mut count = 0;
        for _ in 0..piles.len()/3 {
            count += piles[r-2];
            l += 1;
            r -= 2;
        }
        count
    }
}

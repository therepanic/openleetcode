impl Solution {
    pub fn get_maximum_consecutive(coins: Vec<i32>) -> i32 {
        let mut coins = coins;
        coins.sort();
        let mut max_consecutive = 0;
        
        for coin in coins {
            if coin > max_consecutive + 1 { break; }
            max_consecutive += coin;
        }
        
        max_consecutive + 1
    }
}

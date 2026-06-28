use std::collections::HashMap;

impl Solution {
    pub fn shopping_offers(price: Vec<i32>, special: Vec<Vec<i32>>, needs: Vec<i32>) -> i32 {
        let p = price.len();
        let mut memo = HashMap::new();
        
        fn dp(curr: Vec<i32>, price: &Vec<i32>, special: &Vec<Vec<i32>>, p: usize, memo: &mut HashMap<Vec<i32>, i32>) -> i32 {
            if curr.iter().all(|&x| x == 0) {
                return 0;
            }
            if let Some(&val) = memo.get(&curr) {
                return val;
            }
            
            let n = curr.len();
            let mut res = 0;
            for i in 0..p {
                res += curr[i] * price[i];
            }
            
            for offer in special {
                let mut can_use = true;
                for i in 0..n {
                    if curr[i] < offer[i] {
                        can_use = false;
                        break;
                    }
                }
                if can_use {
                    let new_curr: Vec<i32> = (0..n).map(|i| curr[i] - offer[i]).collect();
                    let cand = offer[offer.len() - 1] + dp(new_curr, price, special, p, memo);
                    if cand < res {
                        res = cand;
                    }
                }
            }
            
            memo.insert(curr, res);
            res
        }
        
        dp(needs, &price, &special, p, &mut memo)
    }
}

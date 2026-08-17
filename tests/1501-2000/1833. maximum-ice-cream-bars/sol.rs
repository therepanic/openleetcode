impl Solution {
    pub fn max_ice_cream(costs: Vec<i32>, coins: i32) -> i32 {
        let x_min = *costs.iter().min().unwrap();
        let x_max = *costs.iter().max().unwrap();
        let mut freq = vec![0; (x_max + 1) as usize];
        for &x in &costs {
            freq[x as usize] += 1;
        }
        let mut cnt = 0;
        let mut coins_left = coins;
        for x in x_min..=x_max {
            let f = freq[x as usize];
            if f == 0 { continue; }
            let buy = (coins_left / x).min(f);
            if buy == 0 { break; }
            cnt += buy;
            coins_left -= buy * x;
        }
        cnt
    }
}

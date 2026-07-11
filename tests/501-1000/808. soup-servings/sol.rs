use std::collections::HashMap;

impl Solution {
    pub fn soup_servings(n: i32) -> f64 {
        if n > 5000 {
            return 1.0;
        }
        let units = ((n as f64) / 25.0).ceil() as i32;
        let mut memo: HashMap<(i32, i32), f64> = HashMap::new();
        
        fn calc_prob(soup_a: i32, soup_b: i32, memo: &mut HashMap<(i32, i32), f64>) -> f64 {
            if let Some(&val) = memo.get(&(soup_a, soup_b)) {
                return val;
            }
            if soup_a <= 0 && soup_b <= 0 {
                return 0.5;
            }
            if soup_a <= 0 {
                return 1.0;
            }
            if soup_b <= 0 {
                return 0.0;
            }
            let result = 0.25 * (
                calc_prob(soup_a - 4, soup_b, memo) +
                calc_prob(soup_a - 3, soup_b - 1, memo) +
                calc_prob(soup_a - 2, soup_b - 2, memo) +
                calc_prob(soup_a - 1, soup_b - 3, memo)
            );
            memo.insert((soup_a, soup_b), result);
            result
        }
        
        calc_prob(units, units, &mut memo)
    }
}

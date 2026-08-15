impl Solution {
    pub fn closest_cost(base_costs: Vec<i32>, topping_costs: Vec<i32>, target: i32) -> i32 {
        let mut s = vec![0];
        for i in topping_costs {
            let mut ss = Vec::new();
            for j in s.iter() {
                ss.push(j.clone());
                ss.push(j + i);
                ss.push(j + 2*i);
            }
            s = ss;
        }
        s.sort();
        let mut ans = 1000000000i32;
        let mut fans = 1000000000i32;
        let n = s.len();
        for i in base_costs {
            let j = target - i;
            let mut x = match s.binary_search(&j) {
                Ok(pos) => pos,
                Err(pos) => pos.saturating_sub(1),
            };
            let mut ans1 = (j - s[x]).abs();
            if ans1 < ans {
                ans = ans1;
                fans = s[x] + i;
            } else if ans1 == ans {
                fans = fans.min(s[x] + i);
            }
            if x + 1 < n {
                x += 1;
                ans1 = (j - s[x]).abs();
                if ans1 < ans {
                    ans = ans1;
                    fans = s[x] + i;
                } else if ans1 == ans {
                    fans = fans.min(s[x] + i);
                }
            }
        }
        fans
    }
}

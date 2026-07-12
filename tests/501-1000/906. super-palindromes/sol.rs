impl Solution {
    pub fn superpalindromes_in_range(left: String, right: String) -> i32 {
        let L: i64 = left.parse().unwrap();
        let R: i64 = right.parse().unwrap();
        let mut count = 0;
        for i in 1..=100000 {
            let s = i.to_string();
            let rev: String = s.chars().rev().collect();
            let val1: i64 = format!("{}{}", s, rev).parse().unwrap();
            let val2: i64 = format!("{}{}", s, &rev[1..]).parse().unwrap();
            let sqval1 = val1 * val1;
            let sqval2 = val2 * val2;
            if L <= sqval1 && sqval1 <= R {
                let ssqval1 = sqval1.to_string();
                if ssqval1 == ssqval1.chars().rev().collect::<String>() {
                    count += 1;
                }
            }
            if L <= sqval2 && sqval2 <= R {
                let ssqval2 = sqval2.to_string();
                if ssqval2 == ssqval2.chars().rev().collect::<String>() {
                    count += 1;
                }
            }
            if val2 > R {
                break;
            }
        }
        count
    }
}

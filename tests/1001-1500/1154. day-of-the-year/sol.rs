impl Solution {
    pub fn day_of_year(date: String) -> i32 {
        use std::collections::HashMap;
        let mut val: HashMap<i32, i32> = HashMap::from([
            (1, 0), (2, 31), (3, 59), (4, 90), (5, 120), (6, 151),
            (7, 181), (8, 212), (9, 243), (10, 273), (11, 304), (12, 334),
        ]);
        let d: i32 = date[8..].parse().unwrap();
        let m: i32 = date[5..7].parse().unwrap();
        let y: i32 = date[0..4].parse().unwrap();
        let is_leap = (y % 400 == 0) || (y % 4 == 0 && y % 100 != 0);
        if is_leap {
            for i in 3..=12 {
                *val.get_mut(&i).unwrap() += 1;
            }
        }
        d + val[&m]
    }
}

impl Solution {
    pub fn days_between_dates(date1: String, date2: String) -> i32 {
        let (y1, m1, d1) = Self::parse(&date1);
        let (y2, m2, d2) = Self::parse(&date2);
        (Self::days_since_1970(y1, m1, d1) - Self::days_since_1970(y2, m2, d2)).abs()
    }

    fn parse(date: &str) -> (i32, i32, i32) {
        let parts: Vec<i32> = date.split('-').map(|s| s.parse().unwrap()).collect();
        (parts[0], parts[1], parts[2])
    }

    fn days_since_1970(y: i32, m: i32, d: i32) -> i32 {
        let (mut y, mut m) = (y, m);
        if m < 3 {
            y -= 1;
            m += 12;
        }
        365 * y + y / 4 - y / 100 + y / 400 + (153 * m - 457) / 5 + d - 306 - 719468
    }
}

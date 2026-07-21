impl Solution {
    pub fn day_of_the_week(day: i32, month: i32, year: i32) -> String {
        let days = ["Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday"];
        
        let mut leap_years = std::collections::HashSet::new();
        let mut i = 1960;
        while i < 2100 {
            leap_years.insert(i);
            i += 4;
        }
        
        let mut years_days = std::collections::HashMap::new();
        for i in 1960..=2100 {
            years_days.insert(i, if leap_years.contains(&i) { 366 } else { 365 });
        }
        
        let mut months_days = vec![0, 31, if leap_years.contains(&year) { 29 } else { 28 }, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        
        let mut result_days = 0;
        for y in 1971..year {
            result_days += years_days[&y];
        }
        for m in 1..month {
            result_days += months_days[m as usize];
        }
        result_days += day;
        
        days[(result_days % 7) as usize].to_string()
    }
}

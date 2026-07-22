impl Solution {
    pub fn reformat_date(date: String) -> String {
        let month_dict = std::collections::HashMap::from([
            ("Jan", "01"), ("Feb", "02"), ("Mar", "03"), ("Apr", "04"),
            ("May", "05"), ("Jun", "06"), ("Jul", "07"), ("Aug", "08"),
            ("Sep", "09"), ("Oct", "10"), ("Nov", "11"), ("Dec", "12"),
        ]);
        let parts: Vec<&str> = date.split_whitespace().collect();
        let day_str = parts[0];
        let day_num = &day_str[..day_str.len()-2];
        let day = if day_num.len() == 1 { format!("0{}", day_num) } else { day_num.to_string() };
        let month = month_dict[parts[1]];
        let year = parts[2];
        format!("{}-{}-{}", year, month, day)
    }
}

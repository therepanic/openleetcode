impl Solution {
    pub fn maximum_swap(num: i32) -> i32 {
        let mut num_list: Vec<char> = num.to_string().chars().collect();
        let mut last_index = std::collections::HashMap::new();
        for (i, &d) in num_list.iter().enumerate() {
            last_index.insert(d.to_digit(10).unwrap() as i32, i);
        }
        for i in 0..num_list.len() {
            let d = num_list[i].to_digit(10).unwrap() as i32;
            for x in (d + 1..=9).rev() {
                if let Some(&idx) = last_index.get(&x) {
                    if idx > i {
                        num_list.swap(i, idx);
                        return num_list.iter().collect::<String>().parse().unwrap();
                    }
                }
            }
        }
        num
    }
}

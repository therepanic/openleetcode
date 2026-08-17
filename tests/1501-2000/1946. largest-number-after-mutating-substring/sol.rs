impl Solution {
    pub fn maximum_number(num: String, change: Vec<i32>) -> String {
        let mut a: Vec<char> = num.chars().collect();
        let mut flag = false;
        for i in 0..a.len() {
            let b = a[i].to_digit(10).unwrap() as i32;
            if b < change[b as usize] {
                a[i] = std::char::from_digit(change[b as usize] as u32, 10).unwrap();
                flag = true;
            } else if b == change[b as usize] || !flag {
                continue;
            } else {
                break;
            }
        }
        a.into_iter().collect()
    }
}

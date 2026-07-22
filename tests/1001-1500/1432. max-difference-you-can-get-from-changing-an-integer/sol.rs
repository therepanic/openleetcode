impl Solution {
    pub fn max_diff(num: i32) -> i32 {
        let text = num.to_string();

        let max_digit = text.chars().find(|&digit| digit != '9');
        let high = replace_digit(&text, max_digit, '9');

        let first = text.chars().next().unwrap();
        let low_digit = if first != '1' {
            Some(first)
        } else {
            text.chars().skip(1).find(|&digit| digit != '0' && digit != '1')
        };
        let low_replacement = if first != '1' { '1' } else { '0' };
        let low = replace_digit(&text, low_digit, low_replacement);

        high.parse::<i32>().unwrap() - low.parse::<i32>().unwrap()
    }
}

fn replace_digit(text: &str, digit: Option<char>, replacement: char) -> String {
    match digit {
        Some(target) => text
            .chars()
            .map(|current| if current == target { replacement } else { current })
            .collect(),
        None => text.to_string(),
    }
}

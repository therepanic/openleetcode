impl Solution {
    pub fn next_greater_element(n: i32) -> i32 {
        let mut digits: Vec<char> = n.to_string().chars().collect();
        let length = digits.len();
        let mut pivot: i32 = -1;

        for i in (0..length - 1).rev() {
            if digits[i] < digits[i + 1] {
                pivot = i as i32;
                break;
            }
        }

        if pivot == -1 {
            return -1;
        }

        let p = pivot as usize;
        for i in (p + 1..length).rev() {
            if digits[i] > digits[p] {
                digits.swap(i, p);
                break;
            }
        }

        let mut left = p + 1;
        let mut right = length - 1;
        while left < right {
            digits.swap(left, right);
            left += 1;
            right -= 1;
        }

        let result_str: String = digits.into_iter().collect();
        if let Ok(result) = result_str.parse::<i64>() {
            if result <= i32::MAX as i64 {
                return result as i32;
            }
        }
        -1
    }
}

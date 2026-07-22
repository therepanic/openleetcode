impl Solution {
    pub fn largest_multiple_of_three(digits: Vec<i32>) -> String {
        let mut counts = [0usize; 10];
        for digit in digits {
            counts[digit as usize] += 1;
        }

        let sum: i32 = (0usize..10).map(|i| i as i32 * counts[i] as i32).sum();
        let remainder = sum % 3;

        fn remove_smallest(counts: &mut [usize; 10], group: &[usize], mut amount: usize) -> bool {
            for &digit in group {
                while amount > 0 && counts[digit] > 0 {
                    counts[digit] -= 1;
                    amount -= 1;
                }
            }
            amount == 0
        }

        if remainder == 1 {
            if !remove_smallest(&mut counts, &[1, 4, 7], 1) {
                remove_smallest(&mut counts, &[2, 5, 8], 2);
            }
        } else if remainder == 2 {
            if !remove_smallest(&mut counts, &[2, 5, 8], 1) {
                remove_smallest(&mut counts, &[1, 4, 7], 2);
            }
        }

        let mut result = String::new();
        for digit in (0usize..10).rev() {
            for _ in 0..counts[digit] {
                result.push(char::from(b'0' + digit as u8));
            }
        }
        
        if result.starts_with('0') {
            "0".to_string()
        } else {
            result
        }
    }
}

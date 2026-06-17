impl Solution {
    pub fn number_to_words(num: i32) -> String {
        let ones = vec![
            "Zero",
            "One",
            "Two",
            "Three",
            "Four",
            "Five",
            "Six",
            "Seven",
            "Eight",
            "Nine",
            "Ten",
            "Eleven",
            "Twelve",
            "Thirteen",
            "Fourteen",
            "Fifteen",
            "Sixteen",
            "Seventeen",
            "Eighteen",
            "Nineteen",
        ];

        let tens = vec![
            "Zero",
            "Ten",
            "Twenty",
            "Thirty",
            "Forty",
            "Fifty",
            "Sixty",
            "Seventy",
            "Eighty",
            "Ninety",
        ];

        let magnitude = vec![
            "",
            "Thousand",
            "Million",
            "Billion",
            "Trillion",
        ];

        fn helper3_digit(n: i32, ones: &[&str], tens: &[&str]) -> String {
            let mut num = n;
            let mut ans = String::new();
            let mut count = 0;
            let mut prev_rem = 0;

            while num > 0 {
                count += 1;
                let rem = num % 10;
                num /= 10;

                if rem == 0 {
                    continue;
                } else if count == 1 {
                    ans += ones[rem as usize];
                } else if count == 2 {
                    if rem == 1 {
                        ans = ones[(rem * 10 + prev_rem) as usize].to_string();
                    } else {
                        ans = format!("{} {}", tens[rem as usize], ans);
                    }
                } else if count == 3 {
                    ans = format!("{} Hundred {}", ones[rem as usize], ans);
                }
                prev_rem = rem;
            }

            ans.trim().to_string()
        }

        if num == 0 {
            return "Zero".to_string();
        }

        let mut n = num;
        let mut ans = String::new();
        let mut count = 0;

        while n > 0 {
            let rem = n % 1000;
            if rem != 0 {
                ans = format!("{} {} {}", helper3_digit(rem, &ones, &tens), magnitude[count], ans);
            }
            n /= 1000;
            count += 1;
        }

        ans.trim().to_string()
    }
}

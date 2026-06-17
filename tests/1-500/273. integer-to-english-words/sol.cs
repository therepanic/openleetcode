public class Solution {
    private string[] ones = {
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
        "Nineteen"
    };

    private string[] tens = {
        "Zero",
        "Ten",
        "Twenty",
        "Thirty", 
        "Forty", 
        "Fifty", 
        "Sixty", 
        "Seventy", 
        "Eighty", 
        "Ninety"
    };

    private string[] magnitude = {
        "",
        "Thousand",
        "Million",
        "Billion",
        "Trillion"
    };

    private string Helper3Digit(int n) {
        int num = n;
        string ans = "";
        int count = 0;
        int rem = 0;
        int prevRem = 0;

        while (num > 0) {
            count++;
            rem = num % 10;
            num /= 10;

            if (rem == 0) {
                continue;
            } else if (count == 1) {
                ans += ones[rem];
            } else if (count == 2) {
                if (rem == 1) {
                    ans = ones[rem * 10 + prevRem];
                } else {
                    ans = tens[rem] + " " + ans;
                }
            } else if (count == 3) {
                ans = ones[rem] + " Hundred " + ans;
            }
            prevRem = rem;
        }

        return ans.Trim();
    }

    public string NumberToWords(int num) {
        if (num == 0) {
            return "Zero";
        }

        int n = num;
        string ans = "";
        int count = 0;

        while (n > 0) {
            int rem = n % 1000;
            if (rem != 0) {
                ans = Helper3Digit(rem) + " " + magnitude[count] + " " + ans;
            }
            n /= 1000;
            count++;
        }

        return ans.Trim();
    }
}

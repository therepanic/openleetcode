class Solution {
    private String[] ones = {
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

    private String[] tens = {
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

    private String[] magnitude = {
        "",
        "Thousand",
        "Million",
        "Billion",
        "Trillion"
    };

    private String helper3Digit(int n) {
        int num = n;
        StringBuilder ans = new StringBuilder();
        int count = 0;
        int rem = 0;
        int prevRem = 0;

        while (num > 0) {
            count++;
            rem = num % 10;
            num = num / 10;

            if (rem == 0) {
                continue;
            } else if (count == 1) {
                ans.append(ones[rem]);
            } else if (count == 2) {
                if (rem == 1) {
                    ans = new StringBuilder(ones[rem * 10 + prevRem]);
                } else {
                    ans = new StringBuilder(tens[rem] + " " + ans.toString());
                }
            } else if (count == 3) {
                ans = new StringBuilder(ones[rem] + " Hundred " + ans.toString());
            }
            prevRem = rem;
        }

        return ans.toString().trim();
    }

    public String numberToWords(int num) {
        if (num == 0) {
            return "Zero";
        }

        int n = num;
        StringBuilder ans = new StringBuilder();
        int count = 0;

        while (n > 0) {
            int rem = n % 1000;
            if (rem != 0) {
                ans = new StringBuilder(helper3Digit(rem) + " " + magnitude[count] + " " + ans.toString());
            }
            n = n / 1000;
            count++;
        }

        return ans.toString().trim();
    }
}

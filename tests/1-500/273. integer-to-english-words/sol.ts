function numberToWords(num: number): string {
    const ones: string[] = [
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
    ];

    const tens: string[] = [
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
    ];

    const magnitude: string[] = [
        "",
        "Thousand",
        "Million",
        "Billion",
        "Trillion"
    ];

    const helper3Digit = (n: number): string => {
        let num = n;
        let ans = "";
        let count = 0;
        let rem = 0;
        let prevRem = 0;

        while (num > 0) {
            count++;
            rem = num % 10;
            num = Math.floor(num / 10);

            if (rem === 0) {
                continue;
            } else if (count === 1) {
                ans += ones[rem];
            } else if (count === 2) {
                if (rem === 1) {
                    ans = ones[rem * 10 + prevRem];
                } else {
                    ans = tens[rem] + " " + ans;
                }
            } else if (count === 3) {
                ans = ones[rem] + " Hundred " + ans;
            }
            prevRem = rem;
        }

        return ans.trim();
    };

    if (num === 0) {
        return "Zero";
    }

    let n = num;
    let ans = "";
    let count = 0;

    while (n > 0) {
        const rem = n % 1000;
        if (rem !== 0) {
            ans = helper3Digit(rem) + " " + magnitude[count] + " " + ans;
        }
        n = Math.floor(n / 1000);
        count++;
    }

    return ans.trim();
}

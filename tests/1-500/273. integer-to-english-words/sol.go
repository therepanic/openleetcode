func numberToWords(num int) string {
    ones := []string{
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
    }

    tens := []string{
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
    }

    magnitude := []string{
        "",
        "Thousand",
        "Million",
        "Billion",
        "Trillion",
    }

    helper3Digit := func(n int) string {
        num := n
        ans := ""
        count := 0
        prevRem := 0

        for num > 0 {
            count++
            rem := num % 10
            num /= 10

            if rem == 0 {
                continue
            } else if count == 1 {
                ans += ones[rem]
            } else if count == 2 {
                if rem == 1 {
                    ans = ones[rem*10+prevRem]
                } else {
                    ans = tens[rem] + " " + ans
                }
            } else if count == 3 {
                ans = ones[rem] + " Hundred " + ans
            }
            prevRem = rem
        }
        return strings.TrimSpace(ans)
    }

    if num == 0 {
        return "Zero"
    }

    n := num
    ans := ""
    count := 0

    for n > 0 {
        rem := n % 1000
        if rem != 0 {
            ans = helper3Digit(rem) + " " + magnitude[count] + " " + ans
        }
        n /= 1000
        count++
    }

    return strings.TrimSpace(ans)
}

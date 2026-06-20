# @param {Integer} num
# @return {String}
def number_to_words(num)
    ones = [
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
    ]

    tens = [
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
    ]

    magnitude = [
        "",
        "Thousand",
        "Million",
        "Billion",
        "Trillion"
    ]

    helper = lambda do |n|
        num = n
        ans = ""
        count = 0
        prev_rem = 0

        while num > 0
            count += 1
            rem = num % 10
            num = num / 10

            next if rem == 0

            if count == 1
                ans += ones[rem]
            elsif count == 2
                if rem == 1
                    ans = ones[10 + prev_rem]
                else
                    ans = tens[rem] + " " + ans
                end
            elsif count == 3
                ans = ones[rem] + " Hundred " + ans
            end
            prev_rem = rem
        end
        ans.strip
    end

    return "Zero" if num == 0

    n = num
    ans = ""
    count = 0

    while n > 0
        rem = n % 1000
        if rem != 0
            ans = helper.call(rem) + " " + magnitude[count] + " " + ans
        end
        n = n / 1000
        count += 1
    end

    ans.strip
end

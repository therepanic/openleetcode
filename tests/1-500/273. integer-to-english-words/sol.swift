class Solution {
    private let ones = [
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
    
    private let tens = [
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
    
    private let magnitude = [
        "",
        "Thousand",
        "Million",
        "Billion",
        "Trillion"
    ]
    
    private func helper3Digit(_ n: Int) -> String {
        var num = n
        var ans = ""
        var count = 0
        var rem = 0
        var prevRem = 0
        
        while num > 0 {
            count += 1
            rem = num % 10
            num /= 10
            
            if rem == 0 {
                continue
            } else if count == 1 {
                ans += ones[rem]
            } else if count == 2 {
                if rem == 1 {
                    ans = ones[rem * 10 + prevRem]
                } else {
                    ans = tens[rem] + " " + ans
                }
            } else if count == 3 {
                ans = ones[rem] + " Hundred " + ans
            }
            prevRem = rem
        }
        
        return ans.trimmingCharacters(in: .whitespaces)
    }
    
    func numberToWords(_ num: Int) -> String {
        if num == 0 {
            return "Zero"
        }
        
        var n = num
        var ans = ""
        var count = 0
        
        while n > 0 {
            let rem = n % 1000
            if rem != 0 {
                ans = helper3Digit(rem) + " " + magnitude[count] + " " + ans
            }
            n /= 1000
            count += 1
        }
        
        return ans.trimmingCharacters(in: .whitespaces)
    }
}

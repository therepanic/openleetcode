class Solution {
private:
    vector<string> ones = {
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
    
    vector<string> tens = {
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
    
    vector<string> magnitude = {
        "",
        "Thousand",
        "Million",
        "Billion",
        "Trillion"
    };
    
    string helper3Digit(int n) {
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
        
        // Trim trailing space
        while (!ans.empty() && ans.back() == ' ') {
            ans.pop_back();
        }
        return ans;
    }
    
public:
    string numberToWords(int num) {
        if (num == 0) {
            return "Zero";
        }
        
        int n = num;
        string ans = "";
        int count = 0;
        
        while (n > 0) {
            int rem = n % 1000;
            if (rem != 0) {
                ans = helper3Digit(rem) + " " + magnitude[count] + " " + ans;
            }
            n /= 1000;
            count++;
        }
        
        // Trim trailing and leading spaces
        while (!ans.empty() && ans.back() == ' ') {
            ans.pop_back();
        }
        if (!ans.empty() && ans.front() == ' ') {
            ans.erase(0, 1);
        }
        
        return ans;
    }
};

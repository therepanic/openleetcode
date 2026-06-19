class Solution {
public:
    int largestPalindrome(int n) {
        if (n == 1) {
            return 9;
        }
        
        long long minNum = pow(10, n - 1);
        long long maxNum = pow(10, n) - 1;
        long long maxPal = 0;
        
        for (long long i = maxNum; i >= minNum; i -= 2) {
            if (i * i < maxPal) {
                break;
            }
            
            for (long long j = maxNum; j >= i; j -= 2) {
                long long product = i * j;
                
                if (product % 11 != 0 && product >= maxPal) {
                    continue;
                }
                
                string str = to_string(product);
                string rev = str;
                reverse(rev.begin(), rev.end());
                if (str == rev) {
                    maxPal = product;
                }
            }
        }
        
        return maxPal % 1337;
    }
};

public class Solution {
    public int LargestPalindrome(int n) {
        if (n == 1) {
            return 9;
        }
        
        long minNum = (long)Math.Pow(10, n - 1);
        long maxNum = (long)Math.Pow(10, n) - 1;
        long maxPal = 0;
        
        for (long i = maxNum; i >= minNum; i -= 2) {
            if (i * i < maxPal) {
                break;
            }
            
            for (long j = maxNum; j >= i; j -= 2) {
                long product = i * j;
                
                if (product % 11 != 0 && product >= maxPal) {
                    continue;
                }
                
                string str = product.ToString();
                char[] charArray = str.ToCharArray();
                Array.Reverse(charArray);
                string rev = new string(charArray);
                if (str == rev) {
                    maxPal = product;
                }
            }
        }
        
        return (int)(maxPal % 1337);
    }
}

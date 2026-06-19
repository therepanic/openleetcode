class Solution {
    public int largestPalindrome(int n) {
        if (n == 1) {
            return 9;
        }
        
        long minNum = (long) Math.pow(10, n - 1);
        long maxNum = (long) Math.pow(10, n) - 1;
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
                
                String str = Long.toString(product);
                String rev = new StringBuilder(str).reverse().toString();
                if (str.equals(rev)) {
                    maxPal = product;
                }
            }
        }
        
        return (int) (maxPal % 1337);
    }
}

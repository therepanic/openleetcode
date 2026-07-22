class Solution {
    public int subtractProductAndSum(int n) {
        int sum_digits = 0;
        int product_digits = 1;
        
        while (n > 0) {
            int digit = n % 10;
            sum_digits += digit;
            product_digits *= digit;
            n /= 10;
        }
        
        return product_digits - sum_digits;
    }
}

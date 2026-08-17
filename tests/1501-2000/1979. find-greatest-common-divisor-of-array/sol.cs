public class Solution {
    public int FindGCD(int[] nums) {
        int a = nums.Min();
        int b = nums.Max();
        return Gcd(a, b);
    }
    
    private int Gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
}

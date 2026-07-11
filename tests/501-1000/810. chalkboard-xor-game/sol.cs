public class Solution {
    public bool XorGame(int[] nums) {
        int totalXor = 0;
        foreach (int value in nums) {
            totalXor ^= value;
        }
        
        bool isXorZero = (totalXor == 0);
        bool hasEvenLength = (nums.Length % 2 == 0);
        
        return isXorZero || hasEvenLength;
    }
}

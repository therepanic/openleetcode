class Solution {
    public boolean xorGame(int[] nums) {
        int totalXor = 0;
        for (int value : nums) {
            totalXor ^= value;
        }
        
        boolean isXorZero = (totalXor == 0);
        boolean hasEvenLength = (nums.length % 2 == 0);
        
        return isXorZero || hasEvenLength;
    }
}

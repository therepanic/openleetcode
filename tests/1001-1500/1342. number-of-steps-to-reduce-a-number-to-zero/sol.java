class Solution {
    public int numberOfSteps(int num) {
        if (num == 0) return 0;
        return (32 - Integer.numberOfLeadingZeros(num)) - 1 + Integer.bitCount(num);
    }
}

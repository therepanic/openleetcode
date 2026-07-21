class Solution {
    public int findNumbers(int[] nums) {
        int count = 0;
        for (int i : nums) {
            int msb = Integer.SIZE - Integer.numberOfLeadingZeros(i) - 1;
            int digits = (int)(msb * 0.30103) + 1;
            if (i >= Math.pow(10, digits)) {
                digits++;
            }
            if (digits % 2 == 0) {
                count++;
            }
        }
        return count;
    }
}

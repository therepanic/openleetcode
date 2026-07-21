class Solution {
    public int[] closestDivisors(int num) {
        int start = (int) Math.sqrt(num + 2);
        for (int d = start; d >= 1; d--) {
            if ((num + 1) % d == 0) {
                return new int[]{d, (num + 1) / d};
            }
            if ((num + 2) % d == 0) {
                return new int[]{d, (num + 2) / d};
            }
        }
        return new int[0];
    }
}

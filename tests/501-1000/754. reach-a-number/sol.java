class Solution {
    public int reachNumber(int target) {
        target = Math.abs(target);
        int n = (int)((-1 + Math.sqrt(1 + 8.0 * target)) / 2);
        int a = n * (n + 1) / 2;
        int b = a + n + 1;
        
        if (a == target)
            return n;
        if ((b - target) % 2 == 0)
            return n + 1;
        return (n + 2) % 2 == 1 ? n + 2 : n + 3;
    }
}

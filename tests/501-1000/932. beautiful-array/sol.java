class Solution {
    public int[] beautifulArray(int n) {
        if (n == 1) {
            return new int[]{1};
        }
        
        int[] left = beautifulArray((n + 1) / 2);
        int[] right = beautifulArray(n / 2);
        
        int[] result = new int[n];
        int idx = 0;
        
        for (int x : left) {
            result[idx++] = 2 * x - 1;
        }
        for (int x : right) {
            result[idx++] = 2 * x;
        }
        
        return result;
    }
}

public class Solution {
    public int[] BeautifulArray(int n) {
        if (n == 1) {
            return new int[] { 1 };
        }
        
        int[] left = BeautifulArray((n + 1) / 2);
        int[] right = BeautifulArray(n / 2);
        
        int[] result = new int[n];
        int idx = 0;
        
        foreach (int x in left) {
            result[idx++] = 2 * x - 1;
        }
        foreach (int x in right) {
            result[idx++] = 2 * x;
        }
        
        return result;
    }
}

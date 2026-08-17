class Solution {
    public String getSmallestString(int n, int k) {
        char[] res = new char[n];
        java.util.Arrays.fill(res, 'a');
        k -= n;

        int i = n - 1;
        while (k > 0) {
            int add = Math.min(25, k);
            res[i] = (char) ('a' + add);
            k -= add;
            i--;
        }

        return new String(res);
    }
}

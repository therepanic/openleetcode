public class Solution {
    public string GetSmallestString(int n, int k) {
        char[] res = new char[n];
        Array.Fill(res, 'a');
        k -= n;

        int i = n - 1;
        while (k > 0) {
            int add = Math.Min(25, k);
            res[i] = (char)('a' + add);
            k -= add;
            i--;
        }

        return new string(res);
    }
}

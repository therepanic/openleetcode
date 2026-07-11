public class Solution {
    public int[] MaxDepthAfterSplit(string seq) {
        int n = seq.Length;
        int[] res = new int[n];
        int depth = 0;
        for (int i = 0; i < n; i++) {
            char ch = seq[i];
            if (ch == '(') {
                depth++;
                res[i] = depth % 2;
            } else {
                res[i] = depth % 2;
                depth--;
            }
        }
        return res;
    }
}

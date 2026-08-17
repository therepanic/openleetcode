public class Solution {
    public string RestoreString(string s, int[] indices) {
        char[] res = new char[indices.Length];
        for (int i = 0; i < indices.Length; i++) {
            res[indices[i]] = s[i];
        }
        return new string(res);
    }
}

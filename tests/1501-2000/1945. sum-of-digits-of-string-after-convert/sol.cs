public class Solution {
    public int GetLucky(string s, int k) {
        string res = "";
        foreach (char c in s) {
            res += (c - 'a' + 1).ToString();
        }
        for (int i = 0; i < k; i++) {
            int sum = 0;
            foreach (char c in res) {
                sum += c - '0';
            }
            res = sum.ToString();
        }
        return int.Parse(res);
    }
}

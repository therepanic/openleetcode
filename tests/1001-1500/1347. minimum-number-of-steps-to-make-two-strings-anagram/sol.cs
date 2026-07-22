public class Solution {
    public int MinSteps(string s, string t) {
        var dic = new Dictionary<char, int>();
        foreach (char ch in t) {
            if (dic.ContainsKey(ch)) dic[ch]++;
            else dic[ch] = 1;
        }
        foreach (char ch in s) {
            if (dic.ContainsKey(ch) && dic[ch] > 0) {
                dic[ch]--;
            }
        }
        int sum = 0;
        foreach (var val in dic.Values) {
            sum += val;
        }
        return sum;
    }
}

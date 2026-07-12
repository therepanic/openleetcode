public class Solution {
    public int MinAddToMakeValid(string s) {
        var l = new List<char> { '0' };
        foreach (char i in s) {
            if (l[l.Count - 1] == '(' && i == ')') {
                l.RemoveAt(l.Count - 1);
            } else {
                l.Add(i);
            }
        }
        return l.Count - 1;
    }
}

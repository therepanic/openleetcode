public class Solution {
    public int MaxNumberOfBalloons(string text) {
        var f = new Dictionary<char, int>();
        foreach (char c in text) {
            if (f.ContainsKey(c)) f[c]++;
            else f[c] = 1;
        }
        int get(char c) => f.ContainsKey(c) ? f[c] : 0;
        return Math.Min(Math.Min(Math.Min(get('b'), get('a')), Math.Min(get('l') / 2, get('o') / 2)), get('n'));
    }
}

public class Solution {
    public string ReverseWords(string s) {
        var parts = s.Split((char[])null, System.StringSplitOptions.RemoveEmptyEntries);
        System.Array.Reverse(parts);
        return string.Join(" ", parts);
    }
}

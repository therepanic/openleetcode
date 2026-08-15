public class Solution {
    public string ReorderSpaces(string text) {
        var words = text.Split(' ', StringSplitOptions.RemoveEmptyEntries);
        int total = text.Count(c => c == ' ');
        if (words.Length == 1) {
            return words[0] + new string(' ', total);
        }
        int gap = total / (words.Length - 1);
        int extra = total % (words.Length - 1);
        return string.Join(new string(' ', gap), words) + new string(' ', extra);
    }
}

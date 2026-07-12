public class Solution {
    public string[] ReorderLogFiles(string[] logs) {
        var letters = new List<(string body, string ident)>();
        var digits = new List<string>();
        foreach (var log in logs) {
            var split = log.Split(' ', 2);
            var ident = split[0];
            var rest = split[1];
            if (char.IsDigit(rest[0])) digits.Add(log);
            else letters.Add((rest, ident));
        }
        letters.Sort((a, b) => {
            int cmp = a.body.CompareTo(b.body);
            if (cmp != 0) return cmp;
            return a.ident.CompareTo(b.ident);
        });
        var result = new List<string>(logs.Length);
        foreach (var entry in letters) {
            result.Add(entry.ident + " " + entry.body);
        }
        result.AddRange(digits);
        return result.ToArray();
    }
}

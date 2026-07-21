public class Solution {
    public bool IsSolvable(string[] words, string result) {
        var zeroes = new HashSet<char>();
        int m = 0;
        foreach (var word in words) {
            if (word.Length > 1) {
                zeroes.Add(word[0]);
            }
            m = Math.Max(m, word.Length);
        }
        if (m > result.Length) return false;

        var d = new Dictionary<char, int>();
        foreach (var word in words) {
            foreach (var c in word) {
                d[c] = -1;
            }
        }
        foreach (var c in result) {
            d[c] = -1;
        }

        var wordsRev = words.Select(w => new string(w.Reverse().ToArray())).ToArray();
        var resultRev = new string(result.Reverse().ToArray());
        int R = resultRev.Length;
        int N = wordsRev.Length;
        var visited = new HashSet<int> { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

        Func<int, int, int, bool> rec = null;
        rec = (wi, ri, rem) => {
            if (ri == R) {
                return rem == 0 && (result.Length == 1 || d[resultRev[R - 1]] != 0);
            }
            if (wi == N) {
                if (d[resultRev[ri]] != -1) {
                    if (d[resultRev[ri]] != rem % 10) return false;
                    return rec(0, ri + 1, rem / 10);
                } else if (visited.Contains(rem % 10)) {
                    int val = rem % 10;
                    visited.Remove(val);
                    d[resultRev[ri]] = val;
                    bool ret = rec(wi, ri, rem);
                    d[resultRev[ri]] = -1;
                    visited.Add(val);
                    if (ret) return true;
                }
                return false;
            }
            if (wordsRev[wi].Length <= ri) {
                return rec(wi + 1, ri, rem);
            }
            if (d[wordsRev[wi][ri]] != -1) {
                return rec(wi + 1, ri, rem + d[wordsRev[wi][ri]]);
            }
            for (int val = 0; val < 10; val++) {
                if (visited.Contains(val) && (val != 0 || !zeroes.Contains(wordsRev[wi][ri]))) {
                    visited.Remove(val);
                    d[wordsRev[wi][ri]] = val;
                    bool ret = rec(wi + 1, ri, rem + val);
                    d[wordsRev[wi][ri]] = -1;
                    visited.Add(val);
                    if (ret) return true;
                }
            }
            return false;
        };

        return rec(0, 0, 0);
    }
}

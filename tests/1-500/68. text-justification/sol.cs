using System.Collections.Generic;
using System.Text;

public class Solution {
    public IList<string> FullJustify(string[] words, int maxWidth) {
        var res = new List<string>();
        int i = 0;

        while (i < words.Length) {
            int j = i;
            int lineLen = 0;
            while (j < words.Length && lineLen + words[j].Length + (j - i) <= maxWidth) {
                lineLen += words[j].Length;
                j++;
            }

            int spaces = maxWidth - lineLen;
            int gaps = j - i - 1;
            var line = new StringBuilder();

            if (j == words.Length || gaps == 0) {
                for (int k = i; k < j; k++) {
                    if (k > i) {
                        line.Append(' ');
                    }
                    line.Append(words[k]);
                }
                while (line.Length < maxWidth) {
                    line.Append(' ');
                }
            } else {
                int each = spaces / gaps;
                int extra = spaces % gaps;
                for (int k = i; k < j; k++) {
                    line.Append(words[k]);
                    if (k < j - 1) {
                        int count = each + (extra > 0 ? 1 : 0);
                        line.Append(' ', count);
                        if (extra > 0) {
                            extra--;
                        }
                    }
                }
            }

            res.Add(line.ToString());
            i = j;
        }

        return res;
    }
}

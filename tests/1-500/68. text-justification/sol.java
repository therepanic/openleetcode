import java.util.*;

public class Solution {
    public List<String> fullJustify(String[] words, int maxWidth) {
        List<String> res = new ArrayList<>();
        int i = 0;

        while (i < words.length) {
            int j = i;
            int lineLen = 0;
            while (j < words.length && lineLen + words[j].length() + (j - i) <= maxWidth) {
                lineLen += words[j].length();
                j++;
            }

            int spaces = maxWidth - lineLen;
            int gaps = j - i - 1;
            StringBuilder line = new StringBuilder();

            if (j == words.length || gaps == 0) {
                for (int k = i; k < j; k++) {
                    if (k > i) {
                        line.append(' ');
                    }
                    line.append(words[k]);
                }
                while (line.length() < maxWidth) {
                    line.append(' ');
                }
            } else {
                int each = spaces / gaps;
                int extra = spaces % gaps;
                for (int k = i; k < j; k++) {
                    line.append(words[k]);
                    if (k < j - 1) {
                        int count = each + (extra > 0 ? 1 : 0);
                        for (int x = 0; x < count; x++) {
                            line.append(' ');
                        }
                        if (extra > 0) {
                            extra--;
                        }
                    }
                }
            }

            res.add(line.toString());
            i = j;
        }

        return res;
    }
}

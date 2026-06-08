class Solution {
public:
    vector<string> fullJustify(vector<string>& words, int maxWidth) {
        vector<string> res;
        int i = 0;
        int n = static_cast<int>(words.size());

        while (i < n) {
            int j = i;
            int lineLen = 0;
            while (j < n && lineLen + static_cast<int>(words[j].size()) + (j - i) <= maxWidth) {
                lineLen += static_cast<int>(words[j].size());
                ++j;
            }

            int spaces = maxWidth - lineLen;
            int gaps = j - i - 1;
            string line;

            if (j == n || gaps == 0) {
                for (int k = i; k < j; ++k) {
                    if (k > i) {
                        line.push_back(' ');
                    }
                    line += words[k];
                }
                line += string(maxWidth - line.size(), ' ');
            } else {
                int each = spaces / gaps;
                int extra = spaces % gaps;
                for (int k = i; k < j; ++k) {
                    line += words[k];
                    if (k < j - 1) {
                        int count = each + (extra > 0 ? 1 : 0);
                        line += string(count, ' ');
                        if (extra > 0) {
                            --extra;
                        }
                    }
                }
            }

            res.push_back(line);
            i = j;
        }

        return res;
    }
};

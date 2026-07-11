class Solution {
public:
    vector<int> numberOfLines(vector<int>& widths, string s) {
        int lines = 1;
        int current = 0;
        for (char c : s) {
            int w = widths[c - 'a'];
            if (current + w > 100) {
                lines++;
                current = w;
            } else {
                current += w;
            }
        }
        return {lines, current};
    }
};

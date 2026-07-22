class Solution {
public:
    int longestDecomposition(string text) {
        int i = 0, j = text.size() - 1, n = 0, count = 0;
        while (i <= j) {
            if (text[i] == text[j]) {
                if (text.substr(i, n + 1) == text.substr(j, n + 1)) {
                    count += 2;
                    i += n + 1;
                    j -= 1;
                    n = 0;
                    continue;
                }
            }
            j -= 1;
            n += 1;
        }
        return i == j + 1 ? count : count - 1;
    }
};

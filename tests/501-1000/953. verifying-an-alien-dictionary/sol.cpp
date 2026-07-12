class Solution {
public:
    bool isAlienSorted(vector<string>& words, string order) {
        int orderMap[26];
        for (int i = 0; i < order.size(); i++) {
            orderMap[order[i] - 'a'] = i;
        }

        for (int i = 0; i < words.size() - 1; i++) {
            string w1 = words[i];
            string w2 = words[i + 1];

            int minLen = min(w1.size(), w2.size());
            int j;
            for (j = 0; j < minLen; j++) {
                if (w1[j] != w2[j]) {
                    if (orderMap[w1[j] - 'a'] > orderMap[w2[j] - 'a']) {
                        return false;
                    }
                    break;
                }
            }
            if (j == minLen && w1.size() > w2.size()) {
                return false;
            }
        }

        return true;
    }
};

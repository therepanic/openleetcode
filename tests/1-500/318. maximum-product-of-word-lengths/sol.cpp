class Solution {
public:
    int maxProduct(vector<string>& words) {
        int n = words.size();
        vector<int> bitmasks(n, 0);
        for (int i = 0; i < n; i++) {
            int mask = 0;
            for (char c : words[i]) {
                mask |= 1 << (c - 'a');
            }
            bitmasks[i] = mask;
        }
        int maxProd = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if ((bitmasks[i] & bitmasks[j]) == 0) {
                    maxProd = max(maxProd, (int)(words[i].length() * words[j].length()));
                }
            }
        }
        return maxProd;
    }
};

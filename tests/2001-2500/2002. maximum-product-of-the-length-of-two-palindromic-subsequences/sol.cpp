class Solution {
public:
    int maxProduct(string s) {
        int n = s.size();
        vector<pair<int, int>> palin_masks;
        
        for (int mask = 1; mask < (1 << n); mask++) {
            string seq;
            for (int i = 0; i < n; i++) {
                if ((mask >> i) & 1) {
                    seq += s[i];
                }
            }
            string rev = seq;
            reverse(rev.begin(), rev.end());
            if (seq == rev) {
                int count = __builtin_popcount(mask);
                palin_masks.push_back({mask, count});
            }
        }
        
        int max_product = 0;
        for (int i = 0; i < palin_masks.size(); i++) {
            for (int j = i + 1; j < palin_masks.size(); j++) {
                int m1 = palin_masks[i].first;
                int m2 = palin_masks[j].first;
                int l1 = palin_masks[i].second;
                int l2 = palin_masks[j].second;
                if ((m1 & m2) == 0) {
                    max_product = max(max_product, l1 * l2);
                }
            }
        }
        
        return max_product;
    }
};

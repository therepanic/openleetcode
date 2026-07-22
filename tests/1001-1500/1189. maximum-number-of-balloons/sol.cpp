class Solution {
public:
    int maxNumberOfBalloons(string text) {
        unordered_map<char, int> f;
        for (char c : text) {
            f[c]++;
        }
        return min({f['b'], f['a'], f['l'] / 2, f['o'] / 2, f['n']});
    }
};

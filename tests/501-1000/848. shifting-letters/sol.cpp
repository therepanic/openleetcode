class Solution {
public:
    string shiftingLetters(string s, vector<int>& shifts) {
        int n = shifts.size();
        vector<int> l(n);
        int z = 0;
        for (int i = n - 1; i >= 0; --i) {
            z = (z + shifts[i]) % 26;
            l[i] = z;
        }
        vector<int> p(n);
        for (int i = 0; i < n; i++) {
            p[i] = s[i] - 'a';
        }
        string k;
        for (int i = 0; i < n; i++) {
            k += (char)(((p[i] + l[i]) % 26) + 'a');
        }
        return k;
    }
};

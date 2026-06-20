class Solution {
public:
    vector<int> findAnagrams(string s, string p) {
        int n1 = s.size(), n2 = p.size();
        vector<int> res;
        if (n1 < n2) return res;

        int a[26] = {0};
        int b[26] = {0};

        for (int i = 0; i < n2; i++) {
            a[p[i] - 'a']++;
            b[s[i] - 'a']++;
        }

        bool equal = true;
        for (int i = 0; i < 26; i++) {
            if (a[i] != b[i]) {
                equal = false;
                break;
            }
        }
        if (equal) res.push_back(0);

        for (int i = n2; i < n1; i++) {
            b[s[i] - 'a']++;
            b[s[i - n2] - 'a']--;
            equal = true;
            for (int j = 0; j < 26; j++) {
                if (a[j] != b[j]) {
                    equal = false;
                    break;
                }
            }
            if (equal) res.push_back(i - n2 + 1);
        }

        return res;
    }
};

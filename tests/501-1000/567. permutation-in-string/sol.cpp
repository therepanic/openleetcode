class Solution {
public:
    bool checkInclusion(string s1, string s2) {
        int n1 = s1.length(), n2 = s2.length();
        if (n2 < n1) return false;

        vector<int> c1(26, 0), c2(26, 0);

        for (int i = 0; i < n1; i++) {
            c1[s1[i] - 'a']++;
            c2[s2[i] - 'a']++;
        }

        if (c1 == c2) return true;

        for (int i = n1; i < n2; i++) {
            c2[s2[i] - 'a']++;
            c2[s2[i - n1] - 'a']--;

            if (c1 == c2) return true;
        }

        return false;
    }
};

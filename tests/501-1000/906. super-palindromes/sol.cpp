class Solution {
public:
    int superpalindromesInRange(string left, string right) {
        long long L = stoll(left);
        long long R = stoll(right);
        int count = 0;
        for (int i = 1; i <= 100000; i++) {
            string s = to_string(i);
            string rev = s;
            reverse(rev.begin(), rev.end());
            long long val1 = stoll(s + rev);
            long long val2 = stoll(s + rev.substr(1));
            long long sqval1 = val1 * val1;
            long long sqval2 = val2 * val2;
            if (L <= sqval1 && sqval1 <= R) {
                string ssqval1 = to_string(sqval1);
                string rssqval1 = ssqval1;
                reverse(rssqval1.begin(), rssqval1.end());
                if (ssqval1 == rssqval1) {
                    count++;
                }
            }
            if (L <= sqval2 && sqval2 <= R) {
                string ssqval2 = to_string(sqval2);
                string rssqval2 = ssqval2;
                reverse(rssqval2.begin(), rssqval2.end());
                if (ssqval2 == rssqval2) {
                    count++;
                }
            }
            if (val2 > R) {
                break;
            }
        }
        return count;
    }
};

class Solution {
public:
    string nearestPalindromic(string n) {
        long long num = stoll(n);
        
        auto convert = [](long long x) -> long long {
            string s = to_string(x);
            int l = 0, r = s.size() - 1;
            while (l <= r) {
                s[r] = s[l];
                r--;
                l++;
            }
            return stoll(s);
        };
        
        auto prevPal = [&](long long x) -> long long {
            long long low = 0, high = 1e19;
            long long ans = -1;
            while (low <= high) {
                long long mid = (low + high) >> 1;
                long long val = convert(mid);
                if (val >= x) {
                    high = mid - 1;
                } else {
                    low = mid + 1;
                    ans = val;
                }
            }
            return ans;
        };
        
        auto nextPal = [&](long long x) -> long long {
            long long low = 0, high = 1e19;
            long long ans = -1;
            while (low <= high) {
                long long mid = (low + high) >> 1;
                long long val = convert(mid);
                if (val <= x) {
                    low = mid + 1;
                } else {
                    ans = val;
                    high = mid - 1;
                }
            }
            return ans;
        };
        
        long long v1 = prevPal(num);
        long long v2 = nextPal(num);
        if (abs(v1 - num) > abs(v2 - num)) {
            return to_string(v2);
        } else {
            return to_string(v1);
        }
    }
};

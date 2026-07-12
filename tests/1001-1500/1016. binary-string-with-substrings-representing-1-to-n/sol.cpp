class Solution {
public:
    bool queryString(string s, int n) {
        for (int num = n; num >= 1; num--) {
            string target;
            int temp = num;
            while (temp > 0) {
                target = (char)('0' + temp % 2) + target;
                temp /= 2;
            }
            int length = target.length();
            int left = 0;
            bool valid = false;
            for (int right = 0; right < s.length(); right++) {
                while (right - left + 1 > length) {
                    left++;
                }
                if (s.substr(left, right - left + 1) == target) {
                    valid = true;
                    break;
                }
            }
            if (!valid) {
                return false;
            }
        }
        return true;
    }
};

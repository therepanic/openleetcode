class Solution {
public:
    int compress(vector<char>& chars) {
        int i = 0, j = 0;
        while (j < chars.size()) {
            char c = chars[j];
            int count = 0;
            while (j < chars.size() && chars[j] == c) {
                j++;
                count++;
            }
            chars[i++] = c;
            if (count > 1) {
                for (char ch : to_string(count)) {
                    chars[i++] = ch;
                }
            }
        }
        return i;
    }
};

class Solution {
public:
    string freqAlphabets(string s) {
        string decoded;
        int index = 0;
        while (index < s.length()) {
            if (index + 2 < s.length() && s[index + 2] == '#') {
                int num = stoi(s.substr(index, 2));
                decoded += ('a' + num - 1);
                index += 3;
            } else {
                int num = s[index] - '0';
                decoded += ('a' + num - 1);
                index += 1;
            }
        }
        return decoded;
    }
};

class Solution {
public:
    string getHappyString(int n, int k) {
        int total = 3 * (1 << (n - 1));
        if (k > total) {
            return "";
        }
        
        k -= 1;
        string result = "";
        char last = '\0';
        
        for (int pos = 0; pos < n; pos++) {
            int branch = 1 << (n - pos - 1);
            vector<char> choices;
            for (char c : {'a', 'b', 'c'}) {
                if (c != last) {
                    choices.push_back(c);
                }
            }
            
            int idx = k / branch;
            result += choices[idx];
            
            last = choices[idx];
            k %= branch;
        }
        
        return result;
    }
};

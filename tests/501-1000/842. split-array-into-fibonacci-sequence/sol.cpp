class Solution {
private:
    bool invalid(const string& x) {
        if (x[0] == '0' && x.length() > 1) return true;
        if (x.length() > 10) return true;
        return stoll(x) >= (1LL << 31);
    }
    
    vector<int> check(string a0, string a1, string num) {
        int i = 0;
        vector<int> ret = {stoi(a0), stoi(a1)};
        while (i < num.length()) {
            long long a0Val = stoll(a0);
            long long a1Val = stoll(a1);
            string res = to_string(a0Val + a1Val);
            int j = 0;
            while (i < num.length() && j < res.length() && res[j] == num[i]) {
                j++;
                i++;
            }
            if (j < res.length() || invalid(res)) return {};
            a0 = a1;
            a1 = res;
            ret.push_back(stoi(res));
        }
        return ret;
    }
    
public:
    vector<int> splitIntoFibonacci(string num) {
        int n = num.length();
        for (int j = 1; j < n - 1; j++) {
            for (int i = 0; i < j; i++) {
                string a0 = num.substr(0, i + 1);
                string a1 = num.substr(i + 1, j - i);
                if (invalid(a0) || invalid(a1)) continue;
                vector<int> ret = check(a0, a1, num.substr(j + 1));
                if (!ret.empty()) return ret;
            }
        }
        return {};
    }
};

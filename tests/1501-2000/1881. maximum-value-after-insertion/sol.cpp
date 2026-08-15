class Solution {
public:
    string maxValue(string n, int x) {
        string xs = to_string(x);
        if (n[0] != '-') {
            for (int i = 0; i < n.size(); i++) {
                if (xs[0] > n[i]) {
                    return n.substr(0, i) + xs + n.substr(i);
                }
            }
            return n + xs;
        } else {
            for (int i = 1; i < n.size(); i++) {
                if (xs[0] < n[i]) {
                    return n.substr(0, i) + xs + n.substr(i);
                }
            }
            return n + xs;
        }
    }
};

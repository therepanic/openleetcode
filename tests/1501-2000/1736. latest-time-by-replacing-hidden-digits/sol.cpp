class Solution {
public:
    string maximumTime(string time) {
        string ret = "";
        for (int i = 0; i < time.length(); i++) {
            char c = time[i];
            if (c == '?') {
                if (i == 0) {
                    if (time[i+1] == '?') {
                        ret += '2';
                    } else if (time[i+1] >= '0' && time[i+1] <= '3') {
                        ret += '2';
                    } else {
                        ret += '1';
                    }
                } else if (i == 1) {
                    if (time[i-1] == '?') {
                        ret += '3';
                    } else if (time[i-1] == '0' || time[i-1] == '1') {
                        ret += '9';
                    } else {
                        ret += '3';
                    }
                } else if (i == 3) {
                    ret += '5';
                } else if (i == 4) {
                    ret += '9';
                }
            } else {
                ret += c;
            }
        }
        return ret;
    }
};

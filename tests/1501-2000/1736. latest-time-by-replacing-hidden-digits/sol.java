class Solution {
    public String maximumTime(String time) {
        int len = time.length();
        StringBuilder ret = new StringBuilder();
        for (int i = 0; i < len; i++) {
            char c = time.charAt(i);
            if (c == '?') {
                if (i == 0) {
                    if (time.charAt(i+1) == '?') {
                        ret.append('2');
                    } else if (time.charAt(i+1) >= '0' && time.charAt(i+1) <= '3') {
                        ret.append('2');
                    } else {
                        ret.append('1');
                    }
                } else if (i == 1) {
                    if (time.charAt(i-1) == '?') {
                        ret.append('3');
                    } else if (time.charAt(i-1) == '0' || time.charAt(i-1) == '1') {
                        ret.append('9');
                    } else {
                        ret.append('3');
                    }
                } else if (i == 3) {
                    ret.append('5');
                } else if (i == 4) {
                    ret.append('9');
                }
            } else {
                ret.append(c);
            }
        }
        return ret.toString();
    }
}

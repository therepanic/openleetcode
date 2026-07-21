class Solution {
    public int minNumberOfFrogs(String croakOfFrogs) {
        int maxi = 0;
        int curr = 0;
        int c = 0, r = 0, o = 0, a = 0, k = 0;
        for (char ch : croakOfFrogs.toCharArray()) {
            if (ch == 'c') {
                c++;
                curr++;
            } else if (ch == 'r') {
                r++;
            } else if (ch == 'o') {
                o++;
            } else if (ch == 'a') {
                a++;
            } else if (ch == 'k') {
                k++;
                curr--;
            }
            maxi = Math.max(maxi, curr);
            if (c < r || r < o || o < a || a < k) {
                return -1;
            }
        }
        if (curr == 0 && c == r && r == o && o == a && a == k) {
            return maxi;
        } else {
            return -1;
        }
    }
}

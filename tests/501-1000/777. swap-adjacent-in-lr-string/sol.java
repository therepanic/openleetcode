class Solution {
    public boolean canTransform(String start, String result) {
        int n = start.length();
        int i = 0, j = 0;

        while (i < n || j < n) {
            while (i < n && start.charAt(i) == 'X') {
                i++;
            }
            while (j < n && result.charAt(j) == 'X') {
                j++;
            }

            if ((i == n) ^ (j == n)) {
                return false;
            }

            if (i < n && j < n) {
                if (start.charAt(i) != result.charAt(j)) {
                    return false;
                }
                if (start.charAt(i) == 'L' && j > i) {
                    return false;
                }
                if (start.charAt(i) == 'R' && j < i) {
                    return false;
                }
            }

            i++;
            j++;
        }

        return true;
    }
}

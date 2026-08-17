class Solution {
    public int maximumRemovals(String s, String p, int[] removable) {
        int left = 0, right = removable.length;
        int max_k = 0;
        while (left <= right) {
            int mid = (left + right) / 2;
            boolean[] removed = new boolean[s.length()];
            for (int i = 0; i < mid; ++i) {
                removed[removable[i]] = true;
            }
            int j = 0;
            for (int i = 0; i < s.length() && j < p.length(); ++i) {
                if (!removed[i] && s.charAt(i) == p.charAt(j)) {
                    ++j;
                }
            }
            if (j == p.length()) {
                max_k = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return max_k;
    }
}

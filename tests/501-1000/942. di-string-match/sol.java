class Solution {
    public int[] diStringMatch(String s) {
        int low = 0, high = s.length();
        int[] result = new int[s.length() + 1];
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == 'I') {
                result[i] = low++;
            } else {
                result[i] = high--;
            }
        }
        result[s.length()] = low;
        return result;
    }
}

class Solution {
    public List<List<Integer>> largeGroupPositions(String s) {
        List<List<Integer>> intervals = new ArrayList<>();
        int left = 0;
        while (left < s.length()) {
            int start = left;
            while (left + 1 < s.length() && s.charAt(left + 1) == s.charAt(left)) {
                left++;
            }
            if (left - start >= 2) {
                intervals.add(List.of(start, left));
            }
            left++;
        }
        return intervals;
    }
}

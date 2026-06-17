class Solution {
    public int maxEnvelopes(int[][] envelopes) {
        Arrays.sort(envelopes, (a, b) -> a[0] == b[0] ? b[1] - a[1] : a[0] - b[0]);
        ArrayList<Integer> result = new ArrayList<>();
        for (int[] envelope : envelopes) {
            int e = envelope[1];
            int idx = Collections.binarySearch(result, e);
            if (idx < 0) idx = -idx - 1;
            if (idx == result.size()) {
                result.add(e);
            } else {
                result.set(idx, e);
            }
        }
        return result.size();
    }
}

class Solution {
    public List<List<Long>> splitPainting(int[][] segments) {
        List<int[]> events = new ArrayList<>();
        for (int[] seg : segments) {
            events.add(new int[]{seg[0], seg[2]});
            events.add(new int[]{seg[1], -seg[2]});
        }
        events.sort((a, b) -> a[0] - b[0]);
        
        List<List<Long>> ans = new ArrayList<>();
        int prev = -1;
        long mix = 0;
        for (int[] e : events) {
            if (prev != -1) {
                if (e[0] != prev && mix != 0) {
                    ans.add(Arrays.asList((long)prev, (long)e[0], mix));
                }
            }
            prev = e[0];
            mix += e[1];
        }
        return ans;
    }
}

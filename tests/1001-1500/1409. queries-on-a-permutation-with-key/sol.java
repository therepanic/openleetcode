class Solution {
    public int[] processQueries(int[] queries, int m) {
        int[] ans = new int[queries.length];
        List<Integer> arr = new ArrayList<>();
        for (int i = 1; i <= m; i++) {
            arr.add(i);
        }
        for (int i = 0; i < queries.length; i++) {
            int x = queries[i];
            int idx = arr.indexOf(x);
            ans[i] = idx;
            arr.remove(idx);
            arr.add(0, x);
        }
        return ans;
    }
}

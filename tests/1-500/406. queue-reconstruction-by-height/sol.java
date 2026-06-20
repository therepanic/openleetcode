class Solution {
    public int[][] reconstructQueue(int[][] people) {
        java.util.Arrays.sort(people, (a, b) -> a[0] != b[0] ? b[0] - a[0] : a[1] - b[1]);
        java.util.List<int[]> q = new java.util.ArrayList<>();
        for (int[] p : people) {
            q.add(p[1], p);
        }
        return q.toArray(new int[people.length][]);
    }
}

public class Solution {
    public int MaxEvents(int[][] events) {
        Array.Sort(events, (a, b) => a[1] != b[1] ? a[1].CompareTo(b[1]) : a[0].CompareTo(b[0]));
        int maxDay = 0;
        foreach (var item in events) maxDay = Math.Max(maxDay, item[1]);
        int[] parent = new int[maxDay + 2];
        for (int day = 0; day < parent.Length; day++) parent[day] = day;
        Func<int, int> find = null;
        find = day => parent[day] == day ? day : parent[day] = find(parent[day]);
        int result = 0;
        foreach (var item in events) {
            int day = find(item[0]);
            if (day <= item[1]) { result++; parent[day] = find(day + 1); }
        }
        return result;
    }
}

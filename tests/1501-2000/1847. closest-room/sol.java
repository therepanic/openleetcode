import java.util.*;

class Solution {
    public int[] closestRoom(int[][] rooms, int[][] queries) {
        Arrays.sort(rooms, (a, b) -> Integer.compare(b[1], a[1]));

        Integer[] idx = new Integer[queries.length];
        for (int i = 0; i < queries.length; i++) idx[i] = i;
        Arrays.sort(idx, (a, b) -> Integer.compare(queries[b][1], queries[a][1]));

        TreeSet<Integer> active = new TreeSet<>();
        int[] result = new int[queries.length];
        Arrays.fill(result, -1);
        int roomPtr = 0;

        for (int qi : idx) {
            int preferred = queries[qi][0];
            int minimum = queries[qi][1];

            while (roomPtr < rooms.length && rooms[roomPtr][1] >= minimum) {
                active.add(rooms[roomPtr][0]);
                roomPtr++;
            }

            Integer pos = active.ceiling(preferred);
            Integer prev = active.floor(preferred);
            int[] candidates = new int[2];
            int count = 0;
            if (pos != null) candidates[count++] = pos;
            if (prev != null) candidates[count++] = prev;

            if (count > 0) {
                int best = candidates[0];
                for (int i = 1; i < count; i++) {
                    int id = candidates[i];
                    if (Math.abs(id - preferred) < Math.abs(best - preferred) ||
                        (Math.abs(id - preferred) == Math.abs(best - preferred) && id < best)) {
                        best = id;
                    }
                }
                result[qi] = best;
            }
        }
        return result;
    }
}

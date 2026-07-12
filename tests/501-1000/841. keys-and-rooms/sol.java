class Solution {
    public boolean canVisitAllRooms(List<List<Integer>> rooms) {
        int n = rooms.size();
        if (n == 0) {
            return true;
        }
        Deque<Integer> keys = new ArrayDeque<>();
        boolean[] visited = new boolean[n];
        keys.push(0);
        visited[0] = true;
        int count = 1;
        while (!keys.isEmpty()) {
            int room = keys.pop();
            for (int i : rooms.get(room)) {
                if (!visited[i]) {
                    visited[i] = true;
                    keys.push(i);
                    count++;
                }
            }
        }
        return count == n;
    }

    public boolean canVisitAllRooms(int[][] rooms) {
        List<List<Integer>> converted = new ArrayList<>(rooms.length);
        for (int[] room : rooms) {
            List<Integer> list = new ArrayList<>(room.length);
            for (int key : room) {
                list.add(key);
            }
            converted.add(list);
        }
        return canVisitAllRooms(converted);
    }
}

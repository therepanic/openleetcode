public class Solution {
    public bool CanVisitAllRooms(IList<IList<int>> rooms) {
        int n = rooms.Count;
        Stack<int> keys = new Stack<int>();
        bool[] visited = new bool[n];
        keys.Push(0);
        visited[0] = true;
        int count = 1;
        while (keys.Count > 0) {
            int room = keys.Pop();
            foreach (int i in rooms[room]) {
                if (!visited[i]) {
                    visited[i] = true;
                    keys.Push(i);
                    count++;
                }
            }
        }
        return count == n;
    }
}

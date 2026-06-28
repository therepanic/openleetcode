public class Solution {
    public int SlidingPuzzle(int[][] board) {
        string target = "123450";
        string start = "";
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 3; j++) {
                start += board[i][j].ToString();
            }
        }
        
        Dictionary<int, int[]> neighbors = new Dictionary<int, int[]>() {
            {0, new int[]{1, 3}}, {1, new int[]{0, 2, 4}}, {2, new int[]{1, 5}},
            {3, new int[]{0, 4}}, {4, new int[]{1, 3, 5}}, {5, new int[]{2, 4}}
        };
        
        Queue<(string, int)> queue = new Queue<(string, int)>();
        HashSet<string> visited = new HashSet<string>();
        
        queue.Enqueue((start, 0));
        visited.Add(start);
        
        while (queue.Count > 0) {
            var (state, moves) = queue.Dequeue();
            
            if (state == target) {
                return moves;
            }
            
            int zeroIndex = state.IndexOf('0');
            
            foreach (int neighbor in neighbors[zeroIndex]) {
                char[] newState = state.ToCharArray();
                char temp = newState[zeroIndex];
                newState[zeroIndex] = newState[neighbor];
                newState[neighbor] = temp;
                string newStateStr = new string(newState);
                
                if (!visited.Contains(newStateStr)) {
                    visited.Add(newStateStr);
                    queue.Enqueue((newStateStr, moves + 1));
                }
            }
        }
        
        return -1;
    }
}

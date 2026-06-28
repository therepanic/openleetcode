class Solution {
    public int slidingPuzzle(int[][] board) {
        String target = "123450";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 3; j++) {
                sb.append(board[i][j]);
            }
        }
        String start = sb.toString();
        
        int[][] neighbors = {
            {1, 3}, {0, 2, 4}, {1, 5},
            {0, 4}, {1, 3, 5}, {2, 4}
        };
        
        Queue<Pair<String, Integer>> queue = new LinkedList<>();
        Set<String> visited = new HashSet<>();
        queue.add(new Pair<>(start, 0));
        visited.add(start);
        
        while (!queue.isEmpty()) {
            Pair<String, Integer> current = queue.poll();
            String state = current.getKey();
            int moves = current.getValue();
            
            if (state.equals(target)) {
                return moves;
            }
            
            int zeroIndex = state.indexOf('0');
            
            for (int neighbor : neighbors[zeroIndex]) {
                char[] newState = state.toCharArray();
                char temp = newState[zeroIndex];
                newState[zeroIndex] = newState[neighbor];
                newState[neighbor] = temp;
                String newStateStr = new String(newState);
                
                if (!visited.contains(newStateStr)) {
                    visited.add(newStateStr);
                    queue.add(new Pair<>(newStateStr, moves + 1));
                }
            }
        }
        
        return -1;
    }
}

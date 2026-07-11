import java.util.*;

class Solution {
    public int catMouseGame(int[][] graph) {
        int MOUSE = 0;
        int CAT = 1;
        int MOUSE_WIN = 1;
        int CAT_WIN = 2;
        int DRAW = 0;
        
        int n = graph.length;
        Map<String, Integer> results = new HashMap<>();
        for (int i = 1; i < n; i++) {
            results.put(stateKey(0, i, CAT), MOUSE_WIN);
            results.put(stateKey(0, i, MOUSE), MOUSE_WIN);
            results.put(stateKey(i, i, CAT), CAT_WIN);
            results.put(stateKey(i, i, MOUSE), CAT_WIN);
        }
        
        Map<String, Integer> degree = new HashMap<>();
        for (int mouse = 1; mouse < n; mouse++) {
            for (int cat = 1; cat < n; cat++) {
                degree.put(stateKey(mouse, cat, MOUSE), graph[mouse].length);
                int catDegree = graph[cat].length;
                for (int next : graph[cat]) {
                    if (next == 0) {
                        catDegree--;
                        break;
                    }
                }
                degree.put(stateKey(mouse, cat, CAT), catDegree);
            }
        }
        
        Queue<String> q = new LinkedList<>(results.keySet());
        
        while (!q.isEmpty()) {
            String state = q.poll();
            String[] parts = state.split(",");
            int mouse = Integer.parseInt(parts[0]);
            int cat = Integer.parseInt(parts[1]);
            int turn = Integer.parseInt(parts[2]);
            int curResult = results.get(state);
            
            List<String> prevStates = new ArrayList<>();
            if (turn == MOUSE) {
                for (int prevCat : graph[cat]) {
                    prevStates.add(stateKey(mouse, prevCat, CAT));
                }
            } else {
                for (int prevMouse : graph[mouse]) {
                    prevStates.add(stateKey(prevMouse, cat, MOUSE));
                }
            }
            
            for (String prevState : prevStates) {
                if (results.containsKey(prevState)) continue;
                String[] prevParts = prevState.split(",");
                int prevMouse = Integer.parseInt(prevParts[0]);
                int prevCat = Integer.parseInt(prevParts[1]);
                int prevTurn = Integer.parseInt(prevParts[2]);
                if (prevCat == 0) continue;
                
                degree.put(prevState, degree.get(prevState) - 1);
                boolean isMoverWinner = ((curResult == MOUSE_WIN && prevTurn == MOUSE) ||
                                        (curResult == CAT_WIN && prevTurn == CAT));
                if (isMoverWinner || degree.get(prevState) == 0) {
                    results.put(prevState, curResult);
                    q.offer(prevState);
                }
            }
        }
        
        return results.getOrDefault(stateKey(1, 2, MOUSE), DRAW);
    }
    
    private String stateKey(int mouse, int cat, int turn) {
        return mouse + "," + cat + "," + turn;
    }
}

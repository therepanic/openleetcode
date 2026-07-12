using System;
using System.Collections.Generic;

public class Solution {
    public int CatMouseGame(int[][] graph) {
        int MOUSE = 0;
        int CAT = 1;
        int MOUSE_WIN = 1;
        int CAT_WIN = 2;
        int DRAW = 0;
        
        int n = graph.Length;
        Dictionary<string, int> results = new Dictionary<string, int>();
        for (int i = 1; i < n; i++) {
            results[$"0,{i},{CAT}"] = MOUSE_WIN;
            results[$"0,{i},{MOUSE}"] = MOUSE_WIN;
            results[$"{i},{i},{CAT}"] = CAT_WIN;
            results[$"{i},{i},{MOUSE}"] = CAT_WIN;
        }
        
        Dictionary<string, int> degree = new Dictionary<string, int>();
        for (int mouse = 1; mouse < n; mouse++) {
            for (int cat = 1; cat < n; cat++) {
                degree[$"{mouse},{cat},{MOUSE}"] = graph[mouse].Length;
                int catDeg = 0;
                foreach (int x in graph[cat]) {
                    if (x != 0) catDeg++;
                }
                degree[$"{mouse},{cat},{CAT}"] = catDeg;
            }
        }
        
        Queue<string> q = new Queue<string>();
        foreach (string key in results.Keys) {
            q.Enqueue(key);
        }
        
        while (q.Count > 0) {
            string state = q.Dequeue();
            string[] parts = state.Split(',');
            int mouse = int.Parse(parts[0]);
            int cat = int.Parse(parts[1]);
            int turn = int.Parse(parts[2]);
            int curResult = results[state];
            
            List<string> prevStates = new List<string>();
            if (turn == MOUSE) {
                foreach (int prevCat in graph[cat]) {
                    prevStates.Add($"{mouse},{prevCat},{CAT}");
                }
            } else {
                foreach (int prevMouse in graph[mouse]) {
                    prevStates.Add($"{prevMouse},{cat},{MOUSE}");
                }
            }
            
            foreach (string prevState in prevStates) {
                if (results.ContainsKey(prevState)) continue;
                string[] prevParts = prevState.Split(',');
                int prevMouse = int.Parse(prevParts[0]);
                int prevCat = int.Parse(prevParts[1]);
                int prevTurn = int.Parse(prevParts[2]);
                if (prevCat == 0) continue;
                
                degree[prevState]--;
                bool isMoverWinner = ((curResult == MOUSE_WIN && prevTurn == MOUSE) ||
                                      (curResult == CAT_WIN && prevTurn == CAT));
                if (isMoverWinner || degree[prevState] == 0) {
                    results[prevState] = curResult;
                    q.Enqueue(prevState);
                }
            }
        }
        
        return results.ContainsKey($"1,2,{MOUSE}") ? results[$"1,2,{MOUSE}"] : DRAW;
    }
}

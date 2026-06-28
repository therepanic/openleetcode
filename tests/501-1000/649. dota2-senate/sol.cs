public class Solution {
    public string PredictPartyVictory(string senate) {
        var r = new System.Collections.Generic.Queue<int>();
        var d = new System.Collections.Generic.Queue<int>();
        int n = senate.Length;
        
        for (int i = 0; i < n; i++) {
            if (senate[i] == 'R') {
                r.Enqueue(i);
            } else {
                d.Enqueue(i);
            }
        }
        
        while (r.Count > 0 && d.Count > 0) {
            int rIdx = r.Dequeue();
            int dIdx = d.Dequeue();
            
            if (rIdx < dIdx) {
                r.Enqueue(rIdx + n);
            } else {
                d.Enqueue(dIdx + n);
            }
        }
        
        return r.Count > 0 ? "Radiant" : "Dire";
    }
}

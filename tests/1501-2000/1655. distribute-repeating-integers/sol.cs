using System;
using System.Collections.Generic;
using System.Linq;

public class Solution {
    public bool CanDistribute(int[] nums, int[] quantity) {
        Array.Sort(quantity);
        Array.Reverse(quantity);
        var freqCounts = new Dictionary<int, int>();
        var freqMap = new Dictionary<int, int>();
        foreach (var n in nums) {
            if (freqMap.ContainsKey(n)) freqMap[n]++;
            else freqMap[n] = 1;
        }
        foreach (var f in freqMap.Values) {
            if (freqCounts.ContainsKey(f)) freqCounts[f]++;
            else freqCounts[f] = 1;
        }
        
        bool Backtrack(int i) {
            if (i == quantity.Length) return true;
            var keys = freqCounts.Keys.ToList();
            foreach (var freq in keys) {
                int count = freqCounts[freq];
                if (freq >= quantity[i] && count > 0) {
                    freqCounts[freq] = count - 1;
                    int newFreq = freq - quantity[i];
                    if (freqCounts.ContainsKey(newFreq)) freqCounts[newFreq]++;
                    else freqCounts[newFreq] = 1;
                    if (Backtrack(i + 1)) return true;
                    freqCounts[freq] = count;
                    int newCount = freqCounts[newFreq];
                    if (newCount == 1) freqCounts.Remove(newFreq);
                    else freqCounts[newFreq] = newCount - 1;
                }
            }
            return false;
        }
        
        return Backtrack(0);
    }
}

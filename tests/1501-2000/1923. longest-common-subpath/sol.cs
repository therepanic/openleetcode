using System;
using System.Collections.Generic;

public class Solution {
    public int LongestCommonSubpath(int n, int[][] paths) {
        List<int> combined = new List<int>();
        List<int> pathOrigin = new List<int>();
        for (int i = 0; i < paths.Length; i++) {
            foreach (int v in paths[i]) {
                combined.Add(v);
                pathOrigin.Add(i);
            }
            combined.Add(-(i+1));
            pathOrigin.Add(i);
        }
        int N = combined.Count;
        int M = paths.Length;
        int[] S = combined.ToArray();
        int[] P = pathOrigin.ToArray();

        int[] rank = new int[N];
        {
            int[] temp = (int[])S.Clone();
            Array.Sort(temp);
            for (int i = 0; i < N; i++) {
                rank[i] = Array.BinarySearch(temp, S[i]);
            }
        }

        int k = 1;
        while (k < N) {
            long[] keys = new long[N];
            for (int i = 0; i < N; i++) {
                long first = rank[i];
                long second = (i+k < N) ? rank[i+k] + 1L : 0L;
                keys[i] = (first << 32) | second;
            }
            long[] sorted = (long[])keys.Clone();
            Array.Sort(sorted);
            for (int i = 0; i < N; i++) {
                rank[i] = Array.BinarySearch(sorted, keys[i]);
            }
            if (k >= N) break;
            k *= 2;
        }

        int[] sa = new int[N];
        for (int i = 0; i < N; i++) {
            sa[rank[i]] = i;
        }

        int[] lcp = new int[N];
        int[] inv = (int[])rank.Clone();
        int h = 0;
        for (int i = 0; i < N; i++) {
            if (inv[i] > 0) {
                int j = sa[inv[i]-1];
                while (i+h < N && j+h < N && S[i+h] == S[j+h]) {
                    h++;
                }
                lcp[inv[i]] = h;
                if (h > 0) h--;
            }
        }

        int ans = 0;
        int left = 0;
        int[] count = new int[M];
        int distinct = 0;
        var minQ = new LinkedList<int>();
        for (int right = 0; right < N; right++) {
            int p = P[sa[right]];
            if (p >= 0) {
                if (count[p] == 0) distinct++;
                count[p]++;
            }
            while (minQ.Count > 0 && lcp[minQ.Last.Value] >= lcp[right]) {
                minQ.RemoveLast();
            }
            minQ.AddLast(right);

            while (distinct == M) {
                while (minQ.Count > 0 && minQ.First.Value <= left) {
                    minQ.RemoveFirst();
                }
                if (minQ.Count > 0) {
                    ans = Math.Max(ans, lcp[minQ.First.Value]);
                }
                int outIdx = P[sa[left]];
                if (outIdx >= 0) {
                    count[outIdx]--;
                    if (count[outIdx] == 0) distinct--;
                }
                left++;
            }
        }
        return ans;
    }
}

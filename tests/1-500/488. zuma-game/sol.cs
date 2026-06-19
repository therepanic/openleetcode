using System;
using System.Collections.Generic;

public class Solution {
    private string RemoveSame(string s, int i) {
        if (i < 0) return s;
        int left = i, right = i;
        while (left > 0 && s[left - 1] == s[i]) left--;
        while (right + 1 < s.Length && s[right + 1] == s[i]) right++;
        int length = right - left + 1;
        if (length >= 3) {
            string newS = s.Substring(0, left) + s.Substring(right + 1);
            return RemoveSame(newS, left - 1);
        }
        return s;
    }

    public int FindMinStep(string board, string hand) {
        char[] handArr = hand.ToCharArray();
        Array.Sort(handArr);
        hand = new string(handArr);

        Queue<(string board, string hand, int step)> q = new Queue<(string, string, int)>();
        HashSet<string> visited = new HashSet<string>();
        q.Enqueue((board, hand, 0));
        visited.Add(board + "#" + hand);

        while (q.Count > 0) {
            var (currBoard, currHand, step) = q.Dequeue();
            
            for (int i = 0; i <= currBoard.Length; i++) {
                for (int j = 0; j < currHand.Length; j++) {
                    if (j > 0 && currHand[j] == currHand[j - 1]) continue;
                    if (i > 0 && currBoard[i - 1] == currHand[j]) continue;

                    bool pick = false;
                    if (i < currBoard.Length && currBoard[i] == currHand[j]) pick = true;
                    if (i > 0 && i < currBoard.Length &&
                        currBoard[i - 1] == currBoard[i] &&
                        currBoard[i] != currHand[j]) pick = true;

                    if (pick) {
                        string newBoard = RemoveSame(
                            currBoard.Substring(0, i) + currHand[j] + currBoard.Substring(i), i
                        );
                        string newHand = currHand.Substring(0, j) + currHand.Substring(j + 1);
                        if (newBoard == "") return step + 1;
                        string key = newBoard + "#" + newHand;
                        if (!visited.Contains(key)) {
                            visited.Add(key);
                            q.Enqueue((newBoard, newHand, step + 1));
                        }
                    }
                }
            }
        }
        return -1;
    }
}

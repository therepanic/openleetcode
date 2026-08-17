public class Solution {
    public int MinTimeToType(string word) {
        int answer = 0;
        char pointer = 'a';
        
        foreach (char c in word) {
            int clockwise = Math.Abs(c - pointer);
            int counterclockwise = 26 - clockwise;
            answer += Math.Min(clockwise, counterclockwise) + 1;
            pointer = c;
        }
        
        return answer;
    }
}

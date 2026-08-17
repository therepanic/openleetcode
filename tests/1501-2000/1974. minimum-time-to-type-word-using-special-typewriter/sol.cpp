class Solution {
public:
    int minTimeToType(string word) {
        int answer = 0;
        char pointer = 'a';
        
        for (char c : word) {
            int clockwise = abs(c - pointer);
            int counterclockwise = 26 - clockwise;
            answer += min(clockwise, counterclockwise) + 1;
            pointer = c;
        }
        
        return answer;
    }
};

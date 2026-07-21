class Solution {
public:
    int maxNumberOfFamilies(int n, vector<vector<int>>& reservedSeats) {
        unordered_map<int, unordered_set<int>> rowSeats;
        
        for (auto& reservation : reservedSeats) {
            int row = reservation[0];
            int seat = reservation[1];
            rowSeats[row].insert(seat);
        }
        
        int ans = (n - rowSeats.size()) * 2;
        
        unordered_set<int> option1 = {2, 3, 4, 5};
        unordered_set<int> option2 = {6, 7, 8, 9};
        unordered_set<int> option3 = {4, 5, 6, 7};
        
        for (auto& [row, seats] : rowSeats) {
            int available = 0;
            
            bool disjoint1 = true;
            for (int s : option1) {
                if (seats.count(s)) {
                    disjoint1 = false;
                    break;
                }
            }
            if (disjoint1) available++;
            
            bool disjoint2 = true;
            for (int s : option2) {
                if (seats.count(s)) {
                    disjoint2 = false;
                    break;
                }
            }
            if (disjoint2) available++;
            
            bool disjoint3 = true;
            for (int s : option3) {
                if (seats.count(s)) {
                    disjoint3 = false;
                    break;
                }
            }
            if (disjoint3) available = max(available, 1);
            
            ans += available;
        }
        
        return ans;
    }
};

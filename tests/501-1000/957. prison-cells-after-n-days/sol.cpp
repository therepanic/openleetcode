class Solution {
public:
    vector<int> prisonAfterNDays(vector<int>& cells, int n) {
        n = (n - 1) % 14 + 1;
        for (int day = 0; day < n; day++) {
            int prev = cells[0];
            for (int i = 1; i < cells.size() - 1; i++) {
                int current = cells[i];
                if (prev == cells[i + 1]) {
                    cells[i] = 1;
                } else {
                    cells[i] = 0;
                }
                prev = current;
            }
            cells[0] = 0;
            cells[cells.size() - 1] = 0;
        }
        return cells;
    }
};

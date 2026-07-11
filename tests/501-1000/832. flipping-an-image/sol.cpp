class Solution {
public:
    vector<vector<int>> flipAndInvertImage(vector<vector<int>>& image) {
        for (auto& row : image) {
            int left = 0, right = row.size() - 1;
            while (left <= right) {
                int temp = 1 - row[right];
                row[right] = 1 - row[left];
                row[left] = temp;
                left++;
                right--;
            }
        }
        return image;
    }
};

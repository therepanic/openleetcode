class Solution {
public:
    vector<vector<int>> floodFill(vector<vector<int>>& image, int sr, int sc, int color) {
        int old = image[sr][sc];
        if (old == color) return image;
        int m = image.size();
        int n = image[0].size();
        function<void(int, int)> dfs = [&](int i, int j) {
            if (i < 0 || i >= m || j < 0 || j >= n || image[i][j] != old) return;
            image[i][j] = color;
            dfs(i + 1, j);
            dfs(i - 1, j);
            dfs(i, j + 1);
            dfs(i, j - 1);
        };
        dfs(sr, sc);
        return image;
    }
};

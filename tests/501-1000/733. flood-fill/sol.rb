# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}
def flood_fill(image, sr, sc, color)
    old = image[sr][sc]
    return image if old == color
    m = image.length
    n = image[0].length
    dfs = lambda do |i, j|
        return if i < 0 || i >= m || j < 0 || j >= n || image[i][j] != old
        image[i][j] = color
        dfs.call(i + 1, j)
        dfs.call(i - 1, j)
        dfs.call(i, j + 1)
        dfs.call(i, j - 1)
    end
    dfs.call(sr, sc)
    image
end

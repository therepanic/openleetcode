# @param {Integer[][]} img
# @return {Integer[][]}
def image_smoother(img)
    m = img.length
    n = img[0].length
    p = Array.new(m + 1) { Array.new(n + 1, 0) }
    (1..m).each do |i|
        (1..n).each do |j|
            p[i][j] = img[i-1][j-1] + p[i-1][j] + p[i][j-1] - p[i-1][j-1]
        end
    end
    res = Array.new(m) { Array.new(n, 0) }
    (0...m).each do |i|
        (0...n).each do |j|
            a = [0, i - 1].max
            b = [0, j - 1].max
            c = [m - 1, i + 1].min
            d = [n - 1, j + 1].min
            s = p[c+1][d+1] - p[a][d+1] - p[c+1][b] + p[a][b]
            res[i][j] = s / ((c - a + 1) * (d - b + 1))
        end
    end
    res
end

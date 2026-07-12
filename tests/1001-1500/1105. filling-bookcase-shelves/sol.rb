# @param {Integer[][]} books
# @param {Integer} shelf_width
# @return {Integer}
def min_height_shelves(books, shelf_width)
    n = books.length
    dp = Array.new(n + 1, Float::INFINITY)
    dp[0] = 0
    
    (1..n).each do |i|
        dp[i] = dp[i - 1] + books[i - 1][1]
        height = 0
        width = 0
        (i - 1).downto(0) do |j|
            height = [books[j][1], height].max
            width += books[j][0]
            break if width > shelf_width
            dp[i] = [dp[i], dp[j] + height].min
        end
    end
    
    dp[n]
end

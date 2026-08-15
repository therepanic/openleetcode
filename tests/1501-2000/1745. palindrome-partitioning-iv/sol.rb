# @param {String} s
# @return {Boolean}
def check_partitioning(s)
    n = s.length
    pal = Array.new(n) { Array.new(n, false) }
    (0...n).each { |i| pal[i][i] = true }
    (2..n).each do |length|
        (0..n-length).each do |i|
            j = i+length-1
            if s[i] == s[j] && (length == 2 || pal[i+1][j-1])
                pal[i][j] = true
            end
        end
    end
    (0...n-2).each do |i|
        if pal[0][i]
            (i+1...n-1).each do |j|
                return true if pal[i+1][j] && pal[j+1][n-1]
            end
        end
    end
    false
end

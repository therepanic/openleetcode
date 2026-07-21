# @param {Integer} n
# @param {Integer[]} roll_max
# @return {Integer}
def die_simulator(n, roll_max)
    mod = 10**9 + 7
    faces = 6

    f = Array.new(n) { Array.new(faces, 0) }
    s = Array.new(n, 0)

    faces.times { |j| f[0][j] = 1 }
    s[0] = faces

    (1...n).each do |i|
        faces.times do |j|
            max_repeat = roll_max[j]
            res = s[i - 1]

            if i > max_repeat
                res -= s[i - max_repeat - 1] - f[i - max_repeat - 1][j]
            elsif i == max_repeat
                res -= 1
            end

            f[i][j] = res % mod
        end
        s[i] = f[i].sum % mod
    end

    s[n - 1]
end

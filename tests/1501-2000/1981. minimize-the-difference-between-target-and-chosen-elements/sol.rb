# @param {Integer[][]} mat
# @param {Integer} target
# @return {Integer}
def minimize_the_difference(mat, target)
    mat.each { |row| row.sort! }
    dp = {}
    mini = [Float::INFINITY]
    
    func = lambda do |i, ans|
        if i < 0
            mini[0] = [mini[0], (ans).abs].min
            return (ans).abs
        end
        key = [i, ans]
        return dp[key] if dp.key?(key)
        if ans < 0 && (ans).abs > mini[0]
            return Float::INFINITY
        end
        take = Float::INFINITY
        mat[i].each_with_index do |val, z|
            next if z > 0 && mat[i][z] == mat[i][z-1]
            take = [take, func.call(i-1, ans - val)].min
            break if take == 0
        end
        dp[key] = take
        take
    end
    
    func.call(mat.length - 1, target)
end

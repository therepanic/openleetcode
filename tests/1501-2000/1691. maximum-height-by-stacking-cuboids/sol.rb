# @param {Integer[][]} cuboids
# @return {Integer}
def max_height(cuboids)
    cuboids.each { |c| c.sort! }
    cuboids.sort!
    n = cuboids.length
    dp = Array.new(n, 0)
    (0...n).each do |i|
      dp[i] = cuboids[i][2]
      (0...i).each do |j|
        if cuboids[j][0] <= cuboids[i][0] && cuboids[j][1] <= cuboids[i][1] && cuboids[j][2] <= cuboids[i][2]
          dp[i] = [dp[i], dp[j] + cuboids[i][2]].max
        end
      end
    end
    dp.max
end

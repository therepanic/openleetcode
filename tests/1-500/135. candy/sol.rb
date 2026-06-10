def candy(ratings)
  candies = Array.new(ratings.length, 1)
  (1...ratings.length).each { |i| candies[i] = candies[i - 1] + 1 if ratings[i] > ratings[i - 1] }
  (ratings.length - 2).downto(0) { |i| candies[i] = [candies[i], candies[i + 1] + 1].max if ratings[i] > ratings[i + 1] }
  candies.sum
end

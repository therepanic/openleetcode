function candy(ratings: number[]): number {
  const candies = Array(ratings.length).fill(1);
  for (let i = 1; i < ratings.length; i++)
    if (ratings[i] > ratings[i - 1]) candies[i] = candies[i - 1] + 1;
  for (let i = ratings.length - 2; i >= 0; i--)
    if (ratings[i] > ratings[i + 1])
      candies[i] = Math.max(candies[i], candies[i + 1] + 1);
  return candies.reduce((sum, value) => sum + value, 0);
}

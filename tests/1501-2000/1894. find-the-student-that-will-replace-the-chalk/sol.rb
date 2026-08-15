# @param {Integer[]} chalk
# @param {Integer} k
# @return {Integer}
def chalk_replacer(chalk, k)
    total = chalk.sum
    k %= total
    chalk.each_with_index do |amount, i|
        return i if k < amount
        k -= amount
    end
end

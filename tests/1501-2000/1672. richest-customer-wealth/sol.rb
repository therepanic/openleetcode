# @param {Integer[][]} accounts
# @return {Integer}
def maximum_wealth(accounts)
    rich = 0
    accounts.each do |i|
        rich = [rich, i.sum].max
    end
    rich
end

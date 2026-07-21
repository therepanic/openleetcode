# @param {String[]} transactions
# @return {String[]}
def invalid_transactions(transactions)
    user_txns = {}
    invalids = []

    transactions.each do |txn|
        vals = txn.split(",")
        user_txns[vals[0]] ||= []
        user_txns[vals[0]] << vals
    end

    user_txns.each do |user, txns|
        txns.sort_by! { |x| x[1].to_i }
        cities = {}
        l = 0
        invalid_txn_within_window = Set.new

        txns.each_with_index do |txn, r|
            cities[txn[3]] ||= 0
            cities[txn[3]] += 1
            while l < r && txns[r][1].to_i - txns[l][1].to_i > 60
                cities[txns[l][3]] -= 1
                if cities[txns[l][3]] == 0
                    cities.delete(txns[l][3])
                end
                if invalid_txn_within_window.include?(l)
                    invalid_txn_within_window.delete(l)
                end
                l += 1
            end

            if txns[r][2].to_i > 1000
                invalids << txns[r].join(",")
            end
            if cities.length > 1
                (l..r).each do |i|
                    if txns[i][2].to_i <= 1000 && !invalid_txn_within_window.include?(i)
                        invalids << txns[i].join(",")
                        invalid_txn_within_window.add(i)
                    end
                end
            end
        end
    end

    invalids
end

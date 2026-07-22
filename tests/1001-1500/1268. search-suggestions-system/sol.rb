# @param {String[]} products
# @param {String} search_word
# @return {String[][]}
def suggested_products(products, search_word)
    products.sort!
    root = {}
    
    # Insert each product into the Trie and store top 3 suggestions
    products.each do |product|
        node = root
        product.each_char do |ch|
            if !node.key?(ch)
                node[ch] = [{}, []]
            end
            if node[ch][1].length < 3
                node[ch][1] << product
            end
            node = node[ch][0]
        end
    end
    
    # Search each character of searchWord in the Trie
    result = []
    node = root
    search_word.each_char do |ch|
        if node && node.key?(ch)
            result << node[ch][1]
            node = node[ch][0]
        else
            node = nil
            result << []
        end
    end
    
    result
end

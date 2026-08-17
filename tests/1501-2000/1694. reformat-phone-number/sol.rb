# @param {String} number
# @return {String}
def reformat_number(number)
    phone_cleared = number.gsub(/\D/, '')
    phone_result = []
    
    while phone_cleared.length > 4
        phone_result << phone_cleared[0...3]
        phone_cleared = phone_cleared[3..-1] || ''
    end
    
    if phone_cleared.length == 4
        phone_result << phone_cleared[0...2]
        phone_result << phone_cleared[2..-1]
    elsif !phone_cleared.empty?
        phone_result << phone_cleared
    end
    
    phone_result.join('-')
end

# @param {String} text
# @return {String}
def entity_parser(text)
    entities = {
        "&quot" => '"',
        "&apos" => "'",
        "&amp" => "&",
        "&gt" => ">",
        "&lt" => "<",
        "&frasl" => "/"
    }
    
    text.gsub(/&[^;&\s]+;/) do |match|
        entity = match[0...-1]
        entities.fetch(entity, match)
    end
end

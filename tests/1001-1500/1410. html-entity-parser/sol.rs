impl Solution {
    pub fn entity_parser(text: String) -> String {
        use std::collections::HashMap;
        
        let mut entities = HashMap::new();
        entities.insert("&quot", "\"");
        entities.insert("&apos", "'");
        entities.insert("&amp", "&");
        entities.insert("&gt", ">");
        entities.insert("&lt", "<");
        entities.insert("&frasl", "/");
        
        let bytes = text.as_bytes();
        let mut result = String::new();
        let mut i = 0;
        while i < bytes.len() {
            if bytes[i] != b'&' {
                result.push(bytes[i] as char);
                i += 1;
                continue;
            }

            let mut end = i + 1;
            while end < bytes.len()
                && bytes[end] != b';'
                && bytes[end] != b'&'
                && !bytes[end].is_ascii_whitespace()
            {
                end += 1;
            }
            if end < bytes.len() && bytes[end] == b';' {
                let entity = &text[i..end];
                if let Some(replacement) = entities.get(entity) {
                    result.push_str(replacement);
                } else {
                    result.push_str(&text[i..=end]);
                }
                i = end + 1;
            } else {
                result.push('&');
                i += 1;
            }
        }
        let mut escaped = String::with_capacity(result.len());
        for ch in result.chars() {
            match ch {
                '"' => escaped.push_str("\\\""),
                '\\' => escaped.push_str("\\\\"),
                '\n' => escaped.push_str("\\n"),
                '\r' => escaped.push_str("\\r"),
                '\t' => escaped.push_str("\\t"),
                '\u{08}' => escaped.push_str("\\b"),
                '\u{0c}' => escaped.push_str("\\f"),
                ch if ch < '\u{20}' => {
                    escaped.push_str(&format!("\\u{:04x}", ch as u32));
                }
                ch => escaped.push(ch),
            }
        }
        escaped
    }
}

class Solution {
    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        var exactWords = Set(wordlist)
        var caseInsensitive = [String: String]()
        var vowelInsensitive = [String: String]()
        
        // Function to replace vowels with '*'
        func devowel(_ word: String) -> String {
            let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
            return String(word.map { vowels.contains($0) ? "*" : $0 })
        }
        
        // Preprocess wordlist
        for word in wordlist {
            let lower = word.lowercased()
            if caseInsensitive[lower] == nil {
                caseInsensitive[lower] = word
            }
            
            let devoweled = devowel(lower)
            if vowelInsensitive[devoweled] == nil {
                vowelInsensitive[devoweled] = word
            }
        }
        
        var result = [String]()
        
        for query in queries {
            if exactWords.contains(query) {
                result.append(query)
            } else if let match = caseInsensitive[query.lowercased()] {
                result.append(match)
            } else if let match = vowelInsensitive[devowel(query.lowercased())] {
                result.append(match)
            } else {
                result.append("")
            }
        }
        
        return result
    }
}

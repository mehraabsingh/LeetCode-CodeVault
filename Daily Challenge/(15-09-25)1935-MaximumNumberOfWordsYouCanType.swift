class Solution {
    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        let brokenSet = Set(brokenLetters)
        let words = text.split(separator: " ")
        var count = 0

        for word in words {
            var canType = true
            for ch in word {
                if brokenSet.contains(ch) {
                    canType = false
                    break
                }
            }
            if canType {
                count += 1
            }
        }
        return count
    }
}

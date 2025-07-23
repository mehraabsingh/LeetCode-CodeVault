class Solution {
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        // Helper function to remove a specific pair
        func removePair(_ s: [Character], _ first: Character, _ second: Character, _ score: Int) -> (Int, [Character]) {
            var stack: [Character] = []
            var total = 0
            for char in s {
                if let last = stack.last, last == first && char == second {
                    stack.removeLast()
                    total += score
                } else {
                    stack.append(char)
                }
            }
            return (total, stack)
        }
        
        var chars = Array(s)
        var totalScore = 0
        
        if x >= y {
            // Remove "ab" first, then "ba"
            let (score1, remaining1) = removePair(chars, "a", "b", x)
            let (score2, _) = removePair(remaining1, "b", "a", y)
            totalScore = score1 + score2
        } else {
            // Remove "ba" first, then "ab"
            let (score1, remaining1) = removePair(chars, "b", "a", y)
            let (score2, _) = removePair(remaining1, "a", "b", x)
            totalScore = score1 + score2
        }
        
        return totalScore
    }
}

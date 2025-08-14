class Solution {
    func largestGoodInteger(_ num: String) -> String {
        let chars = Array(num)
        var maxGood = ""

        for i in 0..<(chars.count - 2) {
            // Extract 3-character substring
            let substring = String(chars[i...i+2])

            // Check if all three characters are the same
            if substring.allSatisfy({ $0 == chars[i] }) {
                if substring > maxGood {
                    maxGood = substring
                }
            }
        }

        return maxGood
    }
}

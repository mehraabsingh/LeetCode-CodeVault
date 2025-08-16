class Solution {
    func maximum69Number (_ num: Int) -> Int {
        // Convert the number to a string array of characters
        var chars = Array(String(num))
        
        // Find the first '6' and change it to '9'
        for i in 0..<chars.count {
            if chars[i] == "6" {
                chars[i] = "9"
                break   // change only the first one
            }
        }
        
        // Convert back to Int
        return Int(String(chars))!
    }
}

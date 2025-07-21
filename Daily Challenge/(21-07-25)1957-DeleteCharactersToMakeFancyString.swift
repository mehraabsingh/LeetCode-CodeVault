class Solution {
    func makeFancyString(_ s: String) -> String {
        var result: [Character] = []
        
        for char in s {
            let count = result.count
            if count >= 2 && result[count - 1] == char && result[count - 2] == char {
                continue  // skip this char
            }
            result.append(char)
        }
        
        return String(result)
    }
}

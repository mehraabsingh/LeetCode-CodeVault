class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        // Split both versions into revisions
        let v1Parts = version1.split(separator: ".").map { Int($0)! }
        let v2Parts = version2.split(separator: ".").map { Int($0)! }
        
        // Get the maximum length
        let maxLength = max(v1Parts.count, v2Parts.count)
        
        for i in 0..<maxLength {
            let num1 = i < v1Parts.count ? v1Parts[i] : 0
            let num2 = i < v2Parts.count ? v2Parts[i] : 0
            
            if num1 < num2 {
                return -1
            } else if num1 > num2 {
                return 1
            }
        }
        
        return 0
    }
}

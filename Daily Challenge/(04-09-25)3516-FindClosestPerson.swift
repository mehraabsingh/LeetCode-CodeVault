class Solution {
    func findClosest(_ x: Int, _ y: Int, _ z: Int) -> Int {
        let d1 = abs(x - z)
        let d2 = abs(y - z)
        
        if d1 < d2 {
            return 1
        } else if d2 < d1 {
            return 2
        } else {
            return 0
        }
    }
}

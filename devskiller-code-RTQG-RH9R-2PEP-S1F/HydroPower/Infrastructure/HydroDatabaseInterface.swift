
import Foundation

class HydroDatabaseInterface {
    
    private static var turbines: [Turbine] = []
    
    static func saveTurbinData(turbinData: Turbine) {
        turbines.append(turbinData)
    }
    
    static func getTurbin(index: Int) -> Turbine {
        if (turbines.isEmpty) {
            return Turbine(name: "", location: "", efficiency: 0)
        }
        
        return turbines[index]
    }
    
    static func turbinesCount() -> Int {
        return turbines.count
    }
    
    static func getTurbines() -> [Turbine] {
        return turbines
    }
    
    static func clear() {
        turbines.removeAll()
    }
}

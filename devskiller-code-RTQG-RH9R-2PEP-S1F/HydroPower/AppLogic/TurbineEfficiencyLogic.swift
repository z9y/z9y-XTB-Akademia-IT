
import Foundation

class TurbineEfficiencyLogic {
    
    /*
        Your product should inform a user which turbines are
        less efficient that others. In order to do that you
        need implement function findLowEfficienctTurbins.
     
        This function should return turbines whose capacity
        is below or equal to the efficiency treshold.
     */
    func findLowEfficienctTurbins(efficiencyTreshold: Double, turbines: [Turbine]) -> [Turbine] {
        var lowEfficientTurbines = [Turbine]()
        
        for turbine in turbines {
            if turbine.efficiency <= efficiencyTreshold {
                lowEfficientTurbines.append(turbine)
            }
        }
        
        return lowEfficientTurbines
    }
    
    /*
        Try to fix that function. We need turbine efficiency value
        in hours not minutes(as stated in the file with turbines data).
        Function should return turbine efficiency in String like this: "x,00 / h"
        where x is turbine efficiency in hours. You need to be precise to two decimal places.
     */
    func convertTurbineEfficiency(turbineData: Turbine) -> String {
        let minutes = turbineData.efficiency / 60
        
        return "\(String(format: "%.2f", minutes)) / h"
    }
    
    /*
        CategorizeTurbine function should return proper color when
        turbine efficiency is in specific range:
     
         x < 100           -> red color
         x < 200 and x >= 100 -> orange color
         x >= 200 and x < 500 -> green color
         x >= 500           -> red color
     
        x - turbine efficiency value
     */
    func categorizeTurbine(turbineData: Turbine) -> EfficiencyColor {
        switch turbineData.efficiency {
        case ..<100:
            return EfficiencyColor.Red
        case 100..<200:
            return EfficiencyColor.Orange
        case 200..<500:
            return EfficiencyColor.Green
        default:
            return EfficiencyColor.Red
        }
    }
}

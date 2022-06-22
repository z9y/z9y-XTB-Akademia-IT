# Introduction

You work in a company whose products (software) are used and help in the maintenance of hydroelectric power plants. Recently you and your team have been creating a new version of your flagship HydroPower2.0 product. It is mainly used to monitor the performance of water turbines.

# Task details

1) To complete the task, you must load a list of turbines, which is divided into sections. In the **turbines-data.csv** file you will find all the data (turbine name, section, performance) that must be imported. Use the saveTurbinData function from the HydroDatabaseInterface class to save the data. Function that should be implemented can be found in file **FetchTurbinData**.

2) Implement findLowEfficienctTurbins in the **TurbineEfficiencyLogic** file. The purpose of this function is to provide information on the least efficient turbines. The efficiencyTreshold parameter specifies 
the efficiency value below which the turbine is less efficient.

3) To show the correct turbine performance, you should repair the **convertTurbineEfficiency** method. The result must return efficiency per hour. The function should return the string as such: **"x,00 / h"**, where x - is the value of yield per hour, with precision to two decimal places.

4) Implement the **categorizeTurbine** function. It should return the appropriate colour from the EfficiencyColor type. When the performance of the turbine is in the range:
    - x < 100              -> red color
    - x < 200 and x >= 100 -> orange color
    - x >= 200 and x < 500 -> green color
    - x >= 500             -> red color

# Hints
- Xcode version: 9 or later, Swift: 4.
- First you should take care of the first task (loading turbine data from the file). 
- Turbine performance in the turbines-data.csv file is given within minutes.

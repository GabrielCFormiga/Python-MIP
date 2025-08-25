\Problem name: 

Minimize
OBJROW: 10 x_0_0 + 8 x_0_1 + 13 x_0_2 + 7 x_1_0 + 9 x_1_1 + 16 x_1_2 + 6.50000 x_2_0 + 10.80000 x_2_1 + 12.60000 x_2_2 + 50000 y_0
 + 40000 y_1 + 30000 y_2
Subject To
mine_capacity_0:  x_0_0 + x_1_0 + x_2_0 -11500 y_0 <= -0
mine_capacity_1:  x_0_1 + x_1_1 + x_2_1 -16500 y_1 <= -0
mine_capacity_2:  x_0_2 + x_1_2 + x_2_2 -13000 y_2 <= -0
plant_demand_0:  x_0_0 + x_0_1 + x_0_2 >= 12300
plant_demand_1:  x_1_0 + x_1_1 + x_1_2 >= 15400
plant_demand_2:  x_2_0 + x_2_1 + x_2_2 >= 13300
Bounds
 0 <= y_0 <= 1
 0 <= y_1 <= 1
 0 <= y_2 <= 1
Integers
y_0 y_1 y_2 
End

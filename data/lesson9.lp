\Problem name: Agricultural Production

Minimize
OBJROW: -400 x_0_0 -400 x_0_1 -400 x_0_2 -300 x_1_0 -300 x_1_1 -300 x_1_2 -100 x_2_0 -100 x_2_1 -100 x_2_2
Subject To
total_area_constraint_0:  x_0_0 + x_1_0 + x_2_0 <= 400
total_area_constraint_1:  x_0_1 + x_1_1 + x_2_1 <= 600
total_area_constraint_2:  x_0_2 + x_1_2 + x_2_2 <= 300
max_area_constraint_0:  x_0_0 + x_0_1 + x_0_2 <= 600
max_area_constraint_1:  x_1_0 + x_1_1 + x_1_2 <= 500
max_area_constraint_2:  x_2_0 + x_2_1 + x_2_2 <= 325
water_constraint_0:  3 x_0_0 + 2 x_1_0 + x_2_0 <= 600
water_constraint_1:  3 x_0_1 + 2 x_1_1 + x_2_1 <= 800
water_constraint_2:  3 x_0_2 + 2 x_1_2 + x_2_2 <= 375
Bounds
 0 <= x_0_0 <= 600
 0 <= x_0_1 <= 600
 0 <= x_0_2 <= 600
 0 <= x_1_0 <= 500
 0 <= x_1_1 <= 500
 0 <= x_1_2 <= 500
 0 <= x_2_0 <= 325
 0 <= x_2_1 <= 325
 0 <= x_2_2 <= 325
End

from mip import *
import math

def solve(model):
    model.verbose = 0
    status = model.optimize()

    # print("Status = ", status)
    # print(f"Solution value  = {model.objective_value}\n")

    # print("Solution:")
    # for v in model.vars:
    #   if v.x > 0.00001 and v.name.find("x")!=-1:
    #     print(v.name, " = ", v.x)

def save(model, filename):
    model.write(filename) 
    with open(filename, "r") as f: 
        print(f.read())

instance = input("Instance: ")
path = "../data/instances/" + instance

num_variables = 0
num_constraints = 0
coefficients = []
constraints = []

# %% Read the instance
with open(path, 'r') as f:
  line = f.readline().strip()
  num_variables, num_constraints = map(int, line.split())

  line = f.readline().strip()
  coefficients = list(map(int, line.split()))

  while True:
      line = f.readline().strip()
      if not line:
          break
      constraint = list(map(int, line.split()))
      constraints.append(constraint)

# %% Create initial model
model = Model(name="Branch_and_Bound", sense=MAXIMIZE, solver_name=CBC)

# variables
x = [model.add_var(name=f"x_{i}", var_type=CONTINUOUS, lb=0, ub=1) for i in range(num_variables)]

# Objective function
model.objective = xsum(coefficients[i] * x[i] for i in range(num_variables))

# Constraints
for i in range(num_constraints):
  model.add_constr(name=f"constraint_{i}", lin_expr=xsum(constraints[i][j] * x[j] for j in range(num_variables)) <= constraints[i][-1])

# save(model, "../data/B&B.lp")
# %%  Branch and Bound

ans = -1

def branch_and_bound(model):
  global ans
  # print(ans)
  solve(model)

  if (model.status == OptimizationStatus.INFEASIBLE or model.objective_value <= ans):
    return

  # for v in model.vars:
  #   print(v.name, " = ", v.x)

  # if is integer objective_value
  if (model.status == OptimizationStatus.OPTIMAL and all(v.x == math.floor(v.x) for v in model.vars)):
    ans = model.objective_value
    return

  # else, lets branch
  var = model.vars[0]
  for v in model.vars:
      if v.x > 0 and v.x < 1:
        var = v
        break

  model1 = model.copy()
  model1.add_constr(name="branch", lin_expr=var <= 0)
  # save(model1, "../data/B&B.lp")
  # exit()
  branch_and_bound(model1)

  model2 = model.copy()
  model2.add_constr(name="branch", lin_expr=var >= 1)
  branch_and_bound(model2)

branch_and_bound(model)
print(ans)
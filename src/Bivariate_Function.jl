using Optim
using GR
using Plots

gr()

f(x) =  (1.0 - x[1])^2 + 100.0 * (x[2] - x[1]^2)^2

start = [-5.0,4.0]
iter = 80

GD_res = optimize(f, start, GradientDescent(),
               Optim.Options(g_tol = 1e-40,
                             iterations = iter,
                             store_trace = true,
                             extended_trace = true,
                             show_trace = false))

CGD_res = optimize(f, start, ConjugateGradient(),
               Optim.Options(g_tol = 1e-40,
                             iterations = iter,
                             store_trace = true,
                             extended_trace = true,
                             show_trace = false))

SA_res = optimize(f, start, SimulatedAnnealing(),
               Optim.Options(g_tol = 1e-40,
                             iterations = iter,
                             store_trace = true,
                             extended_trace = true,
                             show_trace = false))

l = iter + 1

GD_trace = Array{Float64}(undef, l, 2)
CGD_trace = Array{Float64}(undef, l, 2)
SA_trace = Array{Float64}(undef, l, 2)

for i in 1:l
    x1 = Optim.x_trace(GD_res)[i][1]
    x2 = Optim.x_trace(GD_res)[i][2]
    GD_trace[i,1] = x1
    GD_trace[i,2] = x2
end

for i in 1:l
    x1 = Optim.x_trace(CGD_res)[i][1]
    x2 = Optim.x_trace(CGD_res)[i][2]
    CGD_trace[i,1] = x1
    CGD_trace[i,2] = x2
end

for i in 1:l
    x1 = Optim.x_trace(SA_res)[i][1]
    x2 = Optim.x_trace(SA_res)[i][2]
    SA_trace[i,1] = x1
    SA_trace[i,2] = x2
end

contour(-5:0.005:5,-5:0.005:5,f)

plot!([GD_trace[:,1]],
    [GD_trace[:,2]],
    lab = "Gradient Descent",
    zcolor = reverse(GD_trace, dims = 1), m = (4, 0.9, :reds, Plots.stroke(0)), 
    cbar = false, 
    w = 1.5,
    linecolor = :red)

plot!([CGD_trace[:,1]],
    [CGD_trace[:,2]],
    lab = "Conjugated GD",
    zcolor = reverse(CGD_trace, dims = 1), m = (4, 0.9, :greens, Plots.stroke(0)), 
    cbar = false, 
    w = 1.5,
    linecolor = :green)

plot!([SA_trace[:,1]],
    [SA_trace[:,2]],
    lab = "Simulated Annealing",
    zcolor = reverse(SA_trace, dims = 1), m = (4, 0.9, :blues, Plots.stroke(0)), 
    cbar = false, 
    w = 1.5,
    linecolor = :blue)

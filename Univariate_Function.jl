using Optim
using GR
using Plots

gr()

f(x) =  x[1]^2+3*x[1]+3+x[1]^4/5

start = [4.0]
iter = 10

GD_res = optimize(f, start, GradientDescent(),
               Optim.Options(g_tol = 1e-20,
                             iterations = iter,
                             store_trace = true,
                             extended_trace = true,
                             show_trace = false))

CGD_res = optimize(f, start, ConjugateGradient(),
               Optim.Options(g_tol = 1e-20,
                             iterations = iter,
                             store_trace = true,
                             extended_trace = true,
                             show_trace = false))

SA_res = optimize(f, start, SimulatedAnnealing(),
               Optim.Options(g_tol = 1e-20,
                             iterations = iter,
                             store_trace = true,
                             extended_trace = true,
                             show_trace = false))
GD_trace = collect(Iterators.flatten(Optim.x_trace(GD_res)))
CGD_trace = collect(Iterators.flatten(Optim.x_trace(CGD_res)))
SA_trace = collect(Iterators.flatten(Optim.x_trace(SA_res)))

plot(x->f([x,]), lab = "Univariate Function", linecolor = :grey)

plot!(GD_trace, 
    [Optim.f_trace(GD_res)],
    lab = "Gradient Descent",
    zcolor = reverse(GD_trace), m = (4, 0.9, :reds, Plots.stroke(0)), 
    cbar = false, 
    w = 1.5,
    linecolor = :red)

plot!(CGD_trace, 
    [Optim.f_trace(CGD_res)],
    lab = "Conjugated GD",
    zcolor = reverse(CGD_trace), m = (4, 0.9, :greens, Plots.stroke(0)), 
    cbar = false, 
    w = 1.5,
    linecolor = :green)

plot!(SA_trace, 
    [Optim.f_trace(SA_res)],
    lab = "Simulated Annealing",
    zcolor = reverse(SA_trace), m = (4, 0.9, :blues, Plots.stroke(0)), 
    cbar = false, 
    w = 1.5,
    linecolor = :blue)
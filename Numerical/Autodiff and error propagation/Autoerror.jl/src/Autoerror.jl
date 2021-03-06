module Autoerror

include("dualnumber.jl")
include("basic_extensions.jl")

function uncert(f::Dual, σ::Vector{<:Real})
  x = f.grad .* σ
  (val = f.val, err = √(x'x))
end

end
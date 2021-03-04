module Autoerror

export Dual, uncert

using LinearAlgebra: I, Matrix

struct Dual <: Number
    val::Real
    grad::Vector{Real}
end

function Dual(vars::Vector{<:Real})
    l = length(vars)
    id = Matrix(I, l, l)
    map(1:l) do j
        Dual(vars[j], id[:,j])
    end
end

Base.convert(::Type{Dual}, x::Real) = Dual(x, [zero(x)])
Base.promote_rule(::Type{Dual}, ::Type{<:Real}) = Dual

Base.:+(f::Dual, g::Dual) = Dual(f.val + g.val, f.grad .+ g.grad)
Base.:-(f::Dual, g::Dual) = Dual(f.val - g.val, f.grad .- g.grad)
Base.:-(f::Dual) = 0 - f
Base.:*(f::Dual, g::Dual) = Dual(f.val * g.val, f.grad .* g.val .+ f.val * g.grad)
Base.:/(f::Dual, g::Dual) = Dual(f.val / g.val, (f.grad .* g.val .- f.val .* g.grad) ./ g.val^2)

Base.sqrt(f::Dual) = Dual(sqrt(f.val), f.grad ./ sqrt(f.val))
Base.log(f::Dual) = Dual(log(f.val), f.grad ./ f.val)
Base.conj(f::Dual) = Dual(conj(f.val), conj.(f.grad))

function uncert(f::Dual, σ::Vector{<:Real})
    x = f.grad .* σ
    (val = f.val, err = √(x'x))
end

end
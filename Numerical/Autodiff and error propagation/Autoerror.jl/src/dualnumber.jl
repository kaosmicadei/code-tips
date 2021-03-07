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
Base.:*(f::Dual, g::Dual) = Dual(f.val * g.val, f.grad .* g.val .+ f.val * g.grad)
Base.:/(f::Dual, g::Dual) = Dual(f.val / g.val, (f.grad .* g.val .- f.val .* g.grad) ./ g.val^2)
# also the negative of a dual number
Base.:-(f::Dual) = Dual(-f.val, -f.grad)
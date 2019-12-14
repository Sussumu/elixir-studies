# all functions must be contained inside a module (it's like namespaces)
defmodule Geometry do
    # every line has a return so there's no explicit return
    def area(a, b) do
        a * b
    end

    # it's possible to define small functions in one line
    def volume(area, height), do: area * height

    # we can pipe functions sending the return as the first argument of the next func
    def run(a, b, h) do
        area(a, b)
        |> volume(h)
        |> abs()
    end
end

defmodule Arities do
    # use of default values
    # note that this generates three different functions with the same name
    def multipleFunctions(a, b \\ 1, c \\ 2) do
        a + b + c
    end
end
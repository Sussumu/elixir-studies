# all functions must be contained inside a module (it's like namespaces)
defmodule Geometry do
    # every line has a return so there's no explicit return
    defp area(a, b) do
        a * b
    end

    # it's possible to define small functions in one line
    defp volume(area, height), do: area * height

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
    def multiple_functions(a, b \\ 1, c \\ 2) do
        a + b + c
    end
end

defmodule Imports do
    import IO
    alias Geometry, as: Rect

    def my_volume do
        Rect.run(3, 4, 2)
        puts("No need to write the module anymore.")
    end
end

defmodule Attributes do
    # attributes are constants that are converted in compilation time
    @animal "Arara"

    def say_something, do: IO.puts(@animal)
end

# if we run 'elixirc first-steps.ex' we generate a .beam file
# then we can run 'h RegisteredAttrs.do_complex_stuff' to get help
defmodule RegisteredAttrs do
    @doc "Using iex help to get help from our functions is cool"
    def do_complex_stuff do
        1 + 1 + 2 + 3 + 5 + 8 + 13
    end
end

# since elixir is a dynamic language we can annotate functions with spec
# this makes easier to understand 
defmodule Typespecs do
    @spec crazy_stuff(number, charlist, list) :: charlist
    def crazy_stuff(arara, tucano, corvo) do
        IO.puts(arara + tucano + corvo)
    end
end
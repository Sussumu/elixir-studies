# atoms have good performance for constants
# variables assigned to atoms are just a reference, not the value itself

# everything that starts with a capital is an atom
# module names are atoms too!

# booleans have no space here
# :true and :false are the way to go
# but we can ignore the :'s on these
defmodule Atoms do
    def example do
        reference = :atom_name

        IO.puts(reference)
    end   
end

# short circuit to return the first truth
defmodule Falsy do
    # anything that is not nil or false is true
    def falsy do
        nil || :nil || false || "arara" || true
    end

    # if all falsy, returns the last
    def if_all_falsy do
        nil || false || :nil
    end

    # nice use case
    def get_data do
        cache = false
        db = "arara from db" 
        data = cache || db
        IO.puts(data)
    end
end

# short circuit to return the first false
defmodule Truthy do
    def example do
        true && "arara"
    end

    # nice use case
    def get_data do
        connected? = true 
        get_data_from_db = "arara"
        data = connected? && get_data_from_db
        IO.puts(data)
    end
end

# tuples are good to small fixed collection of items
defmodule Tuples do
    def run do
        people = { "Alice", 20 }

        new_people = put_elem(people, 1, 30)
        IO.puts("people #{elem(people, 1)}")
        IO.puts("new_people #{elem(new_people, 1)}")

        a = 1
        b = 2
        c = 3

        first = {a, b, c}
        new = first
            |> put_elem(2, 4)

        # rebinding b makes both tuples point to another address in that position
        b = 99
        
        first
        |> Tuple.to_list
        |> Enum.join(", ")
        |> IO.puts

        new
        |> Tuple.to_list
        |> Enum.join(", ")
        |> IO.puts
    end
end

# lists are single linked 
# not good to direct access because lists are iterated from the beginning
defmodule Lists do
    def run do        
        list = [1, 1, 2, 3, 5, "arara"]

        "arara" in list

        # in fact, lists are a pair head/tail
        # where head is a value and tail is a list most of time
        # the tail can be a value but then you cannot manipulate it as a list
        [1 | []]

        # lists are recursive structures
        [1 | [2 | [3 | [4 | []]]]]

        # appends to the end
        # but it has to iterate the whole list...
        # it's better to manipulate the beginning of the list, like a stack
        new_list = List.insert_at(list, -1, "tucano")

        # a beeetter way
        # also the new_list is a copy
        nice_list = ["gaivota" | new_list]
    end
end

defmodule Maps do
    def run do
        map = %{"arroz" => "feijão"}

        map["arroz"]

        # specify the nil value for a non existent element
        # you can also .fetch/2 and get an :ok or :error
        Map.get(map, 99, :not_found)

        # you can also raise an exception
        Map.fetch!(map, 99)
    end
end

defmodule Everything do
    def run do
        alice = %{:name => "alice", :age => 20}

        # if keys are atoms you can write this way too
        alice2 = %{name: alice, age: 20}

        # another way to access atoms keys
        # but it raises exception if the field is nonexistent
        # using alice[:nonexistent] would return :nil
        IO.puts ("Alice is #{alice.age} years old.")

        # modifying values that already exist
        # attempting to modify a nonexistent will throw a runtime error
        alice = %{alice | age: 30}

        IO.puts ("Alice is #{alice.age} years old.")
    end
end

defmodule Strings do
    def run do
        ~s(A string with "quotes")

        ~S(A non interpolated nor escaped string\n\n #{arara})

        "A binary string"

        'A character list'

        ~c(This one is "obvious")
    end
end

defmodule Functions do
    def run do
        square = fn x ->
            x * x
        end

        # the dot denotes we're calling an anonymous function
        square.(2)

        list = [1, 2, 3]

        Enum.each(
            list,
            fn x -> IO.puts(x) end
        )

        # & is the capture operator
        # it turns a function into a lambda
        Enum.each(
            list,
            &IO.puts/1
        )

        # it also can be used to omit the arguments
        square_short = &(&1 * &1)

        square_short.(3)

        # as long as you have the lambda reference, you can also reference any of
        # its variables

        # different from what happened to tuples, when you rebind a variable
        # referenced by a lambda, its original address and value is not available
        # to garbage collector
        forever = "arara"
        lambda = fn -> IO.puts(forever) end
        forever = "corvo"
        lambda.()
    end
end
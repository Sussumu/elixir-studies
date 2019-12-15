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
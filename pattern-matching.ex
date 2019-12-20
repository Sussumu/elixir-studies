# in fact, the equals symbol does not mean assignment
# tbh we already knew that!
defmodule PatternMatching do
    def run do
        # run this to see that the return of a match is always the right side
        {animal, age} = {"arara", 2}

        # we can use tuples to bound return values to different variables
        {date, time} = :calendar.local_time()

        # notice that date and time are a tuple too
        {year, month, day} = date

        # it's common to return either {:ok, data} or {:error, reason}

        # the pin operator is used when you want to test an expected value
        # it also doesn't bind to a variable, so in this example,
        # expected_name keep being Alice
        expected_name = "Alice"
        {^expected_name, _} = {"Alice", 25}
        {^expected_name, _} = {"Bob". 25}

        # when matching tuples and lists, the left side have to contain all keys
        # this doesn't happen with maps
        %{age: age} = %{name: "Alice", age: 25}

        # a nice use to pattern matching        
        command = "ping www.google.com"

        # states that we're expeting a string that starts with "ping "
        # then matches the rest on the url variable
        "ping " <> url = command

        IO.puts(url)
    end
end
defmodule KeywordLists do
    def run do
        weekdays = [{:sunday, 1}, {:monday, 2}, {:tuesday, 3}]

        elegant_weekdays= [sunday: 1, monday: 2, tuesday: 3]

        Keyword.get(weekdays, :sunday)

        # it's commonly used to pass optional arguments like
        IO.inspect([1, 2, 3], [limit: 2])

        # you can omit the square brackets if the last argument is a keyword list
        IO.inspect([1, 2, 3], limit: 2)
    end
end

defmodule Dates do
    def run do
        today = ~D[2019-12-15]
        now = ~T[16:52:00.000]

        naive = ~N[2019-12-15 16:53:00.000]
        datetime = DateTime.from_naive!(naive, "Etc/UTC")
    end
end
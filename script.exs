defmodule Script do
    def run do
        IO.puts("Aha!")
    end
end

# code outside module is executed immediately
# you can run it with --no-halt to not stop execution if there are other concurrent
# tasks running
Script.run
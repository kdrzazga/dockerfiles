defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    list1 = [1, 2, 3]
    list2 = [4, 5, 6]

    list3 = list1 ++ list2

    [head | tail] = list3

    IO.puts "Head: #{head}"

    IO.write "Tail: "
    IO.inspect tail
  end
end

M.main()


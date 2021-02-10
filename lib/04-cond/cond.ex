result =
  cond do
    2 + 3 == 4 -> "2 + 3 == 4 "
    2 + 1 == 4 -> "2 + 1 == 4 "
    1 + 1 == 2 -> "1 + 1 == 2 "
  end
IO.puts(result)

result =
  cond do
    2 + 3 == 4 -> "2 + 3 == 4 "
    2 + 1 == 4 -> "2 + 1 == 4 "
    1 + 2 == 2 -> "1 + 2 == 2 "
    true -> nil #Neede when resto of cases are false
  end
IO.puts(result)



result =
  cond do
    hd([2, "hola", 4]) -> "2 works as a true"
  end
IO.puts(result)

result =
  cond do
    hd(["hola", "33", 4]) -> "hola works as a true"
  end
IO.puts(result)

result =
  cond do
    hd([:ok, "33", 4]) -> ":ok works as a true"
  end
IO.puts(result)

result =
  cond do
    hd([false, "33", 4]) == false -> "false works as a true"
  end
IO.puts(result)

result =
  cond do
    2 + 3 == 4 -> "2 + 3 == 4 "
    2 + 1 == 4 -> "2 + 1 == 4 "
    1 + 2 == 2 -> "1 + 1 == 2 "
  end
IO.puts(result) #error

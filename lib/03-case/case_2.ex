x = 5

y =
  case 10 do
    ^x -> "the value match with #{x}"
    _ -> "the value does not match with #{x}"
  end

IO.puts(y)

texto = "hola"

result =
  case {:ok, "soy un texto"} do
    {:ok, ^texto} -> "Does not match"
    {:ok, "soy un texto"} -> "match"
  end

IO.puts(result)

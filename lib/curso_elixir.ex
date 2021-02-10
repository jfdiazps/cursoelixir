defmodule CursoElixir do

  @personas [%{firstname: "Carlos", lastname: "lievano"},
            %{firstname: "Andres", lastname: "Ramos"},
            %{firstname: "Camilo", lastname: "Perez"},
            %{firstname: "Laura", lastname: "Riascos"}]

  @numeros [1,2,3,4,5,6]

  #def buscar([]), do: "Ya no hay mas items"

  #def buscar([ %{firstname: a, lastname: b} = head |tail] = list \\ @personas) do
  #  IO.puts "Hola mi nombre es #{a} #{b}"
  #  #IO.inspect(head, label: "->")
  #  buscar(tail)
  #end

  def sumar([], suma), do: suma

  def sumar([head | tail] = list \\ @numeros, suma \\ 0)do
      resultado = suma + head;
      sumar(tail, resultado)
  end

  def generico([], suma, _funcion), do: suma

  def generico([head | tail] = list \\ @numeros, suma \\ 0, funcion) do
    resultado = funcion.(suma, head);
    sumar(tail, resultado)
  end

  def buscarNombre() do
      Enum.map(@personas, fn (a) -> IO.puts "Hola mi nombre es #{a.firstname} mi apellido #{a.lastname}" end)
  end

  def buscarNumero([head | tail], suma \\ 0) do

    suma = suma + 1
    buscarNumero(tail, suma)

  end

  def concat_strings([], suma), do: {:ok, suma}

  def concat_strings([head | _tail], _suma) when is_number(head) do
    {:error, "la lista contiene un numero"}
  end

  def concat_strings([head | tail], suma \\ "") when is_binary(head) do
    suma = suma <>" "<> head
    concat_strings(tail, suma)
  end


  def serie(n) do
      serie(n,0,1)
  end

  def serie(n,x,y) do
      if  n > 0 do
          IO.puts y
          serie(n-1,y, x + y)
      end
  end

  def rows(num) do
    rows(num, [[1]])
  end

  defp rows(1, result), do: Enum.reverse(result)

  defp rows(num, [first | rest]) do
    new = next_row(first, [1])
    rows(num - 1, [new, first | rest])
  end

  defp next_row([value], result), do:  [value | result]

  defp next_row([first, second | rest], result) do
    next_row([second | rest], [first + second | result])
  end

end

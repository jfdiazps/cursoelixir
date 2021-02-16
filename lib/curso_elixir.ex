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

  def suma(0, sumatoria), do: sumatoria

  def suma(numero1, sumatoria \\ 0) when numero1 > 0 do
      suma(numero1 - 1, sumatoria + numero1)
  end

  def fibo(n)  when n > 0 do
     cond do
      n > 2 -> fibo(n - 1) + fibo(n - 2)
      n == 1 or n == 2 -> 1
     end
  end

  def some_function(a,b) do
    cond do
      a == 0 or b == 0 -> 0
      a == b -> some_function(a - 1, b - 1) + 2 * a - 1
      a > b  -> some_function(a - b, b) + some_function(b, b)
      a < b  -> some_function(a, a) + some_function(b - a, a)
    end
  end

  def mcd(a,b) do
    cond do
      b == 0 -> a
      b > a -> mcd(b, a)
      true -> mcd(a - b, b)
    end
  end

  def fibo_opt(n) when is_integer(n) and n > 0, do: fibo_p(n, 0, 1)

  defp fibo_p(1, _, b), do: b

  defp fibo_p(n, a, b), do: fibo_p(n - 1, b, a + b)

  def for_loop(i, n, value) do
    cond do
      i < n ->
         IO.puts "#{value} - #{i} "
         for_loop(i + 1, n, value)
      true -> "Acabo"
    end
  end

  def for_loop2(i, n, value) when i < n do
    IO.puts "#{value} - #{i+1} "
    for_loop2(i + 1, n, value)
  end

  def for_loop2(i, n, _), do: :ok

  def mapas() do
    person = %{name: "fred", age: 95, favorite_color: "Tupe"}
    Map.put(person, :city, "Bogota")
  end

  def listas() do
    list = [3.14, :pie, "Apple"]
    ["n"| list]
    #list ++ ["Cherry"]
    #["cHERRY"] ++ list
    #[:foo, :bar, 42] -- [42, "bar"]

    #[person1 = %{name: "Joardan", apellido: "Lancheros"}, person2 = %{name: "Jader", apellido: "Diaz"}]
    lista = [peronas1: %{name: "Joardan", apellido: "Lancheros"}, person2: %{name: "Jader", apellido: "Diaz"}]
    lista[:person1].nombre
  end



  #pila_recursiva
  def pila_recursiva(n) do
      imprimir_pila(n, [[1]], 1)
  end

  defp imprimir_pila(b, [first | rest], num) when b > 0  do
    #IO.inspect(first, label: "->")
      new = imprimir_fila(b, num, [num]);
      cond do
        num == 1 -> imprimir_pila(b - 1, [new, first| rest], 0)
        num == 0 -> imprimir_pila(b - 1,  [new, first| rest], 1)
      end
  end

  defp imprimir_pila(0, result, _), do: result

  defp imprimir_fila(1, _, result), do: result

  defp imprimir_fila(b, ant, res) when b > 1 do
    #IO.inspect(res, label: "-> en um es #{b}")
    cond do
     ant == 1 ->  imprimir_fila(b-1, 0, res ++ [1])
     ant == 0 ->  imprimir_fila(b-1, 1, res ++ [0])
    end
  end

  #segunda forma
  def imprimir_lista(n) when n > 0 do
    imprimir_helper(Enum.map(1..n, fn x -> x end));
  end

  def imprimir_helper([head | tail]) do
    imprimir(head);
    imprimir_helper(tail);
  end

  def imprimir_helper([]), do: "termino"

  def imprimir(n) when n > 0 do
    IO.inspect(Enum.map(n..1, fn x -> cond do rem(x, 2) == 0 -> 0; rem(x, 2) == 1 -> 1 end end), label: "->")
  end
  #sumar_nums
  def sumar_nums([head | tail]) do
      head + sumar_nums(tail)
  end

  def sumar_nums([]), do: 0

  #array_reverse
  def reverse_array(list) do
    reversed(list, [])
  end

  defp reversed([], reversed), do:  reversed

  defp reversed([h|t], reversed) do
    reversed(t, [h|reversed])
  end

  #varificar_nums
  def verify_nums?([], condition), do: condition

  def verify_nums?([a], condition), do: condition

  def verify_nums?([first | tail], condition \\ true) when condition do
      verify_nums?(tail, first < hd(tail))
  end

  def getHead([]), do: 0

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

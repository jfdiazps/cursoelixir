defmodule Concat do
  def join(a, b \\ nil, sep \\ "")

  def join(a, b, _sep) when is_nil(b), do: a

  def join(a, b, sep) do
    a <> sep <> b
  end


  #forma1
  def input(text) do
    list = String.split(text, "", trim: true)
    delete_from_list(list, [])
  end

  def delete_from_list([head | list], listAcum) do
    [head2 | tail] = del_letras(head, list, length(list))
    delete_from_list(tail, listAcum ++ [head2])
  end

  def delete_from_list([], listAcum), do: Enum.join(listAcum, "")

  def del_letras(element, [head | tail], count ) when count > 0  do
      cond do
          element == head -> del_letras(element, tail, count - 1 )
          true -> del_letras(element, tail ++ [head]  , count - 1)
      end
  end

  def del_letras(element, list, 0), do:  [element] ++ list

  #forma2
  def input2(text) do
    list = String.split(text, "", trim: true)
    hash = %{}
    delete_from_list2(list,hash)
  end

  def delete_from_list2([head| tail], hash) do
      cond do
        Map.has_key?(hash, head) ->  delete_from_list(tail, hash)
        true -> IO.inspect(hash); delete_from_list(tail, Map.put_new(hash, head, head))
      end
  end

  def delete_from_list2([], hash) do
    Map.keys(hash)
  end

  #Ejercicio reduccion
  def reduction(n)  do
    reductionp(String.codepoints(n))
  end

  defp reductionp([], list),  do: Enum.join(list)

  defp reductionp([head | tail], list \\ [])  do
     result =
        cond do
            head in list -> list
            head not in list -> list ++ [head]
        end

    reductionp(tail, result)
end

#ejercicio union
def union(str1, str2) do
    unir_str(String.codepoints(str1), String.codepoints(str2))
end

defp unir_str([head | tail], [head2 | tail2], list \\ []) do
    unir_str(tail, tail2, list ++ [head] ++ [head2])
end

defp unir_str(tail,[], list), do: Enum.join(list ++ tail)

defp unir_str([],tail, list), do: Enum.join(list ++ tail)


end

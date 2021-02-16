defmodule Remove do

  def start(str) do
    remove_dup(str) |> IO.puts
  end

  def remove_dup(str) do
    [h|t] = str |> String.codepoints
    is_dup(h, t, [])
  end

  defp is_dup(h, [], new) do
    unless h in new, do: new = new ++ [h]
    new
  end
  defp is_dup(h, t, new) do
    if h in new do
      is_dup(hd(t), tl(t), new)
    else
      is_dup(hd(t), tl(t), new ++ [h])
    end
  end
end

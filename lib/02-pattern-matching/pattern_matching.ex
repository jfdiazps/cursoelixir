IO.puts "Hola mundo"

[a|b] = myList = [1,2,3]

IO.inspect(myList, label: "->")
IO.inspect(a, label: "->")
IO.inspect(b, label: "->")

[%{ firstname: a }|b]  = personas = [%{firstname: "Carlos", lastname: "lievano"},
            %{firstname: "Andres", lastname: "Ramos"},
            %{firstname: "Camilo", lastname: "Perez"},
            %{firstname: "Laura", lastname: "Riascos"}]

IO.inspect(a, label: "->")

nombre = %{name: "Jhon", age: 27, languages: ["Earlang", "Ruby", "Elixir"]}

[jhon: ^nombre, mary: _] = users = [
  jhon: %{name: "Jhon", age: 27, languages: ["Earlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Earlang", "F#", "Clojure"]}
]

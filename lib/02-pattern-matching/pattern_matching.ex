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

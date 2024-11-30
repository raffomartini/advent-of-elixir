
calibration_value = fn (line) ->
    digits = Regex.scan(~r/\d/, line) |> List.flatten
    [List.first(digits), List.last(digits)]
    |> Enum.map(fn string -> String.to_integer(string) end)
    |> (fn list -> List.first(list) * 10 + List.last(list) end).()
end
File.stream!("input.txt") |>
Enum.map(calibration_value) |>
Enum.sum()

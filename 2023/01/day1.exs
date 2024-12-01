p1_first = ~r/\d/
p1_last = ~r/\d(?!.*\d)/
pattern= ~S"(\d|on(?=e)|two|thre(?=e)|four|fiv(?=e)|six|seve(?=n)|eigh(?=t)|nin(?=e))"
p2_first = ~r/#{pattern}/
p2_last = ~r/#{pattern}(?!.*#{pattern})/

extract_digits = fn digit ->
    case digit do
        "on" -> 1
        "two" -> 2
        "thre" -> 3
        "four" -> 4
        "fiv" -> 5
        "six" -> 6
        "seve" -> 7
        "eigh" -> 8
        "nin" -> 9
        _ -> String.to_integer(digit)
    end
end

calibration_value = fn (line, first, last) ->
    d1 = case Regex.run(first, line) do
        [d1 | _ ] ->
            extract_digits.(d1)
        _ -> 0
    end
    d2 = case Regex.run(last, line) do
      [ d2 | _ ] ->
            extract_digits.(d2)
    end
    d1 * 10 + d2
end

run = fn (name, first, last) ->
    IO.puts(name)
    File.stream!("input.txt") |> Enum.map(&calibration_value.(&1,first, last)) |> Enum.sum()
end


# File.stream!("input.txt") |> Enum.map(calibration_value) |> Enum.sum()
run.("Part1", p1_first, p1_last)

run.("Part2", p2_first, p2_last)

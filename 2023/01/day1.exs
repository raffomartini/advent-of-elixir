IO.puts(File.stream!("input.txt") |> Stream.map(&String.trim/1) |> Enum.at(0))

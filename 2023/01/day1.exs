
calibration_value = fn list -> String.to_integer(List.first(list)) * 10 + String.to_integer(List.last(list)) end
File.stream!("input.txt") |> Stream.map(&String.trim/1) |> (&Regex.scan(~r/\D*(\d).*(\d)\D*/, &1)).() |> List.flatten |> &calibration_value.()



# That ugly thing is an anonymous function, it is required because Regex.run first argument is the regex, not the input.
# "5knjbxgvhktvfcq89onefive" |> (&Regex.scan(~r/\D*(\d).*(\d)\D*/, &1)).() |> List.flatten

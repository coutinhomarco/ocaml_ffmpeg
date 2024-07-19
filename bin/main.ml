let run_ffmpeg input output =
  let command = Printf.sprintf "ffmpeg -i %s %s" input output in
  let exit_code = Sys.command command in
  if exit_code = 0 then
    Printf.printf "Conversão de %s para %s concluída com sucesso!\n" input output
  else
    Printf.printf "Erro na conversão de %s para %s.\n" input output

let () =
  if Array.length Sys.argv <> 3 then
    Printf.printf "Uso: %s <input> <output>\n" Sys.argv.(0)
  else
    let input = Sys.argv.(1) in
    let output = Sys.argv.(2) in
    run_ffmpeg input output
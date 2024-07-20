# Simple FFmpeg Converter

This is a simple command-line application that I created to convert media files using `ffmpeg`. The main purpose of this app is to avoid using online converters and to provide a straightforward solution for media conversion directly from the terminal.

## Prerequisites

- [FFmpeg](https://ffmpeg.org/download.html) must be installed and available in your system's PATH.
- OCaml environment set up on your machine.
- [Dune](https://dune.build/) build system installed.


## Usage

To use the application, you need to build it using Dune. Here is how you can do it:

1. **Create a `dune` file:**

   ```dune
   (executable
    (name ffmpeg_converter)
    (libraries unix))
    ```


    Build the application:

    dune build



    Run the application:

    dune exec ./ffmpeg_converter.exe input output



        <input>: The path to the input media file.

        <output>: The desired path for the output media file.




Example

dune exec ./ffmpeg_converter.exe input.mp4 output.avi


This command will convert the input.mp4 file to output.avi using ffmpeg.

Code Explanation

The application is written in OCaml and uses the Sys.command function to execute the ffmpeg command. Below is a brief explanation of the code:

let run_ffmpeg input output =
  let command = Printf.sprintf "ffmpeg -i %s %s" input output in
  let exit_code = Sys.command command in
  if exit_code = 0 then
    Printf.printf "Conversion from %s to %s completed successfully!\n" input output
  else
    Printf.printf "Error converting %s to %s.\n" input output

let () =
  if Array.length Sys.argv <> 3 then
    Printf.printf "Usage: %s input output\n" Sys.argv.(0)
  else
    let input = Sys.argv.(1) in
    let output = Sys.argv.(2) in
    run_ffmpeg input output



    run_ffmpeg input output: This function constructs the ffmpeg command and executes it using Sys.command. It prints a success message if the conversion is successful and an error message otherwise.

    The main function checks if the correct number of arguments is provided. If not, it prints the usage instructions. If the correct number of arguments is provided, it calls run_ffmpeg with the input and output file paths.

Acknowledgements


    FFmpeg for their powerful multimedia framework.

    The OCaml community for their support and resources.

    Dune for their efficient build system.



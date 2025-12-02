function convert
    if test (count $argv) -ne 2
        echo "Usage: convert <input-file> <extension | output-file>"
        return 1
    end

    set input $argv[1]
    set ext  $argv[2]

    if not test -f "$input"
        echo "File not found: $input"
        return 1
    end

    if string match -qr "\." "$ext"
        set output "$ext"
    else
        set base (basename "$input" | sed 's/\.[^.]*$//')
        set output "$base.$ext"
    end

    # Overwrite check
    if test -f "$output"
        echo -n "'$output' already exists. Overwrite? (y/N): "
        read ans

        switch (string lower $ans)
            case y yes
                echo "Overwriting..."
            case '*'
                echo "Cancelled."
                return 1
        end
    end

    ffmpeg -i "$input" "$output"

    if test $status -eq 0
        echo "Done: $output"
    else
        echo "Conversion failed."
    end
end


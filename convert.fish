function convert
    # Help option
    if test (count $argv) -eq 1
        switch $argv[1]
            case "-h" "--help"
                echo "Usage:"
                echo "  convert <input> <extension | output-file>"
                echo ""
                echo "Examples:"
                echo "  convert video.mp4 mkv"
                echo "  convert video.mp4 newname.mkv"
                echo ""
                echo "GIF modes:"
                echo "  gif, giffast, gifhq"
                echo ""
                echo "Audio formats:"
                echo "  mp3, wav, flac, ogg"
                echo ""
                echo "Video formats:"
                echo "  mp4, mkv, webm"
                return 0
        end
    end

    if test (count $argv) -ne 2
        echo "Invalid usage. Run: convert -h"
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

    # Conversion logic
    switch $ext
        case mp4
            ffmpeg -i "$input" -c:v libx264 -c:a aac "$output"

        case mkv
            ffmpeg -i "$input" -c:v libx264 -c:a aac "$output"

        case webm
            ffmpeg -i "$input" -c:v libvpx-vp9 -b:v 2M -c:a libopus "$output"

        case mp3
            ffmpeg -i "$input" -vn -acodec libmp3lame -q:a 2 "$output"

        case wav
            ffmpeg -i "$input" -vn "$output"

        case flac
            ffmpeg -i "$input" -vn -c:a flac "$output"

        case ogg
            ffmpeg -i "$input" -vn -c:a libvorbis -q:a 5 "$output"

        case gif
            ffmpeg -i "$input" -vf "fps=12,scale=480:-1:flags=lanczos" -loop 0 "$output"

        case giffast
            ffmpeg -i "$input" -vf "fps=10,scale=360:-1" -loop 0 "$output"

        case gifhq
            ffmpeg -i "$input" -vf "fps=15,scale=720:-1:flags=lanczos" -loop 0 "$output"

        case '*'
            ffmpeg -i "$input" "$output"
    end

    if test $status -eq 0
        echo "Done: $output"
    else
        echo "Conversion failed."
    end
end

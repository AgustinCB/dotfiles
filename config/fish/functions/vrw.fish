function vrw
    rdrview $argv -H | pandoc /dev/stdin -f html -t markdown_strict | glow -p /dev/stdin
end

#!/bin/bash
for file in content/**/*.md; do
    # Create the corresponding subdirectory in public
    output_dir="public/$(dirname "$file" | sed 's|content/||')"
    mkdir -p "$output_dir"

    # Convert Markdown with citations
    pandoc "$file" --citeproc --bibliography=content/references.bib -o "$output_dir/$(basename "$file" .md).html"
done

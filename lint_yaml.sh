#!/bin/bash

YAMLLINT="/Library/Frameworks/Python.framework/Versions/3.8/bin/yamllint"
if ! "$YAMLLINT" --version &> /dev/null; then
    echo "Error: yamllint not found at $YAMLLINT. Install with '/Library/Frameworks/Python.framework/Versions/3.8/bin/pip3 install yamllint'."
    exit 1
fi

START_DIR=${1:-.}
TOTAL_FILES=0
ERROR_COUNT=0
COMMENT_INDENT_ISSUES=0
FIXED_FILES=0

TEMP_CONFIG=$(mktemp)
cat <<EOF > "$TEMP_CONFIG"
extends: default
rules:
  comments-indentation:
    level: error
  indentation:
    spaces: 2
  line-length: disable
  document-start: disable
EOF

echo "Linting and fixing values.yaml files in $START_DIR and subdirectories..."
echo "Targeting over-indented comments (e.g., [196:8]-style errors), ignoring line-length and document-start..."
echo "yamllint version: $($YAMLLINT --version)"
echo "Config:"
cat "$TEMP_CONFIG"

find "$START_DIR" -type f -name "values.yaml" | while read -r file; do
    echo "Checking: $file"
    OUTPUT=$("$YAMLLINT" -c "$TEMP_CONFIG" "$file" 2>&1)
    EXIT_CODE=$?
    echo "Initial exit code: $EXIT_CODE"
    echo "Initial output:"
    echo "$OUTPUT"
    
    if [ $EXIT_CODE -ne 0 ]; then
        if [ $EXIT_CODE -eq 255 ]; then
            echo "  -> Config error—yamllint failed to parse the configuration"
            exit 1
        fi
        ((ERROR_COUNT++))
        if echo "$OUTPUT" | grep -q "comments-indentation"; then
            ((COMMENT_INDENT_ISSUES++))
            echo "  -> Over-indented comment detected in $file, attempting to fix..."

            # Backup the original file
            cp "$file" "$file.bak"
            
            # Fix comments with 6+ spaces to 2 spaces
            sed -i '' '/^[[:space:]]\{4,\}#/s/^[[:space:]]\{4,\}/  /' "$file"
            echo "  -> Adjusted comments with 4+ spaces to 2 spaces"
            
            # Re-lint to confirm fix
            NEW_OUTPUT=$("$YAMLLINT" -c "$TEMP_CONFIG" "$file" 2>&1)
            NEW_EXIT_CODE=$?
            echo "Post-fix exit code: $NEW_EXIT_CODE"
            echo "Post-fix output:"
            echo "$NEW_OUTPUT"
            
            if [ $NEW_EXIT_CODE -eq 0 ] || ! echo "$NEW_OUTPUT" | grep -q "comments-indentation"; then
                echo "  -> Fixed over-indented comments in $file"
                ((FIXED_FILES++))
                rm -f "$file.bak"
            else
                echo "  -> Fix failed, restoring original file"
                mv "$file.bak" "$file"
            fi
        else
            echo "  -> Other linting issues (non-comment) found in $file, no fix applied"
        fi
    else
        echo "  -> No indentation issues found"
    fi
    ((TOTAL_FILES++))
done

rm -f "$TEMP_CONFIG"
echo "Linting and fixing complete!"
echo "Total values.yaml files checked: $TOTAL_FILES"
echo "Files with any errors: $ERROR_COUNT"
echo "Files with over-indented comments: $COMMENT_INDENT_ISSUES"
echo "Files successfully fixed: $FIXED_FILES"
if [ $ERROR_COUNT -eq 0 ]; then
    echo "All clear—no indentation issues found!"
else
    echo "Found $ERROR_COUNT values.yaml file(s) with issues, fixed $FIXED_FILES of $COMMENT_INDENT_ISSUES with over-indented comments."
fi

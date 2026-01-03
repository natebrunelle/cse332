#!/bin/bash

realpath_py() {
    python3 -c 'import os,sys; print(os.path.realpath(sys.argv[1]))' "$1"
}

self="$(realpath_py "$0")"
here="$(dirname "$self")/"
target="$(realpath_py "$here/demo_site")/"

cd "$here"

remote=brunelle@bicycle.cs.washington.edu:/cse/web/courses/cse332/26wi
if [ "$#" -gt 0 ] && [ "$1" != 'test' ]
then
	remote="$1"@attu.cs.washington.edu:/cse/web/courses/cse332/26wi
fi
mkdir -p "${target}files"

#if ls ~/.local/pandoc*/bin/pandoc
#then pd="$(ls  ~/.local/pandoc*/bin/pandoc | tail -1)"
#else pd="$(which pandoc)"
#fi
pd="$(which pandoc)"
which python3 || module load python3

if [ "$#" -lt 1 ] || [ "$1" != 'test' ]
then
    git pull
    git add -A
    git commit -m 'autocommit caused by update'
    git push
elif [ "$1" = 'test' ]
then
    shift
fi

if [ -n "$1" ]; then always=1; else always=; fi

case "$(uname)" in
    Darwin*)  # macOS
        get_datetime() {
            stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$1"
        }
        sed_inplace() {
            sed -i '' "$@"
        }
        ;;
    Linux*)   # GNU/Linux
        get_datetime() {
            stat -c '%y' "$1" | cut -d':' -f-2
        }
        sed_inplace() {
            sed -i "$@"
        }
        ;;
    *)
        echo "Unsupported OS: $(uname)" >&2
        exit 1
        ;;
esac

# copies, with permission fix (644 for files, 755 for dirs), making dirs if needed
# also runs markdown, fixing links, if applicable
function upfile_inner() {
    src="$1"
    dst="$2"
    echo "$src → $dst"
    #return 1
    if [ ! -d "$(dirname "$dst")" ]
    then
        echo "making directory $(dirname "$dst")"
        mkdir -m 755 -p "$(dirname "$dst")"
    fi
    if [ "${src%.md}" != "$src" ]
    then
        tail="$(realpath_py "$src")"
        tail="${tail#${here}markdown/}"
        prefix="$(dirname "$(echo "$tail" | sed 's;[^/]*/;../;g')")"
        if [ "${#prefix}" -lt 2 ]; then prefix=''; else prefix=$prefix/; fi
        datetime="$(get_datetime "$src")"

        python3 $here/env.py "$src" | \
        $pd --standalone \
            --to=html5 \
            --from=markdown+inline_code_attributes+smart \
            --number-sections \
            --title-prefix="CSE332" \
            --table-of-contents --toc-depth=3 \
            --css=${prefix}style.css \
            --katex='https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.16.9/' \
            --html-q-tags \
            --template=${here}template.html \
            --variable=year:${datetime:0:4} \
            --variable=datetime:"$datetime" \
            -o "$dst"
        sed_inplace \
            -e 's;</?colgroup>;;g' \
            -e 's;<col [^>]*/>;;g' \
            -e 's/<span class="co">\&#39;/<span class="st">\&#39;/g' \
            -e 's/<span class="co">\&quot;/<span class="st">\&quot;/g' \
            -e 's/<table style="width:[^"]*">/<table>/g' \
            "$dst"

        sed_inplace 's/XXXX-XX-XX/'"$datetime"'/g' "$dst"
        sed_inplace "s;\(href=[\"']\)\./;\1${prefix};g" "$dst"
        sed_inplace "s;\(href=[\"']\)/;\1${prefix};g" "$dst"
        sed_inplace 's/<a href="'"$(basename "$dst")"'">\([^<]*\)<\/a>/<span class="visited">\1<\/span>/g' "$dst"
        chmod 664 "$dst"
        #touch --date="$(stat -c "%y" "$src")" "$dst"
    else
        cp "$src" "$dst" #  --preserve=timestamps
        chmod 644 "$dst"
    fi
}

# computes destination and checks if update needed
function upfile() {
    src="$(realpath_py "$1")"
    tail=${src#${here}markdown/}
    if [ "$tail" = "$src" ];
    then
        echo "ERROR: Cannot update outside the markdown file tree" >&2
        echo "    error with" $src >&2
        echo "    here=$here" >&2
        return 1
    fi
    dst="${target}$tail"
    if [ "${src%.md}" != "$src" ]
    then
        dst="${dst%.md}.html"
    fi
    
    if [ -n "$always" ] \
    || [ "$src" -nt "$dst" ]; then upfile_inner "$src" "$dst"; return 0; fi
    
    if [ "${src%.md}" != "$src" ]; then
        if [ "$dst" -ot "${here}template.html" ] \
        || [ "$dst" -ot "${here}env.py" ] \
        || [ "$dst" -ot "$self" ]; then upfile_inner "$src" "$dst"; return 0; fi
    fi
}



# cross-link cal.yaml and the various files it makes
if [ cal.yaml -nt calendar.html ] \
|| [ links.yaml -nt calendar.html ] \
|| [ cal2html.py -nt calendar.html ] \
|| [ cal.yaml -nt markdown/cal.ics ] \
|| [ cal.yaml -nt assignments.json ]
then
    echo "doing calendar"
    python3 cal2html.py
    scp "assignments.json" "/var/www/html/cs4102/meta/"
    scp "coursegrade.json" "/var/www/html/cs4102/meta/"
    scp "course.json" "/var/www/html/cs4102/meta/"
fi
if [ calendar.html -nt markdown/calendar.md ]
then
    if stat -c %y calendar.html >/dev/null 2>&1; then
        # Linux (GNU stat)
        touch --date="$(stat -c %y calendar.html)" markdown/calendar.md
    else
        # macOS / BSD
        touch -r calendar.html markdown/calendar.md
    fi
fi

# move all files to the destination tree, compiling as needed
find markdown -type f | while read path
do
    upfile "$path"
done



rsync --update --compress --recursive --times --verbose -e ssh "$target" "$remote"


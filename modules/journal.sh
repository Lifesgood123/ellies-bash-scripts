new_journal(){
    local base='https://itty.bitty.site/#%s/?XQAAAAIEAAAAAAAAAAAeGIpD54Pf///8IQAA'
    local todays="$(python3 -c "from datetime import datetime; f = lambda x : '{}{}'.format(x, 'th' if x > 3 and x < 21 else 'st' if x % 10 == 1 else 'nd' if x % 10 == 2 else 'rd' if x % 10 == 3 else 'th'); print(datetime.today().strftime('%A, %B {}, %Y').format(f(int(datetime.today().strftime('%d')))))")"
    firefox "$("$(printf  "$base" "$(echo "$todays" | tr ' ' '_')")" | sed 's:,:%2C:g')" &
    echo "$(zenity --entry)" >> ~/Documents/ittybittynotes
}

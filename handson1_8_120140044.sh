# Cek apakah script ini dijalankan dengan 3 argument (namafile start end)
if [ $# != 3 ]; then
    echo "Berikan 3 argument (namafile start end)" # Jika tidak ada argument, maka tampilkan pesan ini
    exit 1
fi

if [ ! -f $1 ]; then
    echo "File $1 tidak ditemukan" # Jika file tidak ada, maka tampilkan pesan ini
    exit 1
fi

counter=1

while read line; do
    if [ $counter -lt $2 ]; then # Jika counter kurang dari start, maka counter bertambah
        counter=$((counter+1))
        continue
    fi

    if [ $counter -ge $(($3+1)) ]; then # Jika counter lebih dari end, maka program selesai.
        break
    fi
    echo "$line" # Tampilkan isi baris
    counter=$((counter+1))
done < $1

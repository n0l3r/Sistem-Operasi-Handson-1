# Cek apakah script ini dijalankan dengan argument
if [ $# -eq 0 ]; then
    echo "Tidak ada argument yang diberikan." # Jika tidak ada argument, maka tampilkan pesan ini
    exit 0001
fi

# Cek apakah file ada di directory atau tidak
for i in $@; do
    if [ -f $i ]; then # Jika file ada, maka lakukan konversi 
        mv $i $i.old
        tr [:lower:] [:upper:] < $i.old > $i
        rm $i.old
        echo "Sukses Konversi $i"
        continue
    fi
    echo "File $i tidak ditemukan." # Jika file tidak ada, maka tampilkan pesan ini
done

# Cek apakah script ini dijalankan dengan argument
if [ $# -eq 0 ]; then
    echo "Tidak ada argument yang diberikan." # Jika tidak ada argument, maka tampilkan pesan ini
    exit 1
fi

read -p "Kata : " key

# Cek apakah file ada di directory atau tidak
for i in $@; do
    if [ ! -f $i ]; then
        echo "File $i tidak ditemukan" # Jika file tidak ada, maka tampilkan pesan ini
        continue
    fi
    mv $i $i.old
    grep -v "$key" < $i.old > $i
    rm $i.old
    echo "Berhasil menghapus baris yang memiliki kata $key pada $i"
done
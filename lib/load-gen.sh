for((num=0; num<2; num=num))
do
    curl -s http://127.0.0.1.nip.io:9080//nginx-example > /dev/null
    curl -s http://127.0.0.1.nip.io:9080// > /dev/null
    curl -s http://127.0.0.1.nip.io:9080//whoami > /dev/null
done

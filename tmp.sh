sudo docker cp ./dump.sql beff:/dump.sql
sudo docker cp ./script.sh beff:/script.sh
sudo docker exec -it beff chmod u+x /script.sh
sudo docker exec -it beff bash -c /script.sh
sudo docker exec -it beff rm /dump.sql
sudo docker exec -it beff rm /script.sh

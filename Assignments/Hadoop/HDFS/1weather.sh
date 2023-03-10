hdfs dfs -put /mnt/c/Users/miles.MILE-BL-4766-LA.000/Documents/FT/futurense_hadoop-pyspark/labs/dataset/weather/weather_data.txt  /user/training/weather
hdfs dfs -cat /user/training/weather/weather_data.txt

lines=`wc -l /user/training/weather/weather_data.txt`

line=`echo $lines | cut -d' ' -f1`

h1=`expr $line / 2`
h2=`expr $line - $h1`

hdfs dfs -cat /user/training/weather/weather_data.txt | head -$h1 > weather1.txt
hdfs dfs -cat /user/training/weather/weather_data.txt | tail -$h2 > weather2.txt

cat weather1.txt weather2.txt > weather3.txt

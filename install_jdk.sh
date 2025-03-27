sudo apt-get purge openjdk* -y
sudo apt-get install -y software-properties-common
sudo apt install openjdk-8-jre-headless -y
sudo apt-get install openjdk-8-jdk -y
sudo apt-get -y install maven
echo 'export PATH=/usr/lib/jvm/java-8-openjdk-amd64/:$PATH' >> /home/master/.bashrc
wget -c https://services.gradle.org/distributions/gradle-5.5.1-bin.zip -P /tmp
sudo unzip -d /opt/gradle /tmp/gradle-5.5.1-bin.zip
echo 'export PATH=/opt/gradle/gradle-5.5.1/:$PATH' >> /home/master/.bashrc
source /home/master/.bashrc

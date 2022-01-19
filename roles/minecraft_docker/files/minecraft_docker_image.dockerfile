FROM fedora:latest

RUN yes | dnf update

# seed {"useCaves":true,"useStrongholds":true,"useVillages":true,"useMineShafts":true,"useTemples":true,"useRavines":true,"useMonuments":true,"useMansions":true,"useLavaOceans":false,"useWaterLakes":true,"useLavaLakes":true,"useDungeons":true,"fixedBiome":-3,"biomeSize":4,"seaLevel":38,"riverSize":7,"waterLakeChance":44,"lavaLakeChance":99,"dungeonChance":99,"dirtSize":40,"dirtCount":20,"dirtMinHeight":0,"dirtMaxHeight":255,"gravelSize":50,"gravelCount":22,"gravelMinHeight":0,"gravelMaxHeight":255,"graniteSize":33,"graniteCount":10,"graniteMinHeight":0,"graniteMaxHeight":80,"dioriteSize":33,"dioriteCount":10,"dioriteMinHeight":0,"dioriteMaxHeight":80,"andesiteSize":33,"andesiteCount":10,"andesiteMinHeight":0,"andesiteMaxHeight":80,"coalSize":40,"coalCount":27,"coalMinHeight":0,"coalMaxHeight":147,"ironSize":9,"ironCount":20,"ironMinHeight":0,"ironMaxHeight":64,"goldSize":9,"goldCount":2,"goldMinHeight":0,"goldMaxHeight":32,"redstoneSize":18,"redstoneCount":14,"redstoneMinHeight":0,"redstoneMaxHeight":35,"diamondSize":4,"diamondCount":1,"diamondMinHeight":0,"diamondMaxHeight":8,"lapisSize":21,"lapisCount":7,"lapisMinHeight":0,"lapisMaxHeight":32,"coordinateScale":933,"heightScale":684,"mainNoiseScaleX":80,"mainNoiseScaleY":160,"mainNoiseScaleZ":80,"depthNoiseScaleX":200,"depthNoiseScaleZ":200,"depthNoiseScaleExponent":0.5,"biomeDepthWeight":1,"biomeDepthOffset":0,"biomeScaleWeight":1,"biomeScaleOffset":1,"lowerLimitScale":512,"upperLimitScale":512,"baseSize":8.5,"stretchY":12,"lapisCenterHeight":16,"lapisSpread":16}

RUN mkdir /minecraft

RUN yes | dnf install java-latest-openjdk-headless

WORKDIR /minecraft

RUN mkdir /minecraft/worlds

COPY /server.jar /minecraft/

RUN chmod 775 server.jar

RUN echo eula=true > eula.txt

EXPOSE 25565/tcp

ENV MCRAM=2G

RUN java -Xmx${MCRAM} -jar minecraft_server.jar --port 25565 --nogui --universe /minecraft/worlds

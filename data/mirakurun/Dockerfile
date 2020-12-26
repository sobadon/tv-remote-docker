FROM ghcr.io/sobadon/bondriverproxy_linux:latest AS bdp

FROM chinachu/mirakurun:3.3.1

COPY --from=bdp /bdp/BonDriver*.so /bdp/

# /opt/bin はなぜか消される
#COPY --from=bdp /usr/local/bin/recbond /opt/bin
#COPY --from=bdp /usr/local/bin/recpt1ctl /opt/bin
COPY --from=bdp /usr/local/bin/recbond /usr/local/bin
COPY --from=bdp /usr/local/bin/recpt1ctl /usr/local/bin

SHELL ["/bin/bash", "-l", "-c"]

WORKDIR /bdp

RUN cp BonDriver_Proxy.so BonDriver_Proxy-T.so
RUN cp BonDriver_Proxy.so BonDriver_Proxy-S.so
#RUN cp BonDriver_Proxy.conf BonDriver_Proxy-T.so.conf
#RUN cp BonDriver_Proxy.conf BonDriver_Proxy-S.so.conf
#RUN sed -i "s/ADDRESS=.*/ADDRESS=192.168.2.104/g" BonDriver_Proxy-{T,S}.so.conf
#RUN sed -i "s/PORT=.*/PORT=30000/g" BonDriver_Proxy-{T,S}.so.conf
#RUN sed -i "s/BONDRIVER=.*/BONDRIVER=PX-W3PE4_T/g" BonDriver_Proxy-T.so.conf
#RUN sed -i "s/BONDRIVER=.*/BONDRIVER=PX-W3PE4_S/g" BonDriver_Proxy-S.so.conf

# T0 - T5
RUN for i in `seq 0 5` ; do cp BonDriver_Proxy-T.so BonDriver_Proxy-T${i}.so ; done
RUN for i in `seq 0 1` ; do cp BonDriver_Proxy-T.so BonDriver_Proxy-W3PE4-T${i}.so ; done
RUN for i in `seq 0 3` ; do cp BonDriver_Proxy-T.so BonDriver_Proxy-Q1UD-T${i}.so ; done

# S0 - S3
RUN for i in `seq 0 3` ; do cp BonDriver_Proxy-S.so BonDriver_Proxy-S${i}.so ; done 
RUN for i in `seq 0 1` ; do cp BonDriver_Proxy-T.so BonDriver_Proxy-W3PE4-S${i}.so ; done

WORKDIR /app


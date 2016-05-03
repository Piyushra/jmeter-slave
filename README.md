# JMETER SLAVE CONTAINER
JMETER SLAVES are the part of JMETER Distributed architecture for Docker. JMETER SLAVES accepts the task from the JMETER MASTER and after the execution, the output is sent back to the JMETER-MASTER. 

<h3>Software Requirements:</h3>
1) A working cluster which is inclusive of Docker, Mesos(optional), Marathon(optional)
2) A Virtual Networking Tool like WEAVE (--net=weave means we are using the WEAVE here, you can replace it your's) 

<h3> To Start The JMETER SLAVES: </h3>
By Docker Command:
<code>
sudo docker run --net=weave -d -p 0.0.0.0:1099:1099 -p 0.0.0.0:60000:60000 -v <absolute any host path to log>:/logs -v <absolute any host path to inputdata>:/inputdata 
</code>

By Marathon Deployment:
Edit the number instances required in the Marathon Json and deploy it on the Marathon. UNIQUE constraint is used, hence one SLAVE per VM is considered.
<code>curl -H "Accept: application/json" -H "Content-Type: application/json" http://<master-node>:8080/v2/apps --data @sample_jmeterslave.json</code>

The SLAVES will run for indefinite time till they are killed.

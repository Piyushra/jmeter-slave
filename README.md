# JMETER SLAVE CONTAINER
JMETER SLAVES are the part of JMETER Distributed architecture for Docker. JMETER SLAVES accepts the task from the JMETER MASTER and after the execution, the output is sent back to the JMETER-MASTER. 
</br>
<h3>Software Requirements:</h3>
<p>1) A working cluster which is inclusive of Docker, Mesos(optional), Marathon(optional)</p>
<p>2) A Virtual Networking Tool like WEAVE (--net=weave means we are using the WEAVE here, you can replace it your's) </p>
</br>
<h3> To Start The JMETER SLAVES: </h3>
<p>By Docker Command:</p>
<p><code>
sudo docker run --net=weave -d -p 0.0.0.0:1099:1099 -p 0.0.0.0:60000:60000 -v <absolute any host path to log>:/logs -v <absolute any host path to inputdata>:/inputdata 
</code></p>

<p>By Marathon Deployment:</p>
<p>Edit the number instances required in the Marathon Json and deploy it on the Marathon. UNIQUE constraint is used, hence one SLAVE per VM is considered.</p>
<p><code>curl -H "Accept: application/json" -H "Content-Type: application/json" http://<master-node>:8080/v2/apps --data @sample_jmeterslave.json</code></p>
</br>
<p>The SLAVES will run for indefinite time till they are killed.</p>

# JMETER SLAVE CONTAINER
JMETER SLAVES are the part of JMETER Distributed architecture for Docker. JMETER SLAVES accepts the task from the JMETER MASTER and after the execution, the output is sent back to the JMETER-MASTER. 
</br>
<h3>Software Requirements:</h3>
<p>1) A working cluster which is inclusive of Docker, Mesos(optional), Marathon(optional)</br>
2) A Virtual Networking Tool like WEAVE (--net=weave means we are using the WEAVE here, you can replace it your's) 
   </br>(To install the WEAVE visit https://github.com/weaveworks/weave )</p>
</br>
<h3> To Start The JMETER SLAVES: </h3>
<p><b>By Docker Command:</b></br>
This is not at all recommended as JMETER Master will get the details about Slaves through the Marathon Server. Everything will go Manual, then.</br>
<code>
sudo docker run --net=weave -d -p 0.0.0.0:1099:1099 -p 0.0.0.0:60000:60000 -v <absolute any host path to log>:/logs -v <absolute any host path to inputdata>:/inputdata 
</code></p>
<h3> OR </h3>
<p><b>By Marathon Deployment (Recommended):</b></br>
Edit the number instances required in the Marathon Json and deploy it on the Marathon. UNIQUE constraint is used, hence one SLAVE per VM is considered. The image is already pushed on the Artifactory, hence this json will pull that only. If you are building your own, then edit the Marathon json accordingly.</br>
<code>curl -H "Accept: application/json" -H "Content-Type: application/json" http://<master-node>:8080/v2/apps --data @sample_jmeterslave.json</code></p>
</br>
<p>The SLAVES will run for indefinite time till they are killed.</p>

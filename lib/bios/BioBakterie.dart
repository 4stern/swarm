part of swarm;

class Bakterie extends Bio {
    Bakterie
    ({
        Bio parent, Bio child, 
        num startValue: 0, 
        double createChildsPerSecond: 0.0 
    }) : super (
    	parent: parent, 
    	child: child, 
    	startValue: startValue, 
    	createChildsPerSecond: createChildsPerSecond 
    ){
        this.increaser = 1000;
        this.name = "Bakterie";
    }
}

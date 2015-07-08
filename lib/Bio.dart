library swarm;

/*abstract class CounterInterface {
    void add();
}*/

class Counter /*implements CounterInterface*/ {

    num count;

    Counter({num value: 0}){
        this.count = value;
    }

    void add(num value) {
        this.count += value;
    }
}

class Bio {
    static num instances = 0;

    Bio parent;
    Bio child;
    Counter counter;
    double createChildsPerSecond;
    String name;

    Bio({this.parent, this.child, num startValue: 0, this.createChildsPerSecond: 0.0 }){

        instances++;

        this.name = "Bio["+instances.toString()+"]";

        //this.createChildsPerSecond = createChildsPerSecond;
        this.counter = new Counter(value: startValue);

    }

    bool hasParent() => this.parent!=null;
    bool hasChild() => this.child!=null;

    Bio getParent() => this.parent;
    Bio getChild() => this.child;

    void setParent(Bio parent) {
        this.parent = parent;
    }

    void setChild(Bio child) {
        this.child = child;
    }

    void calc() {
        if (hasChild()) {
            num additionalCount = this.counter.count * this.createChildsPerSecond;
            this.child.counter.add(additionalCount);
        }
    }
}
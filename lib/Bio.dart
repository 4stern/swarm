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

    void sub(num value) {
        this.count -= value;
    }

    String toString() {
        return count.toString();
    }

    int toInt() {
        return count.toInt();
    }
}

class Bio {
    static num instances = 0;

    Bio parent;
    Bio child;
    Counter counter;
    double createChildsPerSecond;
    String name;
    num lastCalcTime;

    num increaser = 100;

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

    void onCalc(int timeDifferenceInMilliseconds) {
        num additionalCount = (this.counter.count * this.createChildsPerSecond) * timeDifferenceInMilliseconds / 1000;
        this.child.counter.add(additionalCount); 
    }

    void increaseCounter(int count) {
        if (canIncreaseCounter(count) && hasChild()) {
            this.child.counter.sub(this.increaser*count);
            this.counter.add(count);
        }
    }
    bool canIncreaseCounter(int count){
        bool can = false;
        if (hasChild()) {
            int childCounter = this.child.counter.toInt();
            if (childCounter >= this.increaser*count) {
                can = true;
            }
        }
        return can;
    }

    int possibleIncrease() {
        int possible = 0;
        if (hasChild()) {
            int childCounter = this.child.counter.toInt();
            possible = (childCounter / this.increaser).toInt();
        }
        return possible;
    }

    /*  */
    void calc() {
        if (hasChild()) {
            if (lastCalcTime==null)  {
                lastCalcTime = new DateTime.now().millisecondsSinceEpoch;
            }
            num currentCalcTime = new DateTime.now().millisecondsSinceEpoch;
            if (currentCalcTime != lastCalcTime) {
                int timeDifferenceInMilliseconds = currentCalcTime - lastCalcTime;

                onCalc(timeDifferenceInMilliseconds);              

                lastCalcTime = currentCalcTime;
            }
        }
    }
}

class Bakterie extends Bio {
    Bakterie
    ({
        Bio parent, Bio child, 
        num startValue: 0, double createChildsPerSecond: 0.0 }) : super(parent: parent, child: child, startValue: startValue, createChildsPerSecond: createChildsPerSecond 
    ){
        this.increaser = 1000;
        this.name = "Bakterie";
    }
}

























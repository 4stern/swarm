part of swarm;

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






















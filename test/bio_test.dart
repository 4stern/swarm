library swarm;

import 'package:swarm/bio.dart';

void main() {
    List<Bio> bios = new List<Bio>();

    // create
    for(num i=0; i<5; i++) {
        bios.add(new Bio(
            startValue:             i==0 || i==1 || i==2 ? 10   : 0,
            createChildsPerSecond:  i==1 || i==2         ?  1.0 : 0.0
        ));
    }

    // links
    for(num i=0; i<bios.length-1; i++) {
        Bio bio = bios[i];
        Bio parent = bios[i+1];

        bio.setParent(parent);
        parent.setChild(bio);
    }

    for(num i=bios.length-1; i>=0; i--) {
        Bio bio = bios[i];
        print(bio.name);
        if(bio.hasParent())print('\t..has Parent '+bio.getParent().name);
        if(bio.hasChild())print('\t..has Child '+bio.getChild().name);
        print('\tcount '+bio.counter.count.toString());
        print('\tquote '+bio.createChildsPerSecond.toString());
    }


    for (var time=0; time<100; time++) {
        for (var i=0; i<bios.length; i++) {
            Bio bio = bios[i];
            bio.calc();
        }
    }

    print('-------------------------------------------------------');

    for(num i=bios.length-1; i>=0; i--) {
        Bio bio = bios[i];
        print(bio.name);
        if(bio.hasParent())print('\t..has Parent '+bio.getParent().name);
        if(bio.hasChild())print('\t..has Child '+bio.getChild().name);
        print('\tcount '+bio.counter.count.toString());
        print('\tquote '+bio.createChildsPerSecond.toString());
    }


}
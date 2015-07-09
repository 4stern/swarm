library swarm;

import 'package:swarm/Bio.dart';
import 'dart:io';

void main() {
    List<Bio> bios = new List<Bio>();

    // create
    for(num i=0; i<3; i++) {
        bios.add(new Bio(
            startValue:             i==0 || i==1 || i==2 ? 10   : 0,
            createChildsPerSecond:  i==1 || i==2         ?  1.0 : 0.0
        ));
    }
    bios.add(new Bakterie(
        startValue:1, createChildsPerSecond: 1.0
    ));

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


    /*for (var time=0; time<100; time++) {
        for (var i=0; i<bios.length; i++) {
            Bio bio = bios[i];
            bio.calc();
        }
    }*/

    print('-------------------------------------------------------');

    while (true) {

        for (var time=0; time<100; time++) {
            for (var i=0; i<bios.length; i++) {
                Bio bio = bios[i];
                bio.calc();
            }
        }



        /* start autobuy*/
        print(bios[3].possibleIncrease());
        if (bios[3].possibleIncrease() > 0) {
            bios[3].increaseCounter(bios[3].possibleIncrease());
        }
        print(bios[2].possibleIncrease());
        if (bios[2].possibleIncrease() > 0) {
            bios[2].increaseCounter(bios[2].possibleIncrease());
        }
        print(bios[1].possibleIncrease());
        if (bios[1].possibleIncrease() > 0) {
            bios[1].increaseCounter(bios[1].possibleIncrease());
        }
        /* stop autobuy*/

        for(num i=bios.length-1; i>=0; i--) {
            Bio bio = bios[i];
            print(bio.name);
            if(bio.hasParent())print('\t..has Parent '+bio.getParent().name);
            if(bio.hasChild())print('\t..has Child '+bio.getChild().name);
            print('\tcount '+bio.counter.toInt().toString());
            print('\tquote '+bio.createChildsPerSecond.toString());
        }

        print('-------------------------------------------------------');

        sleep(const Duration(seconds:0.1));
        
    }
}
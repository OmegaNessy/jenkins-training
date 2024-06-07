package org.example;

import java.time.Instant;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        while(true){
            System.out.println("Hello world loop2!" + Instant.now());
            Thread.sleep(1000);
        }
    }
}
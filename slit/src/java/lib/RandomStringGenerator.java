/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import java.util.Random;

/**
 *
 * @author Martin
 */
public class RandomStringGenerator {

    public static String generateRandom() {
        String randomString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789abcdefghijklmnopqrstuvwxyz";
        String verificationString = randomString;
        Random rand = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 25; i++) {
            int randIndex = rand.nextInt(randomString.length());
            sb.append(randomString.charAt(randIndex));
            verificationString = sb.toString();
        }
        return verificationString;

    }
}
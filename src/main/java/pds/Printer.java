package pds;

/**
 * Created by Pablo Tovar on 8/5/2017.
 */
public class Printer {

    public static void array(Double[] array){
        System.out.println("\n");
        for(int i=0; i<array.length; i++){
            System.out.println(array[i]);
        }
    }

    public static void vector(Vectors vector){
        Double[] array = vector.toArray();
        System.out.println("\n");
        for(int i=0; i<array.length; i++){
            System.out.println(array[i]);
        }
    }
}

package pds;

/**
 * Created by Pablo Tovar on 05/05/2017.
 */
public class Operation {

    public static Double Summatory(Double[] array){

        if(array.length==0){
            return null;
        }

        int i;
        Double sum = 0.0;
        for(i=0; i<array.length; i++){
            sum += array[i];
        }
        return sum;
    }


    public static Double Dot(Double[] array1, Double[] array2){
        if(array1.length != array2.length){
            return null;
        }
        int i;
        Double sum = 0.0;
        for(i=0; i<array1.length; i++){
            sum += array1[i]*array2[i];
        }
        return sum;
    }
}

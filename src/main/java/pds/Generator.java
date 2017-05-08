package pds;

/**
 * Created by Pablo Tovar on 7/5/2017.
 */
public class Generator {

    public static Double[] linspace(Double start, Double end, int points){
        if(points<=1){
            return new Double[]{end};
        }
        Double[] array = new Double[points];
        Double fact = (end-start)/(points-1);
        for(int i = 0; i<points; i++){
            array[i] = start+fact*i;
        }
        return array;
    }

}
